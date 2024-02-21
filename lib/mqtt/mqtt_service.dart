import 'dart:async';

import 'package:sm_iot_lab/mqtt/mqtt_client.dart';

class CubeScannedMessage {
  final int cubeScanner;
  final String message;

  CubeScannedMessage({required this.cubeScanner, required this.message});
}

class MQTTService {
  static MQTTClient client = MQTTClient();

  static final StreamController<CubeScannedMessage> currentQRcodeScanned =
      StreamController<CubeScannedMessage>.broadcast();

  static Future<void> setup() async {
    bool connected = false;
    while (!connected) {
      connected = await client.start();
    }

    client.subscribe("sm_iot_lab/pickup_point/+/cube/insert/response");
    client.subscribe("sm_iot_lab/pickup_point/+/cube/+/release/response");
    client.subscribe("sm_iot_lab/cube_scanner/+/cube/scanned");

    client.registerTopicMessageHandler(
        "cube/insert/response", onCubeInsertedMessage);
    client.registerTopicMessageHandler(
        "cube/release/response", onCubeReleasedMessage);
    client.registerTopicMessageHandler(
        "0/cube/scanned", (String message) => onCubeScanned(0, message));
    client.registerTopicMessageHandler(
        "1/cube/scanned", (String message) => onCubeScanned(1, message));
  }

  static void onCubeInsertedMessage(String message) {
    // process the message
  }

  static void onCubeReleasedMessage(String message) {
    // process the message
  }

  static void onCubeScanned(int cubeScanner, String message) {
    currentQRcodeScanned.sink
        .add(CubeScannedMessage(cubeScanner: cubeScanner, message: message));
  }
}

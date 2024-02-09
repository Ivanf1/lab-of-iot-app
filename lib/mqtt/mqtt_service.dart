import 'package:sm_iot_lab/mqtt/mqtt_client.dart';

class MQTTService {
  static MQTTClient client = MQTTClient();

  static Future<void> setup() async {
    bool connected = false;
    while (!connected) {
      connected = await client.start();
    }

    client.subscribe("sm_iot_lab/cube_dropper/+/inserted");
    client.subscribe("sm_iot_lab/cube_dropper/+/released");
    client.subscribe("sm_iot_lab/cube_scanner/+/cube/scanned");

    // client.registerTopicMessageHandler(
    //     "sm_iot_lab/status/info", onStatusMessage);
    client.registerTopicMessageHandler("cube/inserted", onCubeInsertedMessage);
    client.registerTopicMessageHandler("cube/released", onCubeReleasedMessage);
    client.registerTopicMessageHandler("cube/scanned", onCubeScanned);

    // client.sendMessage("sm_iot_lab/status/get", "");
  }

  // static void onStatusMessage(String message) {
  //   // process the status update
  // }

  static void onCubeInsertedMessage(String message) {
    // process the message
  }

  static void onCubeReleasedMessage(String message) {
    // process the message
  }

  static void onCubeScanned(String message) {
    print(message);
    // process the message
  }
}

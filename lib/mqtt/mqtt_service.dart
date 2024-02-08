import 'package:sm_iot_lab/mqtt/mqtt_client.dart';

class MQTTService {
  static MQTTClient client = MQTTClient();

  static Future<void> setup() async {
    await client.start();

    client.subscribe("sm_iot_lab/");
    client.subscribe("sm_iot_lab/cube/inserted");
    client.subscribe("sm_iot_lab/cube/released");

    client.registerTopicMessageHandler(
        "sm_iot_lab/status/info", onStatusMessage);
    client.registerTopicMessageHandler(
        "sm_iot_lab/cube/inserted", onCubeInsertedMessage);
    client.registerTopicMessageHandler(
        "sm_iot_lab/cube/released", onCubeReleasedMessage);

    client.sendMessage("sm_iot_la/status/get", "");
  }

  static void onStatusMessage(String message) {
    // process the status update
  }

  static void onCubeInsertedMessage(String message) {
    // process the message
  }

  static void onCubeReleasedMessage(String message) {
    // process the message
  }
}

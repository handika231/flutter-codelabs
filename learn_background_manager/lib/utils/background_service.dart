import 'dart:isolate';
import 'dart:ui';

final ReceivePort port = ReceivePort();

class BackgroundService {
  //create singleton
  static BackgroundService? _instance;
  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();
  static const String _serviceName = 'BackgroundService';
  static SendPort? _sendPort;
  initIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _serviceName);
  }

  static Future<void> callback() async {
    print('ALARM FIRED!');
    _sendPort ??= IsolateNameServer.lookupPortByName(_serviceName);
    _sendPort?.send(null);
  }

  Future<void> someTask() async {
    print('SOMETASKKKKKKKK===========');
  }
}

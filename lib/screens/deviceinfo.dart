import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class devInfosPage extends StatefulWidget {
  @override
  _devInfosPageState createState() => _devInfosPageState();
}

class _devInfosPageState extends State<devInfosPage> {
  String deviceInfo = "";
  @override
  void initState() {
    initDeviceInfo();
    super.initState();
  }
  void initDeviceInfo() async {   deviceInfo = await devInfos();
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Device Info"),),body: Center(child: Text(deviceInfo),),);
  }
}

Future<String> devInfos() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  return 'Running on ${androidInfo.model}';
}


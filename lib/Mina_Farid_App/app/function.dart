import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:practice_app/Mina_Farid_App/domain/model/model.dart';

Future<DeviceInfo> getDevicesDetails() async {
  String name = "";
  String identifiers = "";
  String version = "";
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      //return android  device info
      var build = await deviceInfoPlugin.androidInfo;
      name = build.brand + "" + build.model;
      identifiers = build.version.toString();
      //
    } else if (Platform.isIOS) {
      var build = await deviceInfoPlugin.iosInfo;
      name = build.name! + "" + build.model!;
      identifiers = build.systemVersion.toString();
    }
  } on PlatformException {
    return DeviceInfo(identifiers, name, version);
  }
  return DeviceInfo(identifiers, name, version);
}

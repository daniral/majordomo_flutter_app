import 'package:flutter/material.dart';
import 'package:home_app/commonWidgets/device_icon.dart';
import 'package:home_app/commonWidgets/device_value.dart';

class DeviceSensorPower extends StatelessWidget {
  const DeviceSensorPower(
      {super.key,
      required this.title,
      required this.id,
      required this.object,
      required this.properties});

  final String title;
  final String id;
  final String object;
  final Map<String, dynamic> properties;

  @override
  Widget build(BuildContext context) {
    String deviceValueString = '';
    double deviceValue = double.parse(properties["value"] ?? '0');
    if (deviceValue>1000) {
      deviceValueString = (deviceValue/1000).toStringAsFixed(2)+' kW';
    } else {
      deviceValueString = deviceValue.toString()+' W';
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          DeviceIcon(
            deviceType: 'sensor_power',
            deviceTitle: title,
            deviceState: properties["status"],
          ),
          Expanded(
              /*1*/
              child: SizedBox(width: 10)),
          DeviceValue(
              value: deviceValueString,
              valueState: properties["status"] ?? '')
        ],
      ),
    );
  }
}

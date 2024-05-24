import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:home_app/commonWidgets/device_icon.dart';
import 'package:home_app/services/service_locator.dart';
import 'package:home_app/pages/page_main_logic.dart';

class DeviceRGB extends StatelessWidget {
  const DeviceRGB(
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
    final stateManager = getIt<MainPageManager>();
    return Row(
      children: [
        DeviceIcon(
          deviceType: 'rgb',
          deviceState: properties['status'],
          deviceTitle: title,
        ),
        Expanded(
            child: SizedBox(
          width: 1,
        )),
        FlutterSwitch(
          value: properties['status'] == "1",
          width: 40,
          height: 20,
          toggleSize: 15.0,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Theme.of(context).colorScheme.secondary,
          borderRadius: 20.0,
          padding: 2.0,
          onToggle: (value) {
            if (value) {
              stateManager.callObjectMethod(object, "turnOn");
            } else {
              stateManager.callObjectMethod(object, "turnOff");
            }
          },
        ),
        /*
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
            properties['status'] == "1" ? Theme.of(context).primaryColor : Colors.white,
            minimumSize: Size(45, 45),
            maximumSize: Size(45, 45),
            padding: const EdgeInsets.all(0),
          ),
          onPressed: () {
            stateManager.callObjectMethod(object, "switch");
          },
          child: Icon(
            Icons.power_settings_new,
            color: properties['status'] == "1" ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).primaryColor,
          ),
        ),*/
      ],
    );
  }
}

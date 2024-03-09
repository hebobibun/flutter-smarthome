import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final IconData iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDeviceBox(
      {super.key,
      required this.smartDeviceName,
      required this.iconPath,
      required this.powerOn,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: powerOn ? Colors.grey[800] : Colors.grey[200], 
            borderRadius: BorderRadius.circular(20)
        ),
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // icon
            Icon(
              iconPath,
              size: 65,
              color: powerOn ? Colors.white : Colors.black,
            ),

            // smart device name + switch
            Expanded(
                child: Text(
              smartDeviceName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: powerOn ? Colors.white : Colors.black,
              ),
            )),
            CupertinoSwitch(value: powerOn, onChanged: onChanged)
          ],
        ),
      ),
    );
  }
}


// Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         color: Colors.blue,
//       ),
//     );
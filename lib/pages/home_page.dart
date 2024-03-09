import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/utils/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // padding constants
  final double horizontalPadding = 25;
  final double verticalPadding = 40.0;

  // list of smart devices
  List mySmartDevices = [
    // [name, icon, status]
    ["Smart Light", Icons.light, true],
    ["Smart TV", Icons.tv, true],
    ["Smart AC", Icons.ac_unit, true],
    ["Smart Fan", Icons.air, true],
  ];

  void powerSwitched(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom AppBar
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu_rounded,
                    color: Color.fromARGB(255, 42, 42, 42),
                    size: 45.0,
                  ),
                  Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 42, 42, 42),
                    size: 45.0,
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // Welcome Home Mitch
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home",
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  Text(
                    "HABIBULLAH",
                    style: GoogleFonts.bebasNeue(
                        textStyle: const TextStyle(fontSize: 72)),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // Smart Devices
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
              ),
            ),

            Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.all(25),
                    itemCount: mySmartDevices.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2],
                        onChanged: ((val) => powerSwitched(val, index)),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

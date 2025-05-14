import 'package:electrical_tools/presentation/widgets/header_menu.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
    bool isTablet = ResponsiveBreakpoints.of(context).isTablet;
    bool isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return Scaffold(
      appBar: HeaderMenu(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Home Page!',
                style: TextStyle(
                  fontSize: isMobile ? 20 : isTablet ? 28 : 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                width: isMobile ? double.infinity : 500,
                child: Text(
                  'This is a responsive card.\n\n'
                      'Current device type: ${isMobile ? 'Mobile' : isTablet ? 'Tablet' : 'Desktop'}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Example Button',
                  style: TextStyle(fontSize: isMobile ? 14 : 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

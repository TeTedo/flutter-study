import 'package:alarm/component/default_layout.dart';
import 'package:alarm/screen/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: Colors.black,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.alarm_outlined,
              color: Colors.white,
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                );
              },
              child: Text('알람 시작하기~'),
            ),
          ],
        ),
      ),
    );
  }
}

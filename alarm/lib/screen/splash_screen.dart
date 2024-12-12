import 'package:alarm/component/default_layout.dart';
import 'package:alarm/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    requestNotificationPermission();
  }

  Future<void> requestNotificationPermission() async {
    // 권한 요청 실행
    final notificationStatus = await Permission.notification.status;

    print(notificationStatus);

    if (await Permission.notification.isDenied) {
      PermissionStatus status = await Permission.notification.request();

      print(status);

      if (status.isGranted) {
        // 권한이 허용되면 HomeScreen으로 이동
        navigateToHome();
      } else {
        // 권한이 거부되면 재요청 버튼 표시
        setState(() {});
      }
    } else {
      // 권한이 이미 허용된 경우 바로 HomeScreen으로 이동
      navigateToHome();
    }
  }

  /// HomeScreen으로 이동
  void navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => HomeScreen(),
      ),
    );
  }

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

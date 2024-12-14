import 'package:alarm/component/default_layout.dart';
import 'package:alarm/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // AppLifecycleState 관찰 추가
    requestNotificationPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // 관찰 제거
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 앱이 포그라운드로 돌아올 때 권한 확인
    if (state == AppLifecycleState.resumed) {
      checkPermissionStatus();
    }
  }

  Future<void> requestNotificationPermission() async {
    // 권한 요청 실행
    final status = await Permission.notification.request();

    print(status);

    if (status != PermissionStatus.permanentlyDenied &&
        status != PermissionStatus.denied) {
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

  /// 권한 상태 확인
  Future<void> checkPermissionStatus() async {
    final status = await Permission.notification.status;
    print("현재 권한 상태: $status");

    if (status == PermissionStatus.granted) {
      navigateToHome(); // 권한이 허용되면 HomeScreen으로 이동
    }
  }

  void requestPermissionAgain() {
    // 권한 요청 실행
    openAppSettings();
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
            ElevatedButton(
              onPressed: requestPermissionAgain,
              child: Text('알람 권한 재요청'),
            ),
          ],
        ),
      ),
    );
  }
}

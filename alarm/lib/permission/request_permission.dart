import 'package:permission_handler/permission_handler.dart';

class RequestPermission {
  /// 알림 권한 요청
  static Future<void> requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      // 알림 권한 요청
      PermissionStatus status = await Permission.notification.request();

      if (status.isGranted) {
        print("알림 권한이 허용되었습니다.");
      } else {
        print("알림 권한이 거부되었습니다.");
      }
    }
  }

  /// 설정 화면으로 이동
  static Future<void> openSettingsIfDenied() async {
    if (await Permission.notification.isPermanentlyDenied) {
      bool opened = await openAppSettings();
      if (opened) {
        print("설정 화면으로 이동했습니다.");
      }
    }
  }
}

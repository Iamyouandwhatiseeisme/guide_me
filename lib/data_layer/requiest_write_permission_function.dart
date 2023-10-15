import 'package:permission_handler/permission_handler.dart';

Future<void> requestWritePermission() async {
  final PermissionStatus status = await Permission.storage.request();

  if (status.isGranted) {
    // Permission granted, you can write to the database.
  } else if (status.isDenied) {
    // Permission denied by the user. You may want to show a message or request again.
  } else if (status.isPermanentlyDenied) {
    // Permission permanently denied by the user. You can open app settings to allow permission.
    openAppSettings();
  }
}

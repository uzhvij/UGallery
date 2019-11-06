import 'package:permission_handler/permission_handler.dart';

class PermissionWorker {
  static final PermissionWorker instance = PermissionWorker._constructor();

  PermissionWorker._constructor();

  factory PermissionWorker() {
    return instance;
  }

  static Future<bool> checkAndGrantPermissions() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);

    if (permission == PermissionStatus.denied ||
        permission == PermissionStatus.disabled) {
      var permissions = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      permission = permissions.entries.elementAt(0).value;
    }
    if(permission == PermissionStatus.granted){
      return true;
    }else return false;
  }
}

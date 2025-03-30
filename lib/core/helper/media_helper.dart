import 'package:flutter/material.dart';

import '../../exports.dart';

class MediaHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<List<File>?> pickImages({bool isMultiple = true}) async {
    List<XFile?>? images = [];

    try {
      if (isMultiple) {
        images = await _picker.pickMultiImage();
      } else {
        images = [
          await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50)
        ];
      }
      List<File>? imageFiles =
          images.map<File>((xfile) => File(xfile?.path ?? "")).toList();
      return imageFiles.isNotEmpty ? imageFiles : null;
    } catch (e) {
      e.toString().logIfDebug();
      final check = await handelPermission();
      if (check != true) return null;
      if (isMultiple) {
        images = await _picker.pickMultiImage();
      } else {
        images = [
          await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50)
        ];
      }
      List<File>? imageFiles =
          images.map<File>((xfile) => File(xfile?.path ?? "")).toList();
      return imageFiles.isNotEmpty ? imageFiles : null;
    }
  }

  static Future<File?> pickMediaFromGallery() async {
    try {
      final media = await _picker.pickMedia();
      return media != null ? File(media.path) : null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      final check = await handelPermission();
      if (check != true) return null;
      final media = await _picker.pickMedia();
      return media != null ? File(media.path) : null;
    }
  }

  static Future<File?> pickImageFromGallery() async {
    try {
      final image = await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);
      return image != null ? File(image.path) : null;
    } catch (e) {
      e.toString().logIfDebug();
      final check = await handelPermission();
      if (check != true) return null;
      final image = await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);
      return image != null ? File(image.path) : null;
    }
  }

  static Future<File?> pickImageFromCamera() async {
    try {
      final image =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      return image != null ? File(image.path) : null;
    } catch (e) {
      e.toString().logIfDebug();
      final check = await handelCameraPermission();
      if (check != true) return null;
      final image =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      return image != null ? File(image.path) : null;
    }
  }

  // static Future<File?> pickFile() async {
  //   try {
  //     final file = await FilePicker.platform.pickFiles();
  //     return file != null ? File(file.files.first.path!) : null;
  //   } catch (e) {
  //     e.toString().logIfDebug();
  //     final check = await handelPermission();
  //     if (check != true) return null;
  //     final file = await FilePicker.platform.pickFiles();
  //     return file != null ? File(file.files.first.path!) : null;
  //   }
  // }

  static handelPermission() async {
    late PermissionStatus status;
    late AndroidDeviceInfo androidInfo;
    if (Platform.isAndroid) {
      androidInfo = await DeviceInfoPlugin().androidInfo;
    }

    if (Platform.isAndroid && androidInfo.version.sdkInt <= 32) {
      /// use [Permissions.storage.status]
      status = await Permission.storage.request();
    } else {
      status = await Permission.photos.request();
      status = await Permission.photosAddOnly.request();
    }
    if (status.isDenied || status.isPermanentlyDenied) {
      await openSettingPermissionDialog();
    } else {
      return true;
    }
  }

  static handelCameraPermission() async {
    late PermissionStatus status;

    status = await Permission.camera.request();

    if (status.isDenied || status.isPermanentlyDenied) {
      await openSettingPermissionDialog();
    } else {
      return true;
    }
  }

  static Future<dynamic> openSettingPermissionDialog() {
    return showDialog(
        context: CustomNavigator.navigatorState.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: CustomTextWidget('Permission'.tr()),
            content: CustomTextWidget(
                'Please enable camera permission from app settings'.tr()),
            actions: [
              TextButtonWidget(
                function: () => Navigator.of(context).pop(),
                text: 'Cancel'.tr(),
              ),
              TextButtonWidget(
                function: () => openAppSettings()
                    .then((value) => Navigator.of(context).pop()),
                text: 'Settings'.tr(),
              ),
            ],
          );
        });
  }
}

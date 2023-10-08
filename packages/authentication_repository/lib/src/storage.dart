import 'dart:developer';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class StorageManage {
  StorageManage() : _storage = FirebaseStorage.instance;

  final FirebaseStorage _storage;

  Future<void> deleteFile(String url) async {
    try {
      Uri uri = Uri.parse(url);
      List<String> parts = uri.path.split("/o/");
      String filePath = Uri.decodeComponent(parts[1]);
      int index = filePath.indexOf("?");
      if (index != -1) {
        filePath = filePath.substring(0, index);
      }
      await _storage.ref(filePath).delete();
      print('Successfully deleted $filePath');
    } on FirebaseException catch (e) {
      throw (e.toString());
    }
  }

  Future<String> getDownloadURL(String refUrl, {String? token}) async {
    try {
      final filePath = await _storage.ref().child(refUrl).getDownloadURL();
      return filePath;
    } on FirebaseException catch (e) {
      log('$e');
      throw (e.toString());
    }
  }

  Future<void> pickAndCropImage(String pathRef) async {
    try {
      final picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      // Check if user has not picked a file
      if (pickedFile == null) {
        throw ("No image selected");
      }

      CropAspectRatioPreset preset;
      CropAspectRatio aspectRatio;

      preset = CropAspectRatioPreset.ratio4x3;
      aspectRatio = const CropAspectRatio(ratioX: 4, ratioY: 3);

      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: aspectRatio,
        aspectRatioPresets: [preset],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.pink,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );

      if (croppedFile != null) {
        final metadata = SettableMetadata(contentType: "image/jpeg");

        final storageRef = _storage.ref();

        await storageRef
            .child(pathRef)
            .putData(await XFile(pickedFile.path).readAsBytes(), metadata);
      }
    } catch (e) {
      log("pickAndCropImage : ${e.toString()}");
      rethrow;
    }
  }
}

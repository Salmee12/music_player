import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

String rgbToHex(Color color) {
  return '${color.red.toRadixString(16).padLeft(2, '0')}${color.green.toRadixString(16).padLeft(2, '0')}${color.blue.toRadixString(16).padLeft(2, '0')}';
}

Color hexToColor(String hex) {
  return Color(int.parse(hex, radix: 16) + 0xFF000000);
}

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
}
/*
Future<File?> pickImage() async {
  try {
    final filePickerRes = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (filePickerRes != null) {
      return File(filePickerRes.files.first.xFile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}

Future<File?> pickAudio() async {
  try {
    final filePickerRes = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (filePickerRes != null) {
      return File(filePickerRes.files.first.xFile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}
*/

Future<File?> pickImage() async {
  try {
    final filePickerRes = await FilePicker.platform.pickFiles(type: FileType.image);

    if (filePickerRes != null && filePickerRes.files.single.path != null) {
      final originalFile = File(filePickerRes.files.single.path!);
      return await _copyToAppDir(originalFile); // copy to safe location
    }
    return null;
  } catch (e) {
    return null;
  }
}

Future<File?> pickAudio() async {
  try {
    final filePickerRes = await FilePicker.platform.pickFiles(type: FileType.audio);

    if (filePickerRes != null && filePickerRes.files.single.path != null) {
      final originalFile = File(filePickerRes.files.single.path!);
      return await _copyToAppDir(originalFile); // copy to safe location
    }
    return null;
  } catch (e) {
    return null;
  }
}

Future<File> _copyToAppDir(File originalFile) async {
  final appDir = await getApplicationDocumentsDirectory();
  final newFile = File('${appDir.path}/${originalFile.uri.pathSegments.last}');
  return await originalFile.copy(newFile.path);
}


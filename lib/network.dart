import 'dart:io';

import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static String path = 'https://platypus.bap5.cc/upload?path=/';
  static List<UploadFile> files = [];

  static Future<String> uploadFile(File file) async {
    var request = MultipartRequest('POST', Uri.parse(path));
    request.files.add(await MultipartFile.fromPath('file', file.path));
    files.add(UploadFile(
        fileName: basename(file.path),
        filePath: file.path,
        fileURL: "https://platypus.bap5.cc/${basename(file.path)}"));

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    return responseBody;
  }

  static void saveUploadFiles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("url", path);
  }
  static void loadUploadFiles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    path = prefs.getString("url") ?? path;
  }
  //  settings path function
  static void setPath(String newPath) {
    path = newPath;
    saveUploadFiles();
  }

  static List<UploadFile> getFiles() {
    return files;
  }

  static void clearFiles() {
    files.clear();
  }
}

class UploadFile {
  final String fileName;
  final String filePath;
  final String fileURL;

  UploadFile(
      {required this.fileName, required this.filePath, this.fileURL = ''});
}

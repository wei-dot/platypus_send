import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static String path = 'https://platypus.bap5.cc/upload?path=/';
  static List<UploadFile> files = [];
  static SharedPreferences? prefs;

  static Future<String> uploadFile(File file) async {
    var request = MultipartRequest('POST', Uri.parse(path));
    request.files.add(await MultipartFile.fromPath('file', file.path));
    files.add(UploadFile(
        fileName: basename(file.path),
        fileURL: "https://platypus.bap5.cc/${basename(file.path)}"));
    saveUploadFiles();
    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    return responseBody;
  }

  static void saveUploadFiles() async {
    prefs = await SharedPreferences.getInstance();
    prefs?.setString("url", path);
    prefs?.setString("files", jsonEncode(files));
    prefs?.reload();
  }

  static void loadUploadFiles() async {
    prefs = await SharedPreferences.getInstance();
    path = prefs?.getString("url") ?? path;
    List<dynamic> filesJson = json.decode(prefs?.getString("files") ?? "[]");
    files = filesJson.map<UploadFile>((e) => UploadFile.fromJson(e)).toList();
  }

  //  settings path function
  static void setPath(String newPath) {
    path = newPath;
    saveUploadFiles();
  }

  static void clearFiles() async {
    prefs = await SharedPreferences.getInstance();
    files.clear();
    prefs?.remove("files");
  }
}

class UploadFile {
  final String fileName;
  final String fileURL;

  UploadFile({required this.fileName, this.fileURL = ''});

  Map toJson() => {
        'fileName': fileName,
        'fileURL': fileURL,
      };

  static fromJson(Map json) =>
      UploadFile(fileName: json['fileName'], fileURL: json['fileURL']);
}

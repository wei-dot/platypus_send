import 'dart:io';

import 'package:http/http.dart';

class ApiClient {
  static String path = 'https://platypus.bap5.cc/upload?path=/';

  static Future<String> uploadFile(File file) async {
    var request = MultipartRequest('POST', Uri.parse(path));
    request.files.add(await MultipartFile.fromPath('file', file.path));
    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    return responseBody;


  }
  //  settings path function
  static void setPath(String newPath) {
    path = newPath;
  }

}

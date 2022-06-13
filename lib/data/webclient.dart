import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class WebClient {
  WebClient();
  static const ip = "https://stagingshoppe.carclenx.com";
  static const token =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjoiNjI5YWY1YTJkNzdmNTk0NzFhYjI0MDA3IiwidXNlcm5hbWUiOiJ0ZWNobmljYWx0ZXN0Iiwicm9sZSI6W3siX2lkIjoiNjIxYTA0MTdmZjk4ODdhNWUxYzE5YTkwIiwibmFtZSI6InZlbmRvciIsIl9fdiI6MH1dLCJuYW1lIjoiVGVjaG5pY2FsIFRlc3QiLCJlbWFpbCI6InRlY2hpbmljYWx0ZXN0QGdtYWlsLmNvbSIsInBob25lIjoiNjk0MjA2OTQyMCJ9LCJpYXQiOjE2NTQzMjI3NTQsImV4cCI6MTk2OTg5ODc1NH0.ih0Mxu0ReMhQzPeyv8Rm_2Tvq3pu-erj47QW_VN3JZk';

  static Future<dynamic> post(url, data) async {
    Map sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }

    var body = json.encode(sendData);

    var response = await http.post(
      Uri.parse(ip + url),
      headers: {"Content-Type": "application/json", "Authorization": token},
      body: body,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": "Error ${response.statusCode}",
        "message": "Invalid Request",
      };
      response.statusCode == 400
          ? Fluttertoast.showToast(msg: error['message']!)
          : {};
      return error;
    }
  }

  static Future<dynamic> get(url) async {
    var response = await http.get(
      Uri.parse(ip + url),
      headers: {
        "Content-Type": "application/json",
        "Connection": "Keep-Alive",
        "Authorization": token
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": "Error ${response.statusCode}",
        "message": "Invalid Request",
      };
      response.statusCode == 400
          ? Fluttertoast.showToast(msg: error['message']!)
          : {};
      return error;
    }
  }

  static Future<dynamic> files(
      String url, String image, String id) async {
    var request = http.MultipartRequest('POST', Uri.parse(ip + url));

    request.headers
        .addAll({'Content-Type': 'application/form-data', 'token': token});
    if (image.isNotEmpty) {
      request.files.add(http.MultipartFile.fromBytes(
          'upload', File(image).readAsBytesSync(),
          filename: image.split('/').last));
     

      request.fields['id'] = id;
    }
    try {
      http.Response response =
          await http.Response.fromStream(await request.send());
      if (json.decode(response.body)['status']) {
        return jsonDecode(response.body);
      }
      // ignore: empty_catches
    } catch (e) {}
  }
}

library captcha_solver;
import 'dart:convert';
import 'dart:io';
import 'dart:io' as IO;
import 'package:http/http.dart' as http;


/// to CREATE TASK, we send a POST Request to endpoint :
String createTaskUrl = 'https://api.scraptcha.com/createTask';

/// to GET TASK RESULT, we send a POST Request to endpoint :
String getTaskResultUrl = 'https://api.scraptcha.com/getTaskResult';


class CaptchaSolver {
  /// API Key
  late String apiKey ;
  CaptchaSolver(this.apiKey);

/// private function : Sends HTTP requests to an HTTP server and receives responses
Future <String?> _request (String url , Map inputs)
async {

 HttpClient client = HttpClient();
 HttpClientRequest req = await client.postUrl(Uri.parse(url));
 req.headers.set('Content-Type', 'application/json');
 req.contentLength = utf8.encode(json.encode(inputs)).length;
 req.add(utf8.encode(json.encode(inputs)));
 HttpClientResponse response =  await req.close();
 print(response.statusCode);
 String resp = await response.transform(utf8.decoder).join();

 client.close();
 return resp;



}

/// function to send post request to the endpoints (createTask and getTaskResult) and receive reponse
  recaptcha(Map inputs) async {
  final event = await _request(createTaskUrl, inputs);
  final response = json.decode(event!);
  print(event);
  Map headers = {'clientKey' :apiKey, 'taskId': response['taskId'] };
  var res = await _request(getTaskResultUrl, headers);
  var result = await json.decode('$res');

  return result;


  }

  imageMemoryToText(Map inputs) async{
    String image= inputs["task"]["body"];
    final bytes = await IO.File(image).readAsBytesSync();
    String imageBase64 =  base64Encode(bytes);
    inputs["task"]["body"]=imageBase64;
    final event = await _request(createTaskUrl, inputs);
    final res = json.decode('$event');
    Map headers = {'clientKey' :apiKey, 'taskId': res['taskId'] };
    var response = await _request(getTaskResultUrl, headers);
    var result = await json.decode('$response');
    return result;

  }
  imageLinkToText(Map inputs) async{
    http.Response response = await http.get(Uri.parse(inputs["task"]["body"]));
    final bytes = response.bodyBytes;
    String imageBase64 =  base64Encode(bytes);
    inputs["task"]["body"]=imageBase64;
    final event = await _request(createTaskUrl, inputs);
    final res = json.decode('$event');
    Map headers = {'clientKey' :apiKey, 'taskId': res['taskId'] };
    var resp = await _request(getTaskResultUrl, headers);
    var result = await json.decode('$resp');
    return result;

  }


  ///

}

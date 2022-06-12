library captcha_solver;
import 'dart:convert';
import 'dart:io';


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
  recaptchaV2(Map inputs) async {
  final event = await _request(createTaskUrl, inputs);
  final response = json.decode(event!);
  print(event);
  Map headers = {'clientKey' :apiKey, 'taskId': response['taskId'] };
  var res = await _request(getTaskResultUrl, headers);
  var result = await json.decode('$res');

  return result;


  }


  ///

}

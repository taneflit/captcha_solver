import 'package:captcha_solver/captcha_solver.dart';

void main() async {

  /// Initiate query Properties
  String apiKey = 'YOUR_API_KEY';
  String websiteURL = 'http://mywebsite.com/recaptcha/test.php';
  String websiteKey = 'YOUR_WEBSITE_KEY';
 /// Initiate CaptchaSolver
  CaptchaSolver captchaSolver = CaptchaSolver(apiKey);
/// Example of the request
  Map inputs = {
  "clientKey": "deab419c029e9e33cbaacab42b36ff1b833c4451b4f8cbf4a72703750b9674d1",
  "task": {
  "type": "RecaptchaV3TaskProxyless", // type of captcha
  "websiteURL": websiteURL,
  "websiteKey": websiteKey,
  "minScore": 0.3,
  "pageAction": "verify",
  "isEnterprise": false
  }
};
  /// Get captcha solution
  Map response = await captchaSolver.recaptcha(inputs);
  print('response: $response');
  print(response['solution']['gRecaptchaResponse']);

}



/* /// Initiate query Properties
  String apiKey = 'YOUR_API_KEY';
  String imageMemory = 'lib/captcha.jpg';
  String imageLink = 'https://api.vk.com/captcha.php?sid=1';
  /// Initiate CaptchaSolver
  CaptchaSolver captchaSolver = CaptchaSolver(apiKey);
  /// Example of the request
  Map inputs = {
    "clientKey": apiKey,
    "task": {
      "type": "ImageToTextTask",
      "body": imageMemory // or imageLink
    }
  };
  /// Get captcha solution
  Map response = await captchaSolver.imageMemoryToText(inputs); // Or imageLinkToText()
  print('response: $response');
  print(response['solution']['text']);*/
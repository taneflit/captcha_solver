import 'package:captcha_solver/captcha_solver.dart';

void main() async {

  /// Initiate query Properties
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
  print(response['solution']['text']);

}


/*
  /// Initiate query Properties
  String apiKey = 'YOUR_API_KEY';
  String websiteURL = 'http://mywebsite.com/recaptcha/test.php';
  String websiteKey = 'YOUR_WEBSITE_KEY';
 /// Initiate CaptchaSolver
  CaptchaSolver captchaSolver = CaptchaSolver(apiKey);
/// Example of the request
  Map inputs = {
    "clientKey": apiKey,
    "task": {
      "type": "RecaptchaV2TaskProxyless",
      "websiteURL": websiteURL,
      "websiteKey": websiteKey,
      "isInvisible": false
    }
  };
  /// Get captcha solution
  Map response = await captchaSolver.recaptchaV2(inputs);
  print('response: $response');
  print(response['solution']['text']);*/
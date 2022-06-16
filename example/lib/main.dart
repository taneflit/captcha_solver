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
    "clientKey": apiKey,
    "task": {
      "type": "RecaptchaV2TaskProxyless",
      "websiteURL": websiteURL,
      "websiteKey": websiteKey,
      "isInvisible": false
    }
  };
  /// Get captcha solution
  Map response = await captchaSolver.recaptcha(inputs);
  print('response: $response');
  if(response['status']=='ready') {
    print(response['solution']['gRecaptchaResponse']);
  }
}
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
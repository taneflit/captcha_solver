<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

## SCRAPTCHA.com
## Captcha Solver

<img alt="ScreenShot" src="https://github.com/taneflit/captcha_solver/blob/master/screen2.png"/>

To use the captcha solution you need to register on the resource and top up your balance - [https://dashboard.scraptcha.com/fr/dashboard](https://dashboard.scraptcha.com/fr/dashboard)
Documentation -[https://scraptcha.com/documentation/](https://scraptcha.com/documentation/)

## Features

Whether you need to autofill a large number of forms, for various purposes: web scraping, making unlimited edition purchases, performing repetitive tasks online, etc. But you quickly find yourself confronted with the CAPTCHAs resolution (which stands for Completely Automated Public Turing Test to tell Computers and Humans Apart) to prove that you are indeed a human and not a robot.

The solution to solve these CAPTCHAs and hijack them, but how? This is where CAPTCHas and reCAPTCHAs resolution services come in, such as scraptcha.com, which is an infallible, fast and efficient resolution service.


## Getting started

You should ensure that you add the router as a dependency in your flutter project.

```yaml
dependencies:
  captcha_solver: ^1.0.0
```

## Usage
## Image to Text 
A normal CAPTCHA is an image containing distorted text that can only be read by humans. to solve this type of CAPTCHA the user is required to enter the text of the image.
You can use imageMemoryToText() function for local images or imageLinkToText() for images from the site.
YOUR_API_KEY : You can find the API  key [here](https://dashboard.scraptcha.com/fr/dashboard)
![ScreenShot](/example/lib/captcha.jpg)
```dart
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
  if(response['status']=='ready') {
    print(response['solution']['text']);
  }
}
```
## reCAPTCHA v2
reCAPTCHA v2 requires the user to check the "I'm not a robot" box and can offer them an image recognition challenge.
YOUR_WEBSITE_KEY : reCAPTCHA website key - for more details : [https://scraptcha.com/documentation/](https://scraptcha.com/documentation/)
YOUR_API_KEY : You can find the API  key [here](https://dashboard.scraptcha.com/fr/dashboard)
![ScreenShot](/images/reCAPTCHAv2.jpg)
```dart
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


```
## reCAPTCHA V3
reCAPTCHA v3 is somewhat similar to reCAPTCHA V2. reCAPTCHA V3 works in the background, does not require user interaction and generates a score based on user behavior. The higher the score, the more likely the user is human.

![ScreenShot](/images/recaptcha-3-768x426.png)
```dart
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
  if(response['status']=='ready') {
    print(response['solution']['gRecaptchaResponse']);
  }
}

```
## FunCAPTCHA - Arkose Labs
This type of task solves the arkoselabs.com conundrum in our worker browsers. You submit the public key and the website address then you will receive a token when the task is completed. This is the token you will need to submit your forms with Arkoselabs captcha.
![ScreenShot](/images/funcaptcha1.e289a39-1.jpg)
```dart

import 'package:captcha_solver/captcha_solver.dart';

void main() async {

  /// Initiate query Properties
  String apiKey = 'YOUR_API_KEY';
  String websiteURL = 'https://account.battle .net/creation/flow/creation-full';
  String websitePublicKey = 'YOUR_WEBSITE_KEY';
 /// Initiate CaptchaSolver
  CaptchaSolver captchaSolver = CaptchaSolver(apiKey);
/// Example of the request
  Map inputs = {
    "clientKey": "YOUR_API_KEY",
    "task": {
      "type": "FunCaptchaTaskProxyless",
      "websitePublicKey": websitePublicKey,
      "websiteURL": websiteURL
  }
};
  /// Get captcha solution
  Map response = await captchaSolver.recaptcha(inputs);
  print('response: $response');
  if(response['status']=='ready') {
    print(response['solution']['token']);
  }
}
```
## hCAPTCHA
HCAPTCHA is a most popular reCAPTCHA alternative. The properties of this task are the same as reCAPTCHA except for the type property.
![ScreenShot](/images/hcaptcha_example1.f7d96e5-1.png)
```dart
import 'package:captcha_solver/captcha_solver.dart';

void main() async {
  /// Initiate query Properties
  String apiKey = 'YOUR_API_KEY';
  String websiteURL = 'https://hcaptcha.com/';
  String websiteKey = 'YOUR_WEBSITE_KEY';
  /// Initiate CaptchaSolver
  CaptchaSolver captchaSolver = CaptchaSolver(apiKey);
  /// Example of the request
  Map inputs = {
    "clientKey": apiKey,
    "task": {
      "type": "HCaptchaTaskProxyless",
      "websiteURL": websiteURL,
      "websiteKey": websiteKey,
  
    }
  };
  /// Get captcha solution
  Map response = await captchaSolver.recaptcha(inputs);
  print('response: $response');
  if(response['status']=='ready') {
    print(response['solution']['gRecaptchaResponse']);
  }
}


```



## Additional information
Scraptcha uses two methods to solve its CAPTCHAs:
A CAPTCHA solving service based on these humans: The service has hired human workers to solve CAPTCHAs, which are constantly online. When you submit your CAPTCHA, Scraptcha passes it on to the human workers who solve the text and send it back.
OCR (optical character recognition) solutions
In this method, captcha solving is done automatically using OCR technology.

for more information : [https://scraptcha.com/documentation/](https://scraptcha.com/documentation/)
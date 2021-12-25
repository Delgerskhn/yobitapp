// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

/*
make sure chromedriver is started -- if not download chromedriver and start one

RUN BY FOLLOWING COMMAND
//flutter drive --target=test_driver/auth/signin.dart --browser-name=chrome --release

*/

void main() {
  group('Main screen navigation tests', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final emailInputFinder = find.byValueKey('email');
    final passInputFinder = find.byValueKey('pass');
    final btnSignIn = find.byValueKey('signin');
    final alertToast = find.byValueKey('alertToast');

    late FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      driver.close();
    });

    test('Push to signin screen if not authenticated', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      await driver.tap(emailInputFinder); // acquire focus
      await driver.enterText('delgersaikhan2001@gmail.com');
      await driver.tap(passInputFinder); // acquire focus
      await driver.enterText('Pass1234!');
      await driver.tap(btnSignIn);
      expect(await driver.getText(alertToast), "Wrong credentials!");
    });

    test('Push to home screen if authenticated', () async {
      // First, tap the button.

      // Then, verify the counter text is incremented by 1.
    });

    // test('increments the counter during animation', () async {
    //   await driver.runUnsynchronized(() async {
    //     // First, tap the button.
    //     await driver.tap(buttonFinder);

    //     // Then, verify the counter text is incremented by 1.
    //     expect(await driver.getText(counterTextFinder), "1");
    //   });
    // });
  });
}

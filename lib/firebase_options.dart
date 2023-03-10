// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsKvaZqgQPWzvFX1vaMubZ7D9vnIiX3Hg',
    appId: '1:959405557706:android:1898522e7d30dc0f0df133',
    messagingSenderId: '959405557706',
    projectId: 'okintresting',
    storageBucket: 'okintresting.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKuW84P4hdXaY3RHdZWz--vOrukH8O5O8',
    appId: '1:959405557706:ios:86a84918aea822c60df133',
    messagingSenderId: '959405557706',
    projectId: 'okintresting',
    storageBucket: 'okintresting.appspot.com',
    androidClientId: '959405557706-ipkehgk1uc9onf8pkn7lhbl8hgfcq2ic.apps.googleusercontent.com',
    iosClientId: '959405557706-0ipr6l7371afdh39tgock3g2d7sh1djn.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled1',
  );
}

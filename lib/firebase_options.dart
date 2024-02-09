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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBIqecAZCLSpdytVaTR1AhgO6BuUihLAh4',
    appId: '1:466639011197:web:e1c5ea177ee1c398306014',
    messagingSenderId: '466639011197',
    projectId: 'translator-firebase-aa71f',
    authDomain: 'translator-firebase-aa71f.firebaseapp.com',
    storageBucket: 'translator-firebase-aa71f.appspot.com',
    measurementId: 'G-59J4Y6GL7R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8CkXNGLHavNPwI-39_g7dvhc831wWMRo',
    appId: '1:466639011197:android:2401718a3456d4c0306014',
    messagingSenderId: '466639011197',
    projectId: 'translator-firebase-aa71f',
    storageBucket: 'translator-firebase-aa71f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBu1AQO9VNBKj6C8--BPAL6ImV2TTRM898',
    appId: '1:466639011197:ios:2e116f757feea545306014',
    messagingSenderId: '466639011197',
    projectId: 'translator-firebase-aa71f',
    storageBucket: 'translator-firebase-aa71f.appspot.com',
    iosBundleId: 'com.example.translatorApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBu1AQO9VNBKj6C8--BPAL6ImV2TTRM898',
    appId: '1:466639011197:ios:c7204893333bc7a6306014',
    messagingSenderId: '466639011197',
    projectId: 'translator-firebase-aa71f',
    storageBucket: 'translator-firebase-aa71f.appspot.com',
    iosBundleId: 'com.example.translatorApp.RunnerTests',
  );
}

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
    apiKey: 'AIzaSyC7IuQ9OcjoQ2dnpx0gqMC_MyiHdQXUXUk',
    appId: '1:697975818990:web:86771b73fbbee74c4501ff',
    messagingSenderId: '697975818990',
    projectId: 'nfcproject-ef738',
    authDomain: 'nfcproject-ef738.firebaseapp.com',
    storageBucket: 'nfcproject-ef738.appspot.com',
    measurementId: 'G-GP2KRY87T7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6greOg_0XrE_p1d5o4R12mbf4x6FxzFg',
    appId: '1:697975818990:android:7718bdcaf2fc95df4501ff',
    messagingSenderId: '697975818990',
    projectId: 'nfcproject-ef738',
    storageBucket: 'nfcproject-ef738.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDG3St5E3R1kN_yjAb8BpBUoFkHZ7fivdY',
    appId: '1:697975818990:ios:4e04b8fcd629970f4501ff',
    messagingSenderId: '697975818990',
    projectId: 'nfcproject-ef738',
    storageBucket: 'nfcproject-ef738.appspot.com',
    iosClientId: '697975818990-gvq17d5pi3f24gv16uhk0g5prfhe1u31.apps.googleusercontent.com',
    iosBundleId: 'com.example.nfcProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDG3St5E3R1kN_yjAb8BpBUoFkHZ7fivdY',
    appId: '1:697975818990:ios:4e04b8fcd629970f4501ff',
    messagingSenderId: '697975818990',
    projectId: 'nfcproject-ef738',
    storageBucket: 'nfcproject-ef738.appspot.com',
    iosClientId: '697975818990-gvq17d5pi3f24gv16uhk0g5prfhe1u31.apps.googleusercontent.com',
    iosBundleId: 'com.example.nfcProject',
  );
}
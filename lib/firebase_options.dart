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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC4jawKCQrSJYH2q4NXKaeKJY7nVhLzB7Q',
    appId: '1:4022647474:web:76f773db6bdaf790a527ab',
    messagingSenderId: '4022647474',
    projectId: 'mentorapp-c09cf',
    authDomain: 'mentorapp-c09cf.firebaseapp.com',
    databaseURL: 'https://mentorapp-c09cf-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'mentorapp-c09cf.appspot.com',
    measurementId: 'G-WJ7XHSVVJ7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6LhM8_M9x6dfba7VTB-5K1ufbckNlkjI',
    appId: '1:4022647474:android:47329be1ed68230ca527ab',
    messagingSenderId: '4022647474',
    projectId: 'mentorapp-c09cf',
    databaseURL: 'https://mentorapp-c09cf-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'mentorapp-c09cf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1M0FbfEAyJTIzX8Mybm4eePWcRguQ5nU',
    appId: '1:4022647474:ios:1fb7e2177a3ad9f6a527ab',
    messagingSenderId: '4022647474',
    projectId: 'mentorapp-c09cf',
    databaseURL: 'https://mentorapp-c09cf-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'mentorapp-c09cf.appspot.com',
    iosClientId: '4022647474-76sb5g9gnpt0l2slm64uvcjt27q3q6rp.apps.googleusercontent.com',
    iosBundleId: 'com.example.mentorApp',
  );
}
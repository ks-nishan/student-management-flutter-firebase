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
    apiKey: 'AIzaSyBzS23YE3plOdSDL7soebcH_C4Lc8JIMXQ',
    appId: '1:389423632630:web:460dcda678a985dd749cd7',
    messagingSenderId: '389423632630',
    projectId: 'student-management-flutt-e5a0a',
    authDomain: 'student-management-flutt-e5a0a.firebaseapp.com',
    storageBucket: 'student-management-flutt-e5a0a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjagvzTSdZdddso9iOO8aV6-yTmhx_ggU',
    appId: '1:389423632630:android:65719f89f5bc0f4b749cd7',
    messagingSenderId: '389423632630',
    projectId: 'student-management-flutt-e5a0a',
    storageBucket: 'student-management-flutt-e5a0a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAz7qXjTRWQBUX7QKhOeHq1OOsQDveV58I',
    appId: '1:389423632630:ios:1e9d1ffe6dc70f38749cd7',
    messagingSenderId: '389423632630',
    projectId: 'student-management-flutt-e5a0a',
    storageBucket: 'student-management-flutt-e5a0a.appspot.com',
    iosClientId: '389423632630-5jrufpnng2533gk7dqkmt44a6rln06i1.apps.googleusercontent.com',
    iosBundleId: 'com.example.studentManagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAz7qXjTRWQBUX7QKhOeHq1OOsQDveV58I',
    appId: '1:389423632630:ios:1e9d1ffe6dc70f38749cd7',
    messagingSenderId: '389423632630',
    projectId: 'student-management-flutt-e5a0a',
    storageBucket: 'student-management-flutt-e5a0a.appspot.com',
    iosClientId: '389423632630-5jrufpnng2533gk7dqkmt44a6rln06i1.apps.googleusercontent.com',
    iosBundleId: 'com.example.studentManagement',
  );
}

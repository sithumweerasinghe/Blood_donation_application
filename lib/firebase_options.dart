// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDVImd0M4ZuPSedleCHp9eq0p6-qSrBOp4',
    appId: '1:707686695737:web:920f93cb3d0e264967dee8',
    messagingSenderId: '707686695737',
    projectId: 'bloodproject-c8704',
    authDomain: 'bloodproject-c8704.firebaseapp.com',
    storageBucket: 'bloodproject-c8704.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOmIry6KiwWB8sQIyjgCxj0o1vOuLIYlU',
    appId: '1:707686695737:android:68a2959c347be0fa67dee8',
    messagingSenderId: '707686695737',
    projectId: 'bloodproject-c8704',
    storageBucket: 'bloodproject-c8704.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxXD-OdYIvOTLDkwK4OabiBvsqYOWDJFU',
    appId: '1:707686695737:ios:7b6e6de6fc8a2d7e67dee8',
    messagingSenderId: '707686695737',
    projectId: 'bloodproject-c8704',
    storageBucket: 'bloodproject-c8704.appspot.com',
    iosBundleId: 'com.example.bloodapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxXD-OdYIvOTLDkwK4OabiBvsqYOWDJFU',
    appId: '1:707686695737:ios:7b6e6de6fc8a2d7e67dee8',
    messagingSenderId: '707686695737',
    projectId: 'bloodproject-c8704',
    storageBucket: 'bloodproject-c8704.appspot.com',
    iosBundleId: 'com.example.bloodapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDVImd0M4ZuPSedleCHp9eq0p6-qSrBOp4',
    appId: '1:707686695737:web:e9ae52bda9a5b58467dee8',
    messagingSenderId: '707686695737',
    projectId: 'bloodproject-c8704',
    authDomain: 'bloodproject-c8704.firebaseapp.com',
    storageBucket: 'bloodproject-c8704.appspot.com',
  );
}

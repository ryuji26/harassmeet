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
    apiKey: 'AIzaSyB2J7bGkpMM6U4lRFM0X0IsBJ9GXQJVwKI',
    appId: '1:103202454304:web:9f437b11d89de38fca3545',
    messagingSenderId: '103202454304',
    projectId: 'new-harassmeet',
    authDomain: 'new-harassmeet.firebaseapp.com',
    storageBucket: 'new-harassmeet.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC12Knxq3svks7-WebGHzcBRYTT0Av4Fkw',
    appId: '1:103202454304:android:5b4fcd52a0a3c122ca3545',
    messagingSenderId: '103202454304',
    projectId: 'new-harassmeet',
    storageBucket: 'new-harassmeet.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxJFBkf1crUgvAx9dVARGCZU2UUO5_-5Y',
    appId: '1:103202454304:ios:b3b0f84a88570423ca3545',
    messagingSenderId: '103202454304',
    projectId: 'new-harassmeet',
    storageBucket: 'new-harassmeet.appspot.com',
    iosClientId: '103202454304-sjd39lm2a36asddh3mevb1d1b0gmjvpg.apps.googleusercontent.com',
    iosBundleId: 'com.example.harassmeet',
  );
}

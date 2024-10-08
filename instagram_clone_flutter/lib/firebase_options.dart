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
    apiKey: 'AIzaSyAMll7MRxm3qnQZbOJASCtRWDOD3nPBkV8',
    appId: '1:1040080755447:android:66fd8f70417fc5be2191f2',
    messagingSenderId: '1040080755447',
    projectId: 'chat-app-a2469',
    storageBucket: 'chat-app-a2469.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAn3W53WBwTHv4ersawmWkoyJuKo5eixLU',
    appId: '1:1040080755447:ios:6caea01e33f9070c2191f2',
    messagingSenderId: '1040080755447',
    projectId: 'chat-app-a2469',
    storageBucket: 'chat-app-a2469.appspot.com',
    androidClientId: '1040080755447-jr49b5isboiich57ui8k4ddgudj3u4ir.apps.googleusercontent.com',
    iosClientId: '1040080755447-jj0825agiqs8nsoljfh8rl2jbs4123gj.apps.googleusercontent.com',
    iosBundleId: 'com.example.practiceWidgets',
  );
}

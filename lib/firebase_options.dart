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
    apiKey: 'AIzaSyD2d9vC4QCUS66DvBj6pbb_Hf0K_euoRCU',
    appId: '1:860160801827:android:ab5fd44ff6eb5af8948596',
    messagingSenderId: '860160801827',
    projectId: 'whatsapp-messenger-dfc10',
    storageBucket: 'whatsapp-messenger-dfc10.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRjNDgWqx8PYM3PGHqJKaQanMm0xHiVi4',
    appId: '1:860160801827:ios:44ae05d78ce0372f948596',
    messagingSenderId: '860160801827',
    projectId: 'whatsapp-messenger-dfc10',
    storageBucket: 'whatsapp-messenger-dfc10.appspot.com',
    iosClientId: '860160801827-hiqfd00660dc7g7rbs3sdsql7p0tflgi.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsappMe',
  );
}

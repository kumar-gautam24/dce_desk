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
    apiKey: 'AIzaSyDpYym0HnMXkHywgocA0hJ43D9YutIg_0I',
    appId: '1:836424310070:web:274cf7d0fdb813e87ea797',
    messagingSenderId: '836424310070',
    projectId: 'my-dce-desk-cse20',
    authDomain: 'my-dce-desk-cse20.firebaseapp.com',
    storageBucket: 'my-dce-desk-cse20.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZ3wWTQ_4AmU2kP6az3ZGDbeWWlUQgOAg',
    appId: '1:836424310070:android:20573dc21f2bafae7ea797',
    messagingSenderId: '836424310070',
    projectId: 'my-dce-desk-cse20',
    storageBucket: 'my-dce-desk-cse20.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDIENHsKTxPDOE3qxMjqpZcK_nMrOO_uMc',
    appId: '1:836424310070:ios:1678edbf012848b67ea797',
    messagingSenderId: '836424310070',
    projectId: 'my-dce-desk-cse20',
    storageBucket: 'my-dce-desk-cse20.appspot.com',
    iosClientId: '836424310070-gnvkjqihfpirbt4sggrn4mrrlmtboq46.apps.googleusercontent.com',
    iosBundleId: 'com.dcedesk.dceDesk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDIENHsKTxPDOE3qxMjqpZcK_nMrOO_uMc',
    appId: '1:836424310070:ios:7fc4461b8726acfe7ea797',
    messagingSenderId: '836424310070',
    projectId: 'my-dce-desk-cse20',
    storageBucket: 'my-dce-desk-cse20.appspot.com',
    iosClientId: '836424310070-fh34m662tpi9aond9mo3sh7tagk7e025.apps.googleusercontent.com',
    iosBundleId: 'com.dcedesk.dceDesk.RunnerTests',
  );
}

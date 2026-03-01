import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions are not configured for web yet.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCV3t8_V8VpcoEKi3_hK4Kxiqr0o5vnZUY',
    appId: '1:640033702754:android:069dbf446992161ed0623b',
    messagingSenderId: '640033702754',
    projectId: 'vite-contact-ba613',
    storageBucket: 'vite-contact-ba613.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtKev31R8VhOy4Hy1ttBGeQTh-4xhhNHQ',
    appId: '1:640033702754:ios:9885de8c6b1957b4d0623b',
    messagingSenderId: '640033702754',
    projectId: 'vite-contact-ba613',
    storageBucket: 'vite-contact-ba613.firebasestorage.app',
    iosBundleId: 'Bookingapp',
  );
}

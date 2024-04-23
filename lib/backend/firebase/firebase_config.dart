import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA0OI9p7bBWJJTfGMQqo7rNrG9xZcPoX08",
            authDomain: "eventosuv-a5b3e.firebaseapp.com",
            projectId: "eventosuv-a5b3e",
            storageBucket: "eventosuv-a5b3e.appspot.com",
            messagingSenderId: "719880073327",
            appId: "1:719880073327:web:b7edaf826e93562e6add9a",
            measurementId: "G-CNVWJZJ480"));
  } else {
    await Firebase.initializeApp();
  }
}

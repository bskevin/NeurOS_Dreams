import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCdDC2ZvuFZPVPVxzO6fagZBotx4bF4bMM",
            authDomain: "neur-o-s-r5lsu7.firebaseapp.com",
            projectId: "neur-o-s-r5lsu7",
            storageBucket: "neur-o-s-r5lsu7.appspot.com",
            messagingSenderId: "515501218681",
            appId: "1:515501218681:web:de3e0f3b6711d77600eda8"));
  } else {
    await Firebase.initializeApp();
  }
}

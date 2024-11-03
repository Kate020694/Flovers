import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAf5dsmJ54b3xZHvKYf3llm0CAy2OH93uw",
            authDomain: "flowers-3qzula.firebaseapp.com",
            projectId: "flowers-3qzula",
            storageBucket: "flowers-3qzula.firebasestorage.app",
            messagingSenderId: "390834732929",
            appId: "1:390834732929:web:e5b89e86d99736dbb0b280"));
  } else {
    await Firebase.initializeApp();
  }
}

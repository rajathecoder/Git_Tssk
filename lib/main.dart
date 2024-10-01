import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:github_mobile_app/view/screen/auth_screen/auth_screen.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'GitHub Mobile App',
          initialRoute: '/', // Define the initial route
          routes: {
            '/': (context) => GithubLoginScreen(), // Login route

          },
          onGenerateRoute: (settings) {
            if (settings.name == '/someOtherRoute') {
            }
            return null; // Fallback route handler if needed
          },
        );
      },
    );
  }
}

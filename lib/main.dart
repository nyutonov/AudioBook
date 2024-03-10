import 'package:audio_book/presentation/screens/home/home_screen.dart';
import 'package:audio_book/presentation/screens/library/library_screen.dart';
import 'package:audio_book/presentation/screens/login/login_bloc.dart';
import 'package:audio_book/presentation/screens/login/login_screen.dart';
import 'package:audio_book/presentation/screens/navigation_bottom/bottom_navigation.dart';
import 'package:audio_book/presentation/screens/register/register_bloc.dart';
import 'package:audio_book/presentation/screens/register/register_screen.dart';
import 'package:audio_book/presentation/screens/search/search_screen.dart';
import 'package:audio_book/presentation/screens/splash/splash_screen.dart';
import 'package:audio_book/theme/theme.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.appAttest,
  );

  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MyApp(),
  //   ),
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        'REGISTER': (context) =>
            BlocProvider(
              create: (context) => RegisterBloc(),
              child: const RegisterScreen(),
            ),
        'LOGIN': (context) =>
            BlocProvider(
              create: (context) => LoginBloc(),
              child: const LoginScreen(),
            ),
        'HOME': (context) => const HomeScreen(),
        'LIBRARY': (context) => const LibraryScreen(),
        'SEARCH': (context) => const SearchScreen(),
        'BOTTOM_NAVIGATION': (context) => const BottomNavigation(),
      },
    );
  }
}


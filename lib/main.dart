import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_me/common/routes/routes.dart';
import 'package:whatsapp_me/common/theme/dark_theme.dart';
import 'package:whatsapp_me/common/theme/light_theme.dart';
import 'package:whatsapp_me/feature/auth/controller/auth_controller.dart';

import 'package:whatsapp_me/feature/welcome/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:whatsapp_me/firebase_options.dart';

import 'feature/home/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Me',
      theme: LightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: ref.watch(userInfoAuthProvider).when(
            data: (user) {
              if (user == null) return const WelcomePage();
              return const HomePage();
            },
            error: (error, trace) {
              return const Scaffold(
                body: Center(
                  child: Text('Something wrong happened'),
                ),
              );
            },
            loading: () => const Scaffold(
              body: Center(
                child: Icon(
                  Icons.whatshot,
                  size: 30,
                ),
              ),
            ),
          ),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}

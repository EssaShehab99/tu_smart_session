import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/style/theme_app.dart';
import '/views/auth/auth_screen.dart';
import '/views/auth/sign_up_screen.dart';
import '/views/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'data/providers/app_state_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  runApp(EasyLocalization(
    fallbackLocale: const Locale('ar', 'SA'),
    // startLocale: const Locale('ar', 'SA'),
    startLocale: const Locale('en', 'US'),
    saveLocale: true,
    supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
    path: 'assets/translations',
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStateManager()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeApp.light,
        home: const AuthScreen(),
      ),
    );
  }
}

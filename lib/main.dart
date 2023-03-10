import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tu_smart_session/data/providers/place_provider.dart';
import 'package:tu_smart_session/views/info_screen/info_screen.dart';
import 'package:tu_smart_session/views/test_screen.dart';
import '/data/providers/advisor_provider.dart';
import '/data/local/sharedpref_helper/preferences.dart';
import '/data/models/user.dart';
import '/data/providers/auth_provider.dart';
import '/views/home/home_screen.dart';
import '/style/theme_app.dart';
import '/views/auth/auth_screen.dart';
import 'package:provider/provider.dart';

import 'data/di/service_locator.dart';
import 'data/local/sharedpref_helper/preference_variable.dart';
import 'data/providers/app_state_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/providers/ask_cody_provider.dart';
import 'firebase_options.dart';
//TODO: Configuration iOS url_launcher
//TODO: Configuration iOS location
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();
  final preferences = Preferences.instance;
  String? date = (await preferences.get(PreferenceVariable.user))?.toString();
  User? user = date == null ? null : User.fromJson(jsonDecode(date));
  runApp(EasyLocalization(
    fallbackLocale: const Locale('ar', 'SA'),
    startLocale: const Locale('en', 'US'),
    saveLocale: true,
    supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
    path: 'assets/translations',
    child: MyApp(user: user),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.user});
  final User? user;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStateManager()),
        ChangeNotifierProvider(create: (_) => AuthProvider()..setUser(user)),
        ChangeNotifierProvider(create: (_) => AdvisorProvider()),
        ChangeNotifierProvider(create: (_) => PlaceProvider()),
        ChangeNotifierProxyProvider<AuthProvider, AskCodyProvider>(
            create: (context) => AskCodyProvider(
                Provider.of<AuthProvider>(context, listen: false).user),
            update: (context, auth, _) => AskCodyProvider(auth.user)),
      ],
      child: MaterialApp(
        title: 'TU Smart Services',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeApp.light,
        // home: TestScreen(),
        home: user == null ? const AuthScreen() : const HomeScreen(),
      ),
    );
  }
}

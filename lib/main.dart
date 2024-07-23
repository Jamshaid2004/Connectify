import 'package:connectify_project/controller/home%20page%20controller/home_page_bloc.dart';
import 'package:connectify_project/controller/login%20signup%20controller/login_signup_bloc.dart';
import 'package:connectify_project/firebase_options.dart';
import 'package:connectify_project/screens/main%20screens/home_page.dart';
import 'package:connectify_project/utils/route_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String title = 'Connectify';
  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginSignupBloc()),
        BlocProvider(create: (context) => HomePageBloc()),
      ],
      child: MaterialApp(
        title: title,
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
              titleLarge: TextStyle(
                  fontFamily: 'Coffee',
                  color: Colors.white,
                  fontSize: width * 0.12)),
          inputDecorationTheme: InputDecorationTheme(
            errorStyle: TextStyle(fontSize: width * 0.025),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width * 0.03),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelStyle: const TextStyle(color: Colors.white),
          ),
          elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(Colors.white)),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.pageAddress,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
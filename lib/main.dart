import 'package:api_calling/API%20%20CALLING/For%20Comments/provider/api.dart';
import 'package:api_calling/API%20%20CALLING/For%20Comments/screen/home_screen.dart';
import 'package:api_calling/Call%20Pixabay%20API%20&%20Represent%20in%20UI/provider/pixabay_provider.dart';
import 'package:api_calling/WALLPAPER/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'API  CALLING/For User/provider/data_provider.dart';
import 'API  CALLING/For User/screen/home/home_page.dart';
import 'Call Pixabay API & Represent in UI/screen/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserApiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CommentsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

import 'package:api_calling/API%20%20CALLING/For%20Comments/provider/api.dart';
import 'package:api_calling/API%20%20CALLING/For%20Comments/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'API  CALLING/For User/provider/data_provider.dart';
import 'API  CALLING/For User/screen/home/home_page.dart';

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
      home: CommentScreen(),
    );
  }
}

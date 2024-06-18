import 'package:api_calling/WALLPAPER/screens/img_path.dart';
import 'package:api_calling/WALLPAPER/screens/wallpaper.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wallpaper App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: RepaintBoundary(
        key: imgKey,
        child: PageView(
          children: [
            ...List.generate(
              10,
              (index) {
                return SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/imgs/img(${index + 1}).jpg',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Imageset();
          showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Set as Wallpaper',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () {
                      setWallpaper(context, AsyncWallpaper.HOME_SCREEN);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Home Screen',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () {
                      setWallpaper(context, AsyncWallpaper.LOCK_SCREEN);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Lock Screen',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () {
                      setWallpaper(context, AsyncWallpaper.BOTH_SCREENS);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Home & Lock Screens',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'cancel',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.wallpaper),
      ),
    );
  }
}

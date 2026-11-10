import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
      return MaterialApp(
        title: 'Profil Rizki Riana Putra',

        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
          ),
        ),

        darkTheme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),

        themeMode: ThemeMode.system,
        home: const ProfilePage(),
      );

  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Profil Mahasiswa',
        ),
      ),
    );
  }
}

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
    return Scaffold(

      // APP BAR
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),

        centerTitle: true,

        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),

      // BAGIAN BODY
            body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                  const SizedBox(height: 20),

              // Foto profil mahasiswa
              const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 16),

              // Nama mahasiswa
              Text(
                'Rizki Riana Putra',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              // NIM mahasiswa
              Text(
                '1124160241',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 5),

              // Program studi
              Text(
                'Teknik Informatika Software Engineering',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
     ),
    );
  }
}


import 'package:flutter/material.dart';
import '../widgets/info_tile.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya'), centerTitle: true),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Bagian perkenalan diri
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    child: const Icon(Icons.person, size: 55),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Tentang Saya',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Haloo! Saya adalah mahasiswa Teknik Informatika dengan '
                    'konsentrasi Software Engineering yang memiliki '
                    'ketertarikan pada dunia teknologi dan '
                    'pengembangan perangkat lunak. Saya senang '
                    'mempelajari hal-hal baru, mengeksplorasi teknologi, '
                    'serta mengembangkan ide menjadi aplikasi yang '
                    'bermanfaat dan memberikan solusi bagi kebutuhan sehari-hari.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Keahlian dan Hobi
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Keahlian dan Hobi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const InfoTile(
                  icon: Icons.phone_android,
                  label: 'Flutter & Dart',
                  value: 'Pengembangan aplikasi mobile.',
                ),
                const InfoTile(
                  icon: Icons.code,
                  label: 'PHP, CodeIgniter & Laravel',
                  value: 'Pengembangan aplikasi berbasis web.',
                ),
                const InfoTile(
                  icon: Icons.interests,
                  label: 'Hobi',
                  value: 'Teknologi, gaming, dan memancing.',
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Bagian Riwayat Pendidikan ditambahkan pada Tahap 6A.3.
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatelessWidget {
  final Profile profile;

  const ProfilePage({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            child: const Icon(
                              Icons.person,
                              size: 65,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            profile.nama,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(profile.nim),
                          Text(profile.prodi),
                          Text(profile.kelas),
                          const SizedBox(height: 16),
                          Text(
                            profile.bio,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Informasi Kontak',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InfoTile(
                          icon: Icons.email_outlined,
                          label: 'Email',
                          value: profile.email,
                        ),
                        InfoTile(
                          icon: Icons.phone_outlined,
                          label: 'Nomor HP',
                          value: profile.noHp,
                        ),
                        InfoTile(
                          icon: Icons.code,
                          label: 'GitHub',
                          value: profile.github,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

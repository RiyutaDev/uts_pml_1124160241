import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;

  const ProfilePage({
    super.key,
    required this.profile,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile _profile;
    @override
void initState() {
  super.initState();

  // Mengambil data profil awal dari ProfilePage.
  _profile = widget.profile;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
appBar: AppBar(
  title: const Text('Profil Mahasiswa'),
  centerTitle: true,
  actions: [
    IconButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tombol Edit Profil siap digunakan'),
          ),
        );
      },
      tooltip: 'Edit Profil',
      icon: const Icon(Icons.edit),
    ),
  ],
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
                            _profile.nama,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(_profile.nim),
                          Text(_profile.prodi),
                          Text(_profile.kelas),
                          const SizedBox(height: 16),
                          Text(
                            _profile.bio,
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
                          value: widget.profile.email,
                        ),
                        InfoTile(
                          icon: Icons.phone_outlined,
                          label: 'Nomor HP',
                          value: widget.profile.noHp,
                        ),
                        InfoTile(
                          icon: Icons.code,
                          label: 'GitHub',
                          value: widget.profile.github,
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

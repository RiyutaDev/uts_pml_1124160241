import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';
import 'about_page.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;

  const ProfilePage({super.key, required this.profile});

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

  Future<void> _editProfile() async {
    // Membuka halaman Edit Profile dan menunggu hasilnya.
    final Profile? profileBaru = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profile: _profile),
      ),
    );

    // Memastikan halaman masih aktif.
    if (!mounted) return;

    // Memperbarui profil jika pengguna menyimpan perubahan.
    if (profileBaru != null) {
      setState(() {
        _profile = profileBaru;
      });

      // Menampilkan notifikasi keberhasilan.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Profil berhasil diperbarui!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.green.shade700,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _editProfile,
            tooltip: 'Edit Profil',
            icon: const Icon(Icons.edit),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.account_circle, size: 48),
                  const SizedBox(height: 8),
                  Text(
                    'Profil Mahasiswa',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(_profile.nama),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profil Saya'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
          ],
        ),
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
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primaryContainer,
                            child: const Icon(Icons.person, size: 65),
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
                          Text(_profile.bio, textAlign: TextAlign.center),
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


import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({
    super.key,
    required this.profile,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _namaController;
  late final TextEditingController _prodiController;
  late final TextEditingController _kelasController;
  late final TextEditingController _emailController;
  late final TextEditingController _noHpController;
  late final TextEditingController _githubController;
  late final TextEditingController _bioController;

  @override
  void initState() {
    super.initState();

    // Mengisi controller menggunakan data profil sebelumnya.
    _namaController = TextEditingController(text: widget.profile.nama);
    _prodiController = TextEditingController(text: widget.profile.prodi);
    _kelasController = TextEditingController(text: widget.profile.kelas);
    _emailController = TextEditingController(text: widget.profile.email);
    _noHpController = TextEditingController(text: widget.profile.noHp);
    _githubController = TextEditingController(text: widget.profile.github);
    _bioController = TextEditingController(text: widget.profile.bio);
  }

  void _simpanProfil() {
    if (_formKey.currentState!.validate()) {
      final profileBaru = Profile(
        nama: _namaController.text.trim(),
        nim: widget.profile.nim,
        prodi: _prodiController.text.trim(),
        kelas: _kelasController.text.trim(),
        email: _emailController.text.trim(),
        noHp: _noHpController.text.trim(),
        github: _githubController.text.trim(),
        bio: _bioController.text.trim(),
      );

      Navigator.pop(context, profileBaru);
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _prodiController.dispose();
    _kelasController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    _githubController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Widget _buildField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Perbarui Informasi Profil',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Silakan ubah informasi profil kamu.'),
                const SizedBox(height: 24),

                _buildField(
                  label: 'Nama Lengkap',
                  icon: Icons.person,
                  controller: _namaController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama wajib diisi';
                    }
                    return null;
                  },
                ),

                _buildField(
                  label: 'Program Studi',
                  icon: Icons.school,
                  controller: _prodiController,
                ),

                _buildField(
                  label: 'Kelas',
                  icon: Icons.groups,
                  controller: _kelasController,
                ),

                _buildField(
                  label: 'Email',
                  icon: Icons.email,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email wajib diisi';
                    }

                    final emailValid = RegExp(
                      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                    ).hasMatch(value.trim());

                    if (!emailValid) {
                      return 'Format email tidak valid';
                    }

                    return null;
                  },
                ),

                _buildField(
                  label: 'Nomor HP',
                  icon: Icons.phone,
                  controller: _noHpController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor HP wajib diisi';
                    }

                    if (!RegExp(r'^\d{10,13}$').hasMatch(value)) {
                      return 'Nomor HP harus 10–13 digit angka';
                    }

                    return null;
                  },
                ),

                _buildField(
                  label: 'GitHub',
                  icon: Icons.code,
                  controller: _githubController,
                ),

                _buildField(
                  label: 'Bio',
                  icon: Icons.info_outline,
                  controller: _bioController,
                  maxLines: 3,
                ),

                const SizedBox(height: 8),

                ElevatedButton.icon(
                  onPressed: _simpanProfil,
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan Perubahan'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
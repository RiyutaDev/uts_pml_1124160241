
import 'package:flutter/material.dart';
import 'profile_page.dart';
import '../models/profile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _nimController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulasi proses login
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

        Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          profile: Profile(
            nama: 'Rizki Riana Putra',
            nim: _nimController.text.trim(),
            prodi: 'Teknik Informatika Software Engineering',
            kelas: 'TI24SESHIFT',
            email: 'rizkirianaptr@gmail.com',
            noHp: '081283561060',
            github: 'RiyutaDev',
            bio: 'Mahasiswa yang tertarik pada teknologi dan pengembangan aplikasi berbasis web.',
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nimController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
  child: Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 32,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 420,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  const Icon(
                    Icons.account_circle,
                    size: 90,
                    color: Colors.teal,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Selamat Datang!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Silakan login untuk melihat profil mahasiswa',
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 35),

                  TextFormField(
                    controller: _nimController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'NIM',
                      hintText: 'Masukkan NIM',
                      prefixIcon: Icon(Icons.badge_outlined),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'NIM tidak boleh kosong';
                      }

                      if (value.trim() != '1124160241') {
                        return 'NIM tidak terdaftar';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Masukkan password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }

                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _login,
                      child: _isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Aplikasi Profil Mahasiswa\nCreated by: RyutaDev',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    ),
    );
  }
}

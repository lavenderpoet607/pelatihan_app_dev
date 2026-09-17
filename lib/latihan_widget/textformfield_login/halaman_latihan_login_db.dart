import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/core/db_helper_simulasi.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/components/dialog_helper_login.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/extensions/form_validator.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/components/halaman_home_login.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/core/latihan_form_login_enum.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/core/user_model_sql.dart';

class LoginScreenDB extends StatefulWidget {
  const LoginScreenDB({super.key});

  @override
  State<LoginScreenDB> createState() => _LoginScreenDBState();
}

class _LoginScreenDBState extends State<LoginScreenDB> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  FormAuthMode _currentMode = FormAuthMode.login;
  bool _isPasswordObscured = true;
  bool _isLoading = false;

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }

  void _switchMode(FormAuthMode mode) {
    setState(() {
      _currentMode = mode;
      formKey.currentState?.reset();
    });
  }

  void register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final user = userController.text.trim();
    final pass = passController.text;

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final pengguna = UserModelSQL(email: user, password: pass);
    final success = await DBHelper().registerUser(pengguna);

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    if (success) {
      DialogHelperLogin.showRegisterSuccessDialog(
        context,
        onLoginNow: () {
          setState(() {
            _currentMode = FormAuthMode.login;
          });
        },
      );
    } else {
      DialogHelperLogin.showRegisterFailedDialog(
        context,
        onSwitchToLogin: () {
          setState(() {
            _currentMode = FormAuthMode.login;
          });
        },
      );
    }
  }

  void login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final user = userController.text.trim();
    final pass = passController.text;

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final pengguna = await DBHelper().loginUser(user, pass);

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    if (pengguna != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => HomeScreen(userAktif: pengguna)),
      );
    } else {
      DialogHelperLogin.showLoginFailedDialog(context);
    }
  }

  void _submitForm() {
    if (_currentMode == FormAuthMode.login) {
      login();
    } else {
      register();
    }
  }

  void _fillSampleCredentials(String email, String password) {
    setState(() {
      userController.text = email;
      passController.text = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Latihan TextFormField & DB',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_rounded),
            tooltip: 'Panduan & Akun Default',
            onPressed: () => DialogHelperLogin.showInfoPanduanDialog(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(Icons.lock, size: 80, color: Colors.blue),
                    const SizedBox(height: 20),
                    Text(
                      _currentMode.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _currentMode.subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    SegmentedButton<FormAuthMode>(
                      segments: const [
                        ButtonSegment<FormAuthMode>(
                          value: FormAuthMode.login,
                          label: Text('Login'),
                          icon: Icon(Icons.login_rounded),
                        ),
                        ButtonSegment<FormAuthMode>(
                          value: FormAuthMode.register,
                          label: Text('Register'),
                          icon: Icon(Icons.person_add_rounded),
                        ),
                      ],
                      selected: {_currentMode},
                      onSelectionChanged: (newSelection) {
                        _switchMode(newSelection.first);
                      },
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: userController,
                      keyboardType: TextInputType.emailAddress,
                      validator: FormValidator.validateEmail,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Masukkan email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: passController,
                      obscureText: _isPasswordObscured,
                      validator: FormValidator.validatePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Masukkan password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordObscured
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordObscured = !_isPasswordObscured;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              _currentMode.buttonLabel,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        _switchMode(
                          _currentMode == FormAuthMode.login
                              ? FormAuthMode.register
                              : FormAuthMode.login,
                        );
                      },
                      child: Text(_currentMode.switchPrompt),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue.shade100),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline_rounded,
                                size: 16,
                                color: Colors.blue.shade700,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Akun Default SQLite:',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          InkWell(
                            onTap: () => _fillSampleCredentials(
                              'admin@gmail.com',
                              'adminpassword',
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                'Tap untuk isi: admin@gmail.com / adminpassword',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue.shade700,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => _fillSampleCredentials(
                              'hardi@flutter.dev',
                              'password123',
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                'Tap untuk isi: hardi@flutter.dev / password123',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue.shade700,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
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
      ),
    );
  }
}

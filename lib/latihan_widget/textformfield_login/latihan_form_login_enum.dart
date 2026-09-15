enum FormAuthMode {
  login(
    title: 'Login',
    subtitle: 'Silakan masuk ke akun Anda',
    buttonLabel: 'Login',
    switchPrompt: 'Belum punya akun? Daftar sekarang',
  ),
  register(
    title: 'Register Akun',
    subtitle: 'Buat akun baru untuk memulai',
    buttonLabel: 'Daftar Akun',
    switchPrompt: 'Sudah punya akun? Masuk di sini',
  );

  final String title;
  final String subtitle;
  final String buttonLabel;
  final String switchPrompt;

  const FormAuthMode({
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    required this.switchPrompt,
  });
}

enum FormValidationResult {
  valid,
  emptyEmail,
  invalidEmailFormat,
  emptyPassword,
  passwordTooShort;

  String? get errorMessage {
    switch (this) {
      case FormValidationResult.valid:
        return null;
      case FormValidationResult.emptyEmail:
        return 'Email wajib diisi';
      case FormValidationResult.invalidEmailFormat:
        return 'Format email tidak valid';
      case FormValidationResult.emptyPassword:
        return 'Password wajib diisi';
      case FormValidationResult.passwordTooShort:
        return 'Password minimal 6 karakter';
    }
  }
}

enum FormSubmitAction { login, register }

enum FormDialogType {
  registerSuccess(
    title: 'Pendaftaran Berhasil',
    message: 'Akun Anda berhasil didaftarkan ke dalam database SQLite lokal. Silakan login menggunakan akun baru.',
    confirmLabel: 'Masuk Sekarang',
  ),
  registerFailed(
    title: 'Pendaftaran Gagal',
    message: 'Email yang Anda masukkan sudah terdaftar di database. Silakan gunakan email lain atau langsung lakukan login.',
    confirmLabel: 'Mengerti',
  ),
  loginFailed(
    title: 'Login Gagal',
    message: 'Kombinasi Email atau Password salah. Pastikan akun sudah terdaftar di database SQLite.',
    confirmLabel: 'Coba Lagi',
  ),
  logoutConfirm(
    title: 'Konfirmasi Keluar',
    message: 'Apakah Anda yakin ingin keluar dari sesi akun dan kembali ke halaman login?',
    confirmLabel: 'Ya, Keluar',
  ),
  infoPanduan(
    title: 'Panduan Otentikasi DB',
    message: 'Latihan ini menggunakan SQLite simulated DBHelper. Anda dapat mendaftarkan akun baru atau menggunakan akun default yang tersedia.',
    confirmLabel: 'Tutup',
  );

  final String title;
  final String message;
  final String confirmLabel;

  const FormDialogType({
    required this.title,
    required this.message,
    required this.confirmLabel,
  });
}

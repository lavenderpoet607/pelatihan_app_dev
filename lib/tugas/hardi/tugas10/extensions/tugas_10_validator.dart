class Tugas10Validator {
  static String? validateNama(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nama Lengkap wajib diisi';
    } else if (value.trim().length < 3) {
      return 'Nama Lengkap minimal 3 karakter';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email wajib diisi';
    } else if (!value.contains('@')) {
      return 'Format email tidak valid (harus memuat @)';
    }
    return null;
  }

  static String? validateNomorHp(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    final cleanNumber = value.trim();
    if (cleanNumber.length < 8) {
      return 'Nomor HP minimal 8 digit';
    }
    return null;
  }

  static String? validateKota(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Kota Asal wajib diisi';
    } else if (value.trim().length < 2) {
      return 'Nama Kota minimal 2 karakter';
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/components/tugas_10_dialog.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/core/tugas_10_enum.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/components/tugas_10_halaman_konfirmasi.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/core/tugas_10_model_peserta.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/extensions/tugas_10_validator.dart';

class Tugas10 extends StatefulWidget {
  const Tugas10({super.key});

  @override
  State<Tugas10> createState() => _Tugas10State();
}

class _Tugas10State extends State<Tugas10> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorHpController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();

  Tugas10Peminatan _selectedPeminatan = Tugas10Peminatan.flutterMobile;

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _nomorHpController.dispose();
    _kotaController.dispose();
    super.dispose();
  }

  void _isiDataOtomatis() {
    setState(() {
      _namaController.text = 'Hardi Pratama';
      _emailController.text = 'hardi.pratama@gmail.com';
      _nomorHpController.text = '081234567890';
      _kotaController.text = 'Jakarta';
      _selectedPeminatan = Tugas10Peminatan.flutterMobile;
    });
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _namaController.clear();
      _emailController.clear();
      _nomorHpController.clear();
      _kotaController.clear();
      _selectedPeminatan = Tugas10Peminatan.flutterMobile;
    });
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan lengkapi formulir dengan data yang valid.'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final peserta = PesertaPendaftaranModel(
      namaLengkap: _namaController.text.trim(),
      email: _emailController.text.trim(),
      nomorHp: _nomorHpController.text.trim(),
      kotaAsal: _kotaController.text.trim(),
      peminatan: _selectedPeminatan,
      waktuDaftar: DateTime.now(),
    );

    Tugas10DialogHelper.showRingkasanDialog(
      context: context,
      peserta: peserta,
      onLanjut: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                HalamanKonfirmasiPendaftaran(peserta: peserta),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas 10 - Form Pendaftaran'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Isi Data Uji Coba',
            icon: const Icon(Icons.auto_fix_high_rounded),
            onPressed: _isiDataOtomatis,
          ),
          IconButton(
            tooltip: 'Reset Formulir',
            icon: const Icon(Icons.refresh_rounded),
            onPressed: _resetForm,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.assignment_ind_rounded,
                            color: Colors.blue.shade700,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Formulir Pendaftaran Aplikasi',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Isi data calon peserta di bawah ini. Setelah menekan tombol Daftar, ringkasan data akan diverifikasi melalui dialog sebelum diarahkan ke halaman konfirmasi.',
                        style: TextStyle(
                          fontSize: 12.5,
                          color: Colors.blueGrey.shade800,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    labelText: Tugas10FormField.namaLengkap.label,
                    hintText: Tugas10FormField.namaLengkap.hint,
                    prefixIcon: Icon(Tugas10FormField.namaLengkap.icon),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: Tugas10Validator.validateNama,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: Tugas10FormField.email.label,
                    hintText: Tugas10FormField.email.hint,
                    prefixIcon: Icon(Tugas10FormField.email.icon),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: Tugas10Validator.validateEmail,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nomorHpController,
                  decoration: InputDecoration(
                    labelText: Tugas10FormField.nomorHp.label,
                    hintText: Tugas10FormField.nomorHp.hint,
                    prefixIcon: Icon(Tugas10FormField.nomorHp.icon),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: Tugas10Validator.validateNomorHp,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _kotaController,
                  decoration: InputDecoration(
                    labelText: Tugas10FormField.kotaAsal.label,
                    hintText: Tugas10FormField.kotaAsal.hint,
                    prefixIcon: Icon(Tugas10FormField.kotaAsal.icon),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  textInputAction: TextInputAction.done,
                  validator: Tugas10Validator.validateKota,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<Tugas10Peminatan>(
                  initialValue: _selectedPeminatan,
                  decoration: InputDecoration(
                    labelText: Tugas10FormField.peminatan.label,
                    hintText: Tugas10FormField.peminatan.hint,
                    prefixIcon: Icon(Tugas10FormField.peminatan.icon),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  items: Tugas10Peminatan.values.map((peminatan) {
                    return DropdownMenuItem<Tugas10Peminatan>(
                      value: peminatan,
                      child: Row(
                        children: [
                          Icon(
                            peminatan.icon,
                            size: 20,
                            color: peminatan.color,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            peminatan.label,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedPeminatan = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 28),
                ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.send_rounded),
                  label: const Text(
                    'Daftar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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

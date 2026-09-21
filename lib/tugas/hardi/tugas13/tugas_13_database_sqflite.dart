import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas13/database/tugas_13_db_helper.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas13/models/tugas_13_user_model.dart';
import 'package:pelatihan_app_dev/penjelasan/halaman_penjelasan.dart';
import 'package:pelatihan_app_dev/penjelasan/penjelasan_data.dart';

class Tugas13 extends StatefulWidget {
  const Tugas13({super.key});

  @override
  State<Tugas13> createState() => _Tugas13State();
}

class _Tugas13State extends State<Tugas13> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorHpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();

  final Tugas13DBHelper _dbHelper = Tugas13DBHelper();
  late Future<List<Tugas13UserModel>> _usersFuture;

  bool _obscurePassword = true;
  bool _isLoading = false;

  Tugas13UserModel? _editingUser;
  bool get _isEditing => _editingUser != null;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _refreshUsers();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _namaController.dispose();
    _emailController.dispose();
    _nomorHpController.dispose();
    _passwordController.dispose();
    _kotaController.dispose();
    super.dispose();
  }

  void _refreshUsers() {
    setState(() {
      _usersFuture = _dbHelper.getAllUsers();
    });
  }

  void _isiDataOtomatis() {
    setState(() {
      _namaController.text = 'Hardi Pratama';
      _emailController.text = 'hardi.pratama@gmail.com';
      _nomorHpController.text = '081234567890';
      _passwordController.text = 'Password123';
      _kotaController.text = 'Jakarta Utara';
    });
  }

  void _mulaiEditUser(Tugas13UserModel user) {
    setState(() {
      _editingUser = user;
      _namaController.text = user.nama;
      _emailController.text = user.email;
      _nomorHpController.text = user.nomorHp;
      _passwordController.text = user.password;
      _kotaController.text = user.kota;
    });

    _tabController.animateTo(0);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Mengedit data: ${user.nama}'),
        backgroundColor: Colors.teal.shade800,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _batalEdit() {
    setState(() {
      _editingUser = null;
    });
    _resetForm();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Mode edit dibatalkan'),
        backgroundColor: Colors.grey,
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _namaController.clear();
      _emailController.clear();
      _nomorHpController.clear();
      _passwordController.clear();
      _kotaController.clear();
      _editingUser = null;
    });
  }

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan lengkapi form dengan benar'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      if (_isEditing) {
        final userToUpdate = Tugas13UserModel(
          id: _editingUser!.id,
          nama: _namaController.text.trim(),
          email: _emailController.text.trim(),
          nomorHp: _nomorHpController.text.trim(),
          password: _passwordController.text,
          kota: _kotaController.text.trim(),
        );

        await _dbHelper.updateUser(userToUpdate);

        if (!mounted) return;
        setState(() {
          _isLoading = false;
          _editingUser = null;
        });

        _resetForm();
        _refreshUsers();
        _tabController.animateTo(1);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Data "${userToUpdate.nama}" berhasil diperbarui!',
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.teal,
          ),
        );
      } else {
        final newUser = Tugas13UserModel(
          nama: _namaController.text.trim(),
          email: _emailController.text.trim(),
          nomorHp: _nomorHpController.text.trim(),
          password: _passwordController.text,
          kota: _kotaController.text.trim(),
        );

        await _dbHelper.insertUser(newUser);

        if (!mounted) return;
        setState(() => _isLoading = false);

        _resetForm();
        _refreshUsers();
        _tabController.animateTo(1);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Peserta "${newUser.nama}" berhasil didaftarkan!',
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.teal,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan: $e'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  Future<void> _deleteUser(Tugas13UserModel user) async {
    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red.shade700),
            const SizedBox(width: 8),
            const Text('Konfirmasi Hapus'),
          ],
        ),
        content: Text(
          'Apakah Anda yakin ingin menghapus data peserta "${user.nama}" secara permanen?',
          style: const TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade700,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (confirmed == true && user.id != null) {
      await _dbHelper.deleteUser(user.id!);
      _refreshUsers();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data "${user.nama}" berhasil dihapus'),
          backgroundColor: Colors.blueGrey.shade800,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tugas 13 - SQFLite CRUD Lengkap',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.teal.shade800,
        elevation: 0.5,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.teal,
          indicatorWeight: 3,
          tabs: [
            Tab(
              icon: Icon(
                _isEditing
                    ? Icons.edit_document
                    : Icons.app_registration_rounded,
              ),
              text: _isEditing ? 'Edit Data' : 'Form Input',
            ),
            const Tab(
              icon: Icon(Icons.people_alt_rounded),
              text: 'Data Peserta',
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book_rounded),
            tooltip: 'Penjelasan & Potongan Kode',
            onPressed: () {
              final item = cariPenjelasanItem('Tugas 13: SQFLite CRUD Lengkap');
              if (item != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanPenjelasan(item: item),
                  ),
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh Data',
            onPressed: _refreshUsers,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildFormTab(), _buildListTab()],
      ),
    );
  }

  Widget _buildFormTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_isEditing) ...[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.shade400),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.edit_note_rounded,
                      color: Colors.amber.shade900,
                      size: 28,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sedang Menyunting Data (ID: ${_editingUser!.id})',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.amber.shade900,
                            ),
                          ),
                          Text(
                            'Ubah data pada kolom di bawah lalu klik "Perbarui Data"',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.amber.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close_rounded),
                      tooltip: 'Batal Edit',
                      color: Colors.amber.shade900,
                      onPressed: _batalEdit,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ] else ...[
              Card(
                elevation: 0,
                color: Colors.teal.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.teal.shade100),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.storage_rounded,
                        color: Colors.teal.shade700,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Manajemen Data SQFLite',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.teal.shade900,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Operasi Lengkap: Create, Read, Update, & Delete',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.teal.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],

            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap *',
                hintText: 'Masukkan nama lengkap',
                prefixIcon: const Icon(Icons.person_outline_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nama lengkap wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),

            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email *',
                hintText: 'contoh: nama@email.com',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email wajib diisi';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Format email tidak valid';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),

            TextFormField(
              controller: _nomorHpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Nomor HP *',
                hintText: '08xxxxxxxxxx',
                prefixIcon: const Icon(Icons.phone_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nomor HP wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),

            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password *',
                hintText: 'Masukkan password',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password wajib diisi';
                }
                if (value.length < 6) return 'Password minimal 6 karakter';
                return null;
              },
            ),
            const SizedBox(height: 14),

            TextFormField(
              controller: _kotaController,
              decoration: InputDecoration(
                labelText: 'Kota Domisili *',
                hintText: 'Masukkan nama kota',
                prefixIcon: const Icon(Icons.location_city_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Kota wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _isLoading ? null : _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isEditing
                    ? Colors.orange.shade800
                    : Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _isEditing
                              ? Icons.save_as_rounded
                              : Icons.save_rounded,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _isEditing
                              ? 'Perbarui Data (Update)'
                              : 'Simpan Data Baru',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
            ),

            if (_isEditing) ...[
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: _batalEdit,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey.shade800,
                  side: BorderSide(color: Colors.grey.shade400),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Batal Edit'),
              ),
            ] else ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _isiDataOtomatis,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.teal.shade700,
                        side: BorderSide(color: Colors.teal.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Isi Otomatis'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _resetForm,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.grey.shade700,
                        side: BorderSide(color: Colors.grey.shade400),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Reset'),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildListTab() {
    return FutureBuilder<List<Tugas13UserModel>>(
      future: _usersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.teal),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 12),
                Text('Terjadi kesalahan: ${snapshot.error}'),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _refreshUsers,
                  child: const Text('Coba Lagi'),
                ),
              ],
            ),
          );
        }

        final users = snapshot.data ?? [];

        if (users.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people_outline_rounded,
                  size: 72,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 16),
                Text(
                  'Belum ada data peserta',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => _tabController.animateTo(0),
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('Tambah Peserta'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => _refreshUsers(),
          color: Colors.teal,
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final initial = user.nama.isNotEmpty
                  ? user.nama[0].toUpperCase()
                  : '?';

              return Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.teal.shade100,
                        child: Text(
                          initial,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade800,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.nama,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user.email,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${user.nomorHp} • ${user.kota}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit_rounded),
                            color: Colors.orange.shade800,
                            tooltip: 'Edit Peserta',
                            onPressed: () => _mulaiEditUser(user),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_rounded),
                            color: Colors.redAccent,
                            tooltip: 'Hapus Peserta',
                            onPressed: () => _deleteUser(user),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

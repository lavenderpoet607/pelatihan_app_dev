import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/core/db_helper_simulasi.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/components/dialog_helper_login.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/core/latihan_form_login_enum.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/core/user_model_sql.dart';

class HomeScreen extends StatefulWidget {
  final UserModelSQL? userAktif;

  const HomeScreen({super.key, this.userAktif});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModelSQL> _allUsers = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() {
      _isLoading = true;
    });
    final users = await DBHelper().getAllUsers();
    if (mounted) {
      setState(() {
        _allUsers = users;
        _isLoading = false;
      });
    }
  }

  void _handleLogout() {
    DialogHelperLogin.showAppDialog(
      context: context,
      type: FormDialogType.logoutConfirm,
      onConfirm: () {
        Navigator.of(context).pop();
        DialogHelperLogin.showSnackBarFeedback(
          context: context,
          message: 'Berhasil keluar dari akun.',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final email = widget.userAktif?.email ?? 'Pengguna';
    final initial = email.isNotEmpty ? email[0].toUpperCase() : 'U';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard SQLite Login',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Segarkan data',
            onPressed: _loadUsers,
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Logout',
            onPressed: _handleLogout,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadUsers,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.blueAccent.withAlpha(40),
                        child: Text(
                          initial,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Selamat Datang,',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              email,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Colors.green.shade300,
                                ),
                              ),
                              child: const Text(
                                'STATUS: TEROTENTIKASI',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
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
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Daftar Akun Database',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withAlpha(25),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${_allUsers.length} Terdaftar',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (_isLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (_allUsers.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Text('Belum ada akun terdaftar'),
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _allUsers.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final user = _allUsers[index];
                    final isCurrentUser =
                        user.email.toLowerCase() == email.toLowerCase();
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: isCurrentUser
                            ? Colors.green.withAlpha(40)
                            : Colors.grey.withAlpha(40),
                        child: Icon(
                          isCurrentUser
                              ? Icons.person_rounded
                              : Icons.person_outline_rounded,
                          color: isCurrentUser
                              ? Colors.green
                              : Colors.grey[700],
                        ),
                      ),
                      title: Text(
                        user.email,
                        style: TextStyle(
                          fontWeight: isCurrentUser
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isCurrentUser
                              ? Colors.green.shade900
                              : Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        'ID: ${user.id ?? '-'} | Dibuat: ${user.createdAt?.toString().split('.').first ?? '-'}',
                        style: const TextStyle(fontSize: 11),
                      ),
                      trailing: isCurrentUser
                          ? const Chip(
                              label: Text(
                                'Aktif',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.green,
                                ),
                              ),
                              backgroundColor: Color(0xFFE8F5E9),
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                            )
                          : null,
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

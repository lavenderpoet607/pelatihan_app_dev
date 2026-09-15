import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/latihan_form_login_enum.dart';

class DialogHelperLogin {
  static IconData _getDialogIcon(FormDialogType type) {
    switch (type) {
      case FormDialogType.registerSuccess:
        return Icons.check_circle_rounded;
      case FormDialogType.registerFailed:
        return Icons.warning_rounded;
      case FormDialogType.loginFailed:
        return Icons.error_outline_rounded;
      case FormDialogType.logoutConfirm:
        return Icons.help_outline_rounded;
      case FormDialogType.infoPanduan:
        return Icons.info_outline_rounded;
    }
  }

  static Color _getDialogColor(FormDialogType type) {
    switch (type) {
      case FormDialogType.registerSuccess:
        return Colors.green;
      case FormDialogType.registerFailed:
        return Colors.orange;
      case FormDialogType.loginFailed:
        return Colors.redAccent;
      case FormDialogType.logoutConfirm:
        return Colors.blueAccent;
      case FormDialogType.infoPanduan:
        return Colors.blue;
    }
  }

  static Future<bool> showLogoutConfirmDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        final type = FormDialogType.logoutConfirm;
        final color = _getDialogColor(type);
        final icon = _getDialogIcon(type);

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          icon: Icon(icon, size: 48, color: color),
          title: Text(
            type.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            type.message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            OutlinedButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(type.confirmLabel),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }

  static Future<void> showRegisterSuccessDialog(
    BuildContext context, {
    VoidCallback? onLoginNow,
  }) async {
    final type = FormDialogType.registerSuccess;
    final color = _getDialogColor(type);
    final icon = _getDialogIcon(type);

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          icon: Icon(icon, size: 48, color: color),
          title: Text(
            type.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            type.message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  onLoginNow?.call();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(type.confirmLabel),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showRegisterFailedDialog(
    BuildContext context, {
    VoidCallback? onSwitchToLogin,
  }) async {
    final type = FormDialogType.registerFailed;
    final color = _getDialogColor(type);
    final icon = _getDialogIcon(type);

    await showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          icon: Icon(icon, size: 48, color: color),
          title: Text(
            type.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            type.message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Tutup'),
            ),
            if (onSwitchToLogin != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  onSwitchToLogin();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Beralih ke Login'),
              ),
          ],
        );
      },
    );
  }

  static Future<void> showLoginFailedDialog(BuildContext context) async {
    final type = FormDialogType.loginFailed;
    final color = _getDialogColor(type);
    final icon = _getDialogIcon(type);

    await showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          icon: Icon(icon, size: 48, color: color),
          title: Text(
            type.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            type.message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(type.confirmLabel),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showInfoPanduanDialog(BuildContext context) async {
    final type = FormDialogType.infoPanduan;
    final color = _getDialogColor(type);
    final icon = _getDialogIcon(type);

    await showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          icon: Icon(icon, size: 48, color: color),
          title: Text(
            type.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type.message,
                style: const TextStyle(fontSize: 13, height: 1.4),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Akun Default:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '1. admin@gmail.com (adminpassword)',
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(
                      '2. hardi@flutter.dev (password123)',
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(type.confirmLabel),
              ),
            ),
          ],
        );
      },
    );
  }
}

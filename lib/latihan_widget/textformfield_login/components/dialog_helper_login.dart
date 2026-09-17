import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/core/latihan_form_login_enum.dart';

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
        return Colors.red;
      case FormDialogType.logoutConfirm:
        return Colors.blue;
      case FormDialogType.infoPanduan:
        return Colors.teal;
    }
  }

  static Future<bool?> showAppDialog({
    required BuildContext context,
    required FormDialogType type,
    String? customMessage,
    VoidCallback? onConfirm,
  }) {
    final color = _getDialogColor(type);
    final icon = _getDialogIcon(type);
    final isConfirmDialog = type == FormDialogType.logoutConfirm;

    return showDialog<bool>(
      context: context,
      barrierDismissible: !isConfirmDialog,
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          actionsPadding: const EdgeInsets.all(16),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withAlpha(30),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  type.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                customMessage ?? type.message,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              if (type == FormDialogType.registerSuccess)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green.shade200),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.verified_user_rounded,
                        color: Colors.green,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Data akun tersimpan di memory database',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (type == FormDialogType.infoPanduan)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.teal.shade200),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Akun Default Simulasi:',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '• admin@gmail.com / adminpassword',
                        style: TextStyle(fontSize: 11, color: Colors.teal),
                      ),
                      Text(
                        '• hardi@flutter.dev / password123',
                        style: TextStyle(fontSize: 11, color: Colors.teal),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          actions: [
            if (isConfirmDialog)
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('Batal'),
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
              onPressed: () {
                Navigator.of(ctx).pop(true);
                if (onConfirm != null) {
                  onConfirm();
                }
              },
              child: Text(type.confirmLabel),
            ),
          ],
        );
      },
    );
  }

  static void showRegisterSuccessDialog(
    BuildContext context, {
    VoidCallback? onLoginNow,
  }) {
    showAppDialog(
      context: context,
      type: FormDialogType.registerSuccess,
      onConfirm: onLoginNow,
    );
  }

  static void showRegisterFailedDialog(
    BuildContext context, {
    VoidCallback? onSwitchToLogin,
  }) {
    showAppDialog(
      context: context,
      type: FormDialogType.registerFailed,
      onConfirm: onSwitchToLogin,
    );
  }

  static void showLoginFailedDialog(BuildContext context) {
    showAppDialog(context: context, type: FormDialogType.loginFailed);
  }

  static void showInfoPanduanDialog(BuildContext context) {
    showAppDialog(context: context, type: FormDialogType.infoPanduan);
  }

  static void showSnackBarFeedback({
    required BuildContext context,
    required String message,
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError
                  ? Icons.error_outline_rounded
                  : Icons.check_circle_rounded,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: isError ? Colors.red.shade700 : Colors.green.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

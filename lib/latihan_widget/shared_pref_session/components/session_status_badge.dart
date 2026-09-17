import 'package:flutter/material.dart';

class SessionStatusBadge extends StatelessWidget {
  final bool isLogin;

  const SessionStatusBadge({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isLogin
            ? Colors.greenAccent.shade700
            : Colors.redAccent.shade700,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isLogin ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: Colors.white,
            size: 14,
          ),
          const SizedBox(width: 6),
          Text(
            isLogin ? 'Sesi Aktif' : 'Belum Login',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

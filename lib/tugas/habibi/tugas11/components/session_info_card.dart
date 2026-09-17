import 'package:flutter/material.dart';

class SessionInfoCard extends StatelessWidget {
  final bool isLogin;
  final String username;

  const SessionInfoCard({
    super.key,
    required this.isLogin,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.storage_rounded, color: Colors.indigo),
                SizedBox(width: 10),
                Text(
                  'Detail SharedPreferences',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildRow(
              label: 'PreferenceHandler.isLogin',
              value: isLogin.toString(),
              valueColor: isLogin ? Colors.green : Colors.red,
            ),
            const Divider(height: 20),
            _buildRow(
              label: 'PreferenceHandler.username',
              value: username,
              valueColor: Colors.blue.shade700,
            ),
            const Divider(height: 20),
            _buildRow(
              label: 'Status Keep Login',
              value: 'Aktif (Persisten)',
              valueColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow({
    required String label,
    required String value,
    required Color valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: valueColor.withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ),
      ],
    );
  }
}

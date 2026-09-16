import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/custom_ui/custom_ui_enum.dart';
import 'package:pelatihan_app_dev/custom_ui/custom_ui_state.dart';

class CustomUiPreview extends StatelessWidget {
  final CustomUiConfig config;
  final ValueChanged<CustomUiConfig> onConfigChanged;

  const CustomUiPreview({
    super.key,
    required this.config,
    required this.onConfigChanged,
  });

  @override
  Widget build(BuildContext context) {
    final frame = config.frameType;
    final isFull = frame == DeviceFrameType.responsive;

    return Center(
      child: Container(
        width: isFull ? double.infinity : frame.width,
        height: frame.height,
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(frame.cornerRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.18),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border.all(color: const Color(0xFF334155), width: 3),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(frame.cornerRadius - 3),
          child: Column(
            children: [
              _buildStatusBar(),
              Expanded(
                child: Container(
                  color: config.isDarkMode
                      ? config.preset.bgDark
                      : config.preset.bgLight,
                  child: _buildScreenContent(context),
                ),
              ),
              _buildHomeBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: config.isDarkMode ? config.preset.bgDark : config.preset.bgLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '09:41',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: config.isDarkMode
                  ? config.preset.textDark
                  : config.preset.textLight,
            ),
          ),
          Container(
            width: 70,
            height: 14,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.wifi,
                size: 13,
                color: config.isDarkMode
                    ? config.preset.textDark
                    : config.preset.textLight,
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.battery_full_rounded,
                size: 14,
                color: config.isDarkMode
                    ? config.preset.textDark
                    : config.preset.textLight,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHomeBar() {
    return Container(
      height: 18,
      color: config.isDarkMode ? config.preset.bgDark : config.preset.bgLight,
      alignment: Alignment.center,
      child: Container(
        width: 100,
        height: 4,
        decoration: BoxDecoration(
          color: config.isDarkMode ? Colors.white38 : Colors.black26,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildScreenContent(BuildContext context) {
    switch (config.template) {
      case CustomUiTemplate.profileScreen:
        return _buildProfileContent(context);
      case CustomUiTemplate.ecommerceDetail:
        return _buildEcommerceContent(context);
      case CustomUiTemplate.newsFeed:
        return _buildNewsContent(context);
      case CustomUiTemplate.dashboardAnalytics:
        return _buildDashboardContent(context);
      case CustomUiTemplate.formCheckout:
        return _buildCheckoutContent(context);
    }
  }

  Widget _buildProfileContent(BuildContext context) {
    final theme = config.preset;
    final cardBg = config.isDarkMode ? theme.cardBgDark : theme.cardBgLight;
    final textColor = config.isDarkMode ? theme.textDark : theme.textLight;

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [theme.primary, theme.accent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Positioned(
                bottom: -35,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: cardBg,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: theme.primary,
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  config.title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 2),
                Text(
                  config.subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  config.extraText,
                  style: TextStyle(
                    fontSize: 11,
                    color: theme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          onConfigChanged(
                            config.copyWith(isBookmarked: !config.isBookmarked),
                          );
                        },
                        icon: Icon(
                          config.isBookmarked ? Icons.check : Icons.person_add,
                          size: 16,
                        ),
                        label: Text(
                          config.isBookmarked ? 'Mengikuti' : 'Ikuti Profil',
                          style: const TextStyle(fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              config.borderRadius,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: theme.primary,
                        side: BorderSide(color: theme.primary),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            config.borderRadius,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Pesan',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(config.borderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatColumn('Proyek', '32', textColor),
                      _buildStatColumn(
                        'Pengikut',
                        config.metricValue,
                        textColor,
                      ),
                      _buildStatColumn('Rating', '4.9', textColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }

  Widget _buildEcommerceContent(BuildContext context) {
    final theme = config.preset;
    final cardBg = config.isDarkMode ? theme.cardBgDark : theme.cardBgLight;
    final textColor = config.isDarkMode ? theme.textDark : theme.textLight;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: cardBg,
                        borderRadius: BorderRadius.circular(
                          config.borderRadius,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shopping_bag_rounded,
                          size: 70,
                          color: theme.primary,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: Icon(
                          config.isBookmarked
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: config.isBookmarked ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          onConfigChanged(
                            config.copyWith(isBookmarked: !config.isBookmarked),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      config.metricValue,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.primary,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Diskon 25%',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  config.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  config.subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Pilihan Varian:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [0, 1, 2].map((idx) {
                    final isSelected = config.selectedOptionIndex == idx;
                    final labels = ['Merah', 'Biru', 'Hitam'];
                    return Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: ChoiceChip(
                        label: Text(
                          labels[idx],
                          style: const TextStyle(fontSize: 11),
                        ),
                        selected: isSelected,
                        selectedColor: theme.primary,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                        onSelected: (val) {
                          onConfigChanged(
                            config.copyWith(selectedOptionIndex: idx),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: cardBg,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (config.cartQuantity > 1) {
                          onConfigChanged(
                            config.copyWith(
                              cartQuantity: config.cartQuantity - 1,
                            ),
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(Icons.remove, size: 14),
                      ),
                    ),
                    Text(
                      '${config.cartQuantity}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: textColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        onConfigChanged(
                          config.copyWith(
                            cartQuantity: config.cartQuantity + 1,
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(Icons.add, size: 14),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${config.cartQuantity} barang dimasukkan ke keranjang!',
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_bag_outlined, size: 16),
                  label: const Text(
                    'Beli Sekarang',
                    style: TextStyle(fontSize: 12),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(config.borderRadius),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNewsContent(BuildContext context) {
    final theme = config.preset;
    final cardBg = config.isDarkMode ? theme.cardBgDark : theme.cardBgLight;
    final textColor = config.isDarkMode ? theme.textDark : theme.textLight;

    return ListView(
      padding: const EdgeInsets.all(14),
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [theme.primary, theme.accent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(config.borderRadius),
            boxShadow: [
              BoxShadow(
                color: theme.primary.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'TOP HEADLINE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      config.isBookmarked
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      onConfigChanged(
                        config.copyWith(isBookmarked: !config.isBookmarked),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                config.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                config.subtitle,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                config.extraText,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Artikel Populer',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),
        ...List.generate(3, (i) {
          return Card(
            elevation: config.elevation,
            color: cardBg,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(config.borderRadius),
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              dense: true,
              leading: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: theme.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.newspaper_rounded,
                  color: theme.primary,
                  size: 20,
                ),
              ),
              title: Text(
                'Update Framework Flutter Seri ${i + 1}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: textColor,
                ),
              ),
              subtitle: Text(
                'Arsitektur performa tinggi',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
              trailing: const Icon(Icons.chevron_right, size: 18),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildDashboardContent(BuildContext context) {
    final theme = config.preset;
    final cardBg = config.isDarkMode ? theme.cardBgDark : theme.cardBgLight;
    final textColor = config.isDarkMode ? theme.textDark : theme.textLight;

    return ListView(
      padding: const EdgeInsets.all(14),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [theme.primary, theme.accent]),
            borderRadius: BorderRadius.circular(config.borderRadius),
            boxShadow: [
              BoxShadow(
                color: theme.primary.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TOTAL SALDO AKTIF',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                config.metricValue,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                config.subtitle,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: _buildMetricTile(
                'Pemasukan',
                'Rp 4.250.000',
                Icons.arrow_downward_rounded,
                Colors.green,
                cardBg,
                textColor,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildMetricTile(
                'Pengeluaran',
                'Rp 1.100.000',
                Icons.arrow_upward_rounded,
                Colors.redAccent,
                cardBg,
                textColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          'Aktivitas Terkini',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),
        ...List.generate(2, (i) {
          return Card(
            elevation: config.elevation,
            color: cardBg,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(config.borderRadius),
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              dense: true,
              leading: Icon(
                i == 0 ? Icons.payment_rounded : Icons.account_balance_wallet,
                color: theme.primary,
              ),
              title: Text(
                i == 0 ? 'Langganan Server Cloud' : 'Transfer Masuk Klien',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: textColor,
                ),
              ),
              subtitle: Text(
                i == 0 ? '- Rp 150.000' : '+ Rp 2.500.000',
                style: TextStyle(
                  color: i == 0 ? Colors.redAccent : Colors.green,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildMetricTile(
    String label,
    String value,
    IconData icon,
    Color iconColor,
    Color cardBg,
    Color textColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(config.borderRadius),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildCheckoutContent(BuildContext context) {
    final theme = config.preset;
    final cardBg = config.isDarkMode ? theme.cardBgDark : theme.cardBgLight;
    final textColor = config.isDarkMode ? theme.textDark : theme.textLight;

    return ListView(
      padding: const EdgeInsets.all(14),
      children: [
        Card(
          elevation: config.elevation,
          color: cardBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(config.borderRadius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: theme.primary),
                    const SizedBox(width: 6),
                    Text(
                      'Alamat Pengiriman',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Jl. Kebon Sayur 1 BidaraCina, Jatinegara, Jakarta',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: config.elevation,
          color: cardBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(config.borderRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
                child: Text(
                  'Metode Pembayaran',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: textColor,
                  ),
                ),
              ),
              RadioGroup<int>(
                groupValue: config.selectedOptionIndex,
                onChanged: (val) {
                  onConfigChanged(
                    config.copyWith(selectedOptionIndex: val ?? 0),
                  );
                },
                child: Column(
                  children: [
                    ...[
                      'Dompet Digital (QRIS / E-Wallet)',
                      'Transfer Virtual Account Bank',
                    ].asMap().entries.map((entry) {
                      return RadioListTile<int>(
                        dense: true,
                        title: Text(
                          entry.value,
                          style: TextStyle(fontSize: 12, color: textColor),
                        ),
                        value: entry.key,
                        activeColor: theme.primary,
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Pembayaran berhasil diproses!')),
            );
          },
          icon: const Icon(Icons.lock_rounded, size: 16),
          label: Text(
            'Bayar Sekarang (${config.metricValue})',
            style: const TextStyle(fontSize: 13),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(config.borderRadius),
            ),
          ),
        ),
      ],
    );
  }
}

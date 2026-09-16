import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/custom_ui/custom_ui_enum.dart';
import 'package:pelatihan_app_dev/custom_ui/custom_ui_state.dart';

class CustomUiCodeGenerator {
  static String _colorToHex(Color color) {
    return '0x${color.toARGB32().toRadixString(16).toUpperCase()}';
  }

  static String generate(CustomUiConfig config) {
    switch (config.template) {
      case CustomUiTemplate.profileScreen:
        return _generateProfileCode(config);
      case CustomUiTemplate.ecommerceDetail:
        return _generateEcommerceCode(config);
      case CustomUiTemplate.newsFeed:
        return _generateNewsFeedCode(config);
      case CustomUiTemplate.dashboardAnalytics:
        return _generateDashboardCode(config);
      case CustomUiTemplate.formCheckout:
        return _generateCheckoutCode(config);
    }
  }

  static String _generateProfileCode(CustomUiConfig config) {
    final primaryHex = _colorToHex(config.preset.primary);
    final accentHex = _colorToHex(config.preset.accent);
    final radius = config.borderRadius.toStringAsFixed(1);
    final bgHex = _colorToHex(
      config.isDarkMode ? config.preset.bgDark : config.preset.bgLight,
    );
    final cardBgHex = _colorToHex(
      config.isDarkMode ? config.preset.cardBgDark : config.preset.cardBgLight,
    );
    final textColorHex = _colorToHex(
      config.isDarkMode ? config.preset.textDark : config.preset.textLight,
    );

    return '''import 'package:flutter/material.dart';

class CustomProfileScreen extends StatefulWidget {
  const CustomProfileScreen({super.key});

  @override
  State<CustomProfileScreen> createState() => _CustomProfileScreenState();
}

class _CustomProfileScreenState extends State<CustomProfileScreen> {
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color($bgHex),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color($primaryHex), Color($accentHex)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -45,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color($cardBgHex),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Color($primaryHex),
                      child: const Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 55),
            Text(
              "${config.title}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color($textColorHex),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${config.subtitle}",
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 6),
            Text(
              "${config.extraText}",
              style: TextStyle(fontSize: 12, color: Color($primaryHex), fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          isFollowed = !isFollowed;
                        });
                      },
                      icon: Icon(isFollowed ? Icons.check : Icons.person_add, size: 18),
                      label: Text(isFollowed ? "Mengikuti" : "Ikuti Profil"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color($primaryHex),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular($radius)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.mail_outline, size: 18),
                    label: const Text("Pesan"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color($primaryHex),
                      side: BorderSide(color: Color($primaryHex)),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular($radius)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color($cardBgHex),
                borderRadius: BorderRadius.circular($radius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem("Proyek", "28", Color($textColorHex)),
                  _buildStatItem("Pengikut", "${config.metricValue}", Color($textColorHex)),
                  _buildStatItem("Rating", "4.9", Color($textColorHex)),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color textColor) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}''';
  }

  static String _generateEcommerceCode(CustomUiConfig config) {
    final primaryHex = _colorToHex(config.preset.primary);
    final radius = config.borderRadius.toStringAsFixed(1);
    final bgHex = _colorToHex(
      config.isDarkMode ? config.preset.bgDark : config.preset.bgLight,
    );
    final cardBgHex = _colorToHex(
      config.isDarkMode ? config.preset.cardBgDark : config.preset.cardBgLight,
    );
    final textColorHex = _colorToHex(
      config.isDarkMode ? config.preset.textDark : config.preset.textLight,
    );

    return '''import 'package:flutter/material.dart';

class CustomEcommerceDetailScreen extends StatefulWidget {
  const CustomEcommerceDetailScreen({super.key});

  @override
  State<CustomEcommerceDetailScreen> createState() => _CustomEcommerceDetailScreenState();
}

class _CustomEcommerceDetailScreenState extends State<CustomEcommerceDetailScreen> {
  int quantity = 1;
  int selectedSize = 42;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color($bgHex),
      appBar: AppBar(
        title: const Text("Detail Produk"),
        backgroundColor: Color($cardBgHex),
        foregroundColor: Color($textColorHex),
        elevation: 0.5,
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: isFavorite ? Colors.red : Colors.grey),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color($cardBgHex),
                borderRadius: BorderRadius.circular($radius),
              ),
              child: const Center(
                child: Icon(Icons.shopping_bag_outlined, size: 90, color: Color($primaryHex)),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${config.metricValue}",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color($primaryHex)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text("Diskon 25%", style: TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "${config.title}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color($textColorHex)),
            ),
            const SizedBox(height: 6),
            Text(
              "${config.subtitle}",
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600, height: 1.4),
            ),
            const SizedBox(height: 16),
            const Text("Pilih Ukuran:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [40, 41, 42, 43, 44].map((size) {
                final isSelected = selectedSize == size;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text("\$size"),
                    selected: isSelected,
                    selectedColor: Color($primaryHex),
                    labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black87),
                    onSelected: (val) {
                      setState(() {
                        selectedSize = size;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color($cardBgHex),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, -3)),
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
                  IconButton(
                    icon: const Icon(Icons.remove, size: 16),
                    onPressed: () {
                      if (quantity > 1) setState(() => quantity--);
                    },
                  ),
                  Text("\$quantity", style: const TextStyle(fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.add, size: 16),
                    onPressed: () => setState(() => quantity++),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("\$quantity item dimasukkan ke keranjang!")),
                  );
                },
                icon: const Icon(Icons.shopping_cart_checkout),
                label: const Text("Beli Sekarang"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color($primaryHex),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular($radius)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}''';
  }

  static String _generateNewsFeedCode(CustomUiConfig config) {
    final primaryHex = _colorToHex(config.preset.primary);
    final radius = config.borderRadius.toStringAsFixed(1);
    final bgHex = _colorToHex(
      config.isDarkMode ? config.preset.bgDark : config.preset.bgLight,
    );
    final cardBgHex = _colorToHex(
      config.isDarkMode ? config.preset.cardBgDark : config.preset.cardBgLight,
    );
    final textColorHex = _colorToHex(
      config.isDarkMode ? config.preset.textDark : config.preset.textLight,
    );

    return '''import 'package:flutter/material.dart';

class CustomNewsFeedScreen extends StatefulWidget {
  const CustomNewsFeedScreen({super.key});

  @override
  State<CustomNewsFeedScreen> createState() => _CustomNewsFeedScreenState();
}

class _CustomNewsFeedScreenState extends State<CustomNewsFeedScreen> {
  bool isBookmarked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color($bgHex),
      appBar: AppBar(
        title: const Text("Luminous News Hub"),
        backgroundColor: Color($cardBgHex),
        foregroundColor: Color($textColorHex),
        elevation: 0.5,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color($primaryHex),
              borderRadius: BorderRadius.circular($radius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text("HEADLINE TERKINI", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                    IconButton(
                      icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border, color: Colors.white),
                      onPressed: () => setState(() => isBookmarked = !isBookmarked),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "${config.title}",
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  "${config.subtitle}",
                  style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 13),
                ),
                const SizedBox(height: 12),
                Text(
                  "${config.extraText}",
                  style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 11),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text("Artikel Rekomendasi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color($textColorHex))),
          const SizedBox(height: 12),
          ...List.generate(3, (index) {
            return Card(
              elevation: ${config.elevation},
              color: Color($cardBgHex),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular($radius)),
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color($primaryHex).withOpacity(0.15),
                  child: Icon(Icons.feed_rounded, color: Color($primaryHex)),
                ),
                title: Text("Pembaruan Ekosistem Mobile Ke-\${index + 1}", style: TextStyle(fontWeight: FontWeight.bold, color: Color($textColorHex))),
                subtitle: const Text("Tinjauan arsitektur kode dan tren teknologi terbaru."),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              ),
            );
          }),
        ],
      ),
    );
  }
}''';
  }

  static String _generateDashboardCode(CustomUiConfig config) {
    final primaryHex = _colorToHex(config.preset.primary);
    final accentHex = _colorToHex(config.preset.accent);
    final radius = config.borderRadius.toStringAsFixed(1);
    final bgHex = _colorToHex(
      config.isDarkMode ? config.preset.bgDark : config.preset.bgLight,
    );
    final cardBgHex = _colorToHex(
      config.isDarkMode ? config.preset.cardBgDark : config.preset.cardBgLight,
    );
    final textColorHex = _colorToHex(
      config.isDarkMode ? config.preset.textDark : config.preset.textLight,
    );

    return '''import 'package:flutter/material.dart';

class CustomDashboardScreen extends StatelessWidget {
  const CustomDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color($bgHex),
      appBar: AppBar(
        title: const Text("Dashboard Analitik"),
        backgroundColor: Color($cardBgHex),
        foregroundColor: Color($textColorHex),
        elevation: 0.5,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color($primaryHex), Color($accentHex)]),
                borderRadius: BorderRadius.circular($radius),
                boxShadow: [
                  BoxShadow(color: Color($primaryHex).withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("TOTAL SALDO AKTIF", style: TextStyle(color: Colors.white70, fontSize: 11, letterSpacing: 1)),
                  const SizedBox(height: 6),
                  Text(
                    "${config.metricValue}",
                    style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${config.subtitle}",
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildMetricCard("Omset Hari Ini", "Rp 3.450.000", Icons.trending_up, Colors.green, Color($cardBgHex), Color($textColorHex))),
                const SizedBox(width: 12),
                Expanded(child: _buildMetricCard("Pengeluaran", "Rp 850.000", Icons.trending_down, Colors.redAccent, Color($cardBgHex), Color($textColorHex))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon, Color iconColor, Color cardColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 10),
          Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: textColor)),
          Text(title, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }
}''';
  }

  static String _generateCheckoutCode(CustomUiConfig config) {
    final primaryHex = _colorToHex(config.preset.primary);
    final radius = config.borderRadius.toStringAsFixed(1);
    final bgHex = _colorToHex(
      config.isDarkMode ? config.preset.bgDark : config.preset.bgLight,
    );
    final cardBgHex = _colorToHex(
      config.isDarkMode ? config.preset.cardBgDark : config.preset.cardBgLight,
    );
    final textColorHex = _colorToHex(
      config.isDarkMode ? config.preset.textDark : config.preset.textLight,
    );

    return '''import 'package:flutter/material.dart';

class CustomCheckoutScreen extends StatefulWidget {
  const CustomCheckoutScreen({super.key});

  @override
  State<CustomCheckoutScreen> createState() => _CustomCheckoutScreenState();
}

class _CustomCheckoutScreenState extends State<CustomCheckoutScreen> {
  int paymentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color($bgHex),
      appBar: AppBar(
        title: const Text("Formulir Pembayaran"),
        backgroundColor: Color($cardBgHex),
        foregroundColor: Color($textColorHex),
        elevation: 0.5,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Color($cardBgHex),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular($radius)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Alamat Pengiriman", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text("Jl. Kebon Sayur 1 BidaraCina, Jatinegara", style: TextStyle(color: Colors.grey.shade700, fontSize: 13)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Card(
            color: Color($cardBgHex),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular($radius)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: Text("Metode Pembayaran", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                RadioListTile<int>(
                  title: const Text("Dompet Digital (QRIS / E-Wallet)"),
                  value: 0,
                  groupValue: paymentIndex,
                  activeColor: Color($primaryHex),
                  onChanged: (val) => setState(() => paymentIndex = val ?? 0),
                ),
                RadioListTile<int>(
                  title: const Text("Transfer Virtual Account Bank"),
                  value: 1,
                  groupValue: paymentIndex,
                  activeColor: Color($primaryHex),
                  onChanged: (val) => setState(() => paymentIndex = val ?? 1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Pembayaran diproses!")));
            },
            icon: const Icon(Icons.lock_rounded, size: 18),
            label: Text("${config.metricValue}"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color($primaryHex),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular($radius)),
            ),
          ),
        ],
      ),
    );
  }
}''';
  }
}

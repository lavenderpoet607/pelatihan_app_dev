import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pelatihan_app_dev/custom_widget/custom_widget_code_generator.dart';
import 'package:pelatihan_app_dev/custom_widget/custom_widget_controls.dart';
import 'package:pelatihan_app_dev/custom_widget/custom_widget_enum.dart';
import 'package:pelatihan_app_dev/custom_widget/custom_widget_penjelasan_data.dart';
import 'package:pelatihan_app_dev/custom_widget/custom_widget_preview.dart';
import 'package:pelatihan_app_dev/custom_widget/custom_widget_state.dart';
import 'package:pelatihan_app_dev/custom_ui/halaman_custom_ui_studio.dart';

class HalamanCustomWidget extends StatefulWidget {
  const HalamanCustomWidget({super.key});

  @override
  State<HalamanCustomWidget> createState() => _HalamanCustomWidgetState();
}

class _HalamanCustomWidgetState extends State<HalamanCustomWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late CustomWidgetConfig _config;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _config = CustomWidgetConfig.defaultConfig(CustomWidgetType.card);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateConfig(CustomWidgetConfig newConfig) {
    setState(() {
      _config = newConfig;
    });
  }

  void _resetToDefault() {
    setState(() {
      _config = CustomWidgetConfig.defaultConfig(_config.widgetType);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Konfigurasi berhasil dikembalikan ke default'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final penjelasan = CustomWidgetPenjelasan.getPenjelasan(_config.widgetType);
    final generatedCode = CustomWidgetCodeGenerator.generate(_config);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Custom Widget Studio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.devices_rounded),
            tooltip: 'Custom UI Screen Studio',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HalamanCustomUiStudio(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Reset Default',
            onPressed: _resetToDefault,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          tabs: const [
            Tab(icon: Icon(Icons.tune_rounded, size: 20), text: 'Studio'),
            Tab(
              icon: Icon(Icons.info_outline_rounded, size: 20),
              text: 'Penjelasan',
            ),
            Tab(
              icon: Icon(Icons.code_rounded, size: 20),
              text: 'Kode Otomatis',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildStudioTab(),
          _buildPenjelasanTab(penjelasan),
          _buildCodeTab(generatedCode),
        ],
      ),
    );
  }

  Widget _buildStudioTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        CustomWidgetPreview(config: _config, onConfigChanged: _updateConfig),
        const SizedBox(height: 20),
        CustomWidgetControls(config: _config, onConfigChanged: _updateConfig),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildPenjelasanTab(CustomWidgetPenjelasan penjelasan) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.indigo.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.architecture_rounded,
                        color: Colors.indigo,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        penjelasan.judul,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  penjelasan.deskripsi,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
                const Divider(height: 24),
                const Text(
                  'Prinsip Kerja & Konsep Kunci:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                ...penjelasan.poinKonsep.map(
                  (poin) => Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_circle_rounded,
                          size: 16,
                          color: Colors.indigo,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            poin,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.tune_rounded, color: Colors.indigo, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Fungsi Parameter yang Anda Atur',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 20),
                ...penjelasan.parameterPenjelasan.entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          entry.value,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade800,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: Colors.amber.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.amber.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.tips_and_updates_rounded,
                      color: Colors.amber.shade800,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Tips Penerapan di Aplikasi Nyata',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber.shade900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ...penjelasan.tipsPenerapan.map(
                  (tip) => Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_right_rounded,
                          size: 20,
                          color: Colors.amber.shade800,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            tip,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.brown.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCodeTab(String generatedCode) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          elevation: 0,
          color: const Color(0xFF1E1E2E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.amberAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.greenAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Dart Code (Auto-Generated)',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.copy_rounded,
                        color: Colors.white70,
                        size: 18,
                      ),
                      tooltip: 'Salin Kode',
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: generatedCode));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Kode kustom berhasil disalin ke clipboard!',
                            ),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const Divider(color: Colors.white24, height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SelectableText(
                    generatedCode,
                    style: const TextStyle(
                      color: Color(0xFFA6E3A1),
                      fontFamily: 'monospace',
                      fontSize: 13,
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: generatedCode));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Kode kustom berhasil disalin!'),
                duration: Duration(seconds: 1),
              ),
            );
          },
          icon: const Icon(Icons.copy_rounded),
          label: const Text('Salin Kode Ini ke Clipboard'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}

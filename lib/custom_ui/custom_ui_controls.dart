import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/custom_ui/custom_ui_enum.dart';
import 'package:pelatihan_app_dev/custom_ui/custom_ui_state.dart';

class CustomUiControls extends StatefulWidget {
  final CustomUiConfig config;
  final ValueChanged<CustomUiConfig> onConfigChanged;

  const CustomUiControls({
    super.key,
    required this.config,
    required this.onConfigChanged,
  });

  @override
  State<CustomUiControls> createState() => _CustomUiControlsState();
}

class _CustomUiControlsState extends State<CustomUiControls> {
  late TextEditingController _titleCtrl;
  late TextEditingController _subtitleCtrl;
  late TextEditingController _metricCtrl;

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController(text: widget.config.title);
    _subtitleCtrl = TextEditingController(text: widget.config.subtitle);
    _metricCtrl = TextEditingController(text: widget.config.metricValue);
  }

  @override
  void didUpdateWidget(covariant CustomUiControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.config.title != widget.config.title) {
      _titleCtrl.text = widget.config.title;
    }
    if (oldWidget.config.subtitle != widget.config.subtitle) {
      _subtitleCtrl.text = widget.config.subtitle;
    }
    if (oldWidget.config.metricValue != widget.config.metricValue) {
      _metricCtrl.text = widget.config.metricValue;
    }
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _subtitleCtrl.dispose();
    _metricCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSectionCard(
          title: 'Template Layar Penuh',
          icon: Icons.dashboard_customize_rounded,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: CustomUiTemplate.values.map((tmpl) {
              final isSelected = widget.config.template == tmpl;
              return ChoiceChip(
                avatar: Icon(
                  tmpl.icon,
                  size: 16,
                  color: isSelected ? Colors.white : Colors.indigo,
                ),
                label: Text(tmpl.label, style: const TextStyle(fontSize: 12)),
                selected: isSelected,
                selectedColor: Colors.indigo,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                onSelected: (selected) {
                  if (selected) {
                    widget.onConfigChanged(CustomUiConfig.defaultConfig(tmpl));
                  }
                },
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 14),
        _buildSectionCard(
          title: 'Preset Tema & Mood Warna',
          icon: Icons.color_lens_rounded,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: UiThemePreset.values.map((preset) {
                final isSelected = widget.config.preset == preset;
                return GestureDetector(
                  onTap: () {
                    widget.onConfigChanged(
                      widget.config.copyWith(preset: preset),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? Colors.indigo : Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: preset.primary,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: preset.accent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            preset.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 14),
        _buildSectionCard(
          title: 'Simulator Bingkai Perangkat',
          icon: Icons.devices_rounded,
          child: Row(
            children: DeviceFrameType.values.map((frame) {
              final isSelected = widget.config.frameType == frame;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    avatar: Icon(
                      frame.icon,
                      size: 16,
                      color: isSelected ? Colors.white : Colors.indigo,
                    ),
                    label: Text(
                      frame.label,
                      style: const TextStyle(fontSize: 11),
                    ),
                    selected: isSelected,
                    selectedColor: Colors.indigo,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    onSelected: (val) {
                      if (val) {
                        widget.onConfigChanged(
                          widget.config.copyWith(frameType: frame),
                        );
                      }
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 14),
        _buildSectionCard(
          title: 'Geometri & Mode Layar',
          icon: Icons.tune_rounded,
          child: Column(
            children: [
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Mode Gelap Layar (Dark Mode Screen)'),
                subtitle: const Text(
                  'Uji tampilan dalam mode kontras malam hari',
                ),
                value: widget.config.isDarkMode,
                activeColor: Colors.indigo,
                onChanged: (val) {
                  widget.onConfigChanged(
                    widget.config.copyWith(isDarkMode: val),
                  );
                },
              ),
              const Divider(height: 16),
              _buildSliderRow(
                label: 'Global Border Radius',
                value: widget.config.borderRadius,
                min: 0,
                max: 32,
                unit: 'px',
                onChanged: (val) {
                  widget.onConfigChanged(
                    widget.config.copyWith(borderRadius: val),
                  );
                },
              ),
              const Divider(height: 16),
              _buildSliderRow(
                label: 'Elevasi Kartu Antarmuka',
                value: widget.config.elevation,
                min: 0,
                max: 8,
                unit: 'dp',
                onChanged: (val) {
                  widget.onConfigChanged(
                    widget.config.copyWith(elevation: val),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        _buildSectionCard(
          title: 'Teks & Konten Layar',
          icon: Icons.edit_note_rounded,
          child: Column(
            children: [
              TextField(
                controller: _titleCtrl,
                decoration: const InputDecoration(
                  labelText: 'Judul Utama / Nama',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                onChanged: (val) {
                  widget.onConfigChanged(widget.config.copyWith(title: val));
                },
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _subtitleCtrl,
                decoration: const InputDecoration(
                  labelText: 'Subjudul / Deskripsi',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.subtitles),
                ),
                onChanged: (val) {
                  widget.onConfigChanged(widget.config.copyWith(subtitle: val));
                },
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _metricCtrl,
                decoration: const InputDecoration(
                  labelText: 'Nilai Metrik / Harga / Status',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.price_change_outlined),
                ),
                onChanged: (val) {
                  widget.onConfigChanged(
                    widget.config.copyWith(metricValue: val),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        OutlinedButton.icon(
          onPressed: () {
            widget.onConfigChanged(
              CustomUiConfig.defaultConfig(widget.config.template),
            );
          },
          icon: const Icon(Icons.refresh_rounded),
          label: const Text('Reset Template ke Nilai Bawaan'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.redAccent,
            side: const BorderSide(color: Colors.redAccent),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: Colors.indigo),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 18),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildSliderRow({
    required String label,
    required double value,
    required double min,
    required double max,
    required String unit,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 12)),
            Text(
              '${value.toStringAsFixed(1)} $unit',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
        Slider(
          value: value.clamp(min, max),
          min: min,
          max: max,
          activeColor: Colors.indigo,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

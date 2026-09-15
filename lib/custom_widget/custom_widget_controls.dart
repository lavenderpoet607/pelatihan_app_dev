import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/custom_widget/custom_widget_enum.dart';
import 'package:pelatihan_app_dev/custom_widget/custom_widget_state.dart';

class CustomWidgetControls extends StatefulWidget {
  final CustomWidgetConfig config;
  final ValueChanged<CustomWidgetConfig> onConfigChanged;

  const CustomWidgetControls({
    super.key,
    required this.config,
    required this.onConfigChanged,
  });

  @override
  State<CustomWidgetControls> createState() => _CustomWidgetControlsState();
}

class _CustomWidgetControlsState extends State<CustomWidgetControls> {
  late TextEditingController _titleController;
  late TextEditingController _subtitleController;

  static const List<IconData> _availableIcons = [
    Icons.stars_rounded,
    Icons.rocket_launch_rounded,
    Icons.person_outline_rounded,
    Icons.verified_user_rounded,
    Icons.campaign_rounded,
    Icons.favorite_rounded,
    Icons.flash_on_rounded,
    Icons.shield_rounded,
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.config.title);
    _subtitleController = TextEditingController(text: widget.config.subtitle);
  }

  @override
  void didUpdateWidget(covariant CustomWidgetControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.config.title != widget.config.title) {
      _titleController.text = widget.config.title;
    }
    if (oldWidget.config.subtitle != widget.config.subtitle) {
      _subtitleController.text = widget.config.subtitle;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSectionCard(
          title: 'Tipe Custom Widget',
          icon: Icons.category_rounded,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: CustomWidgetType.values.map((type) {
                final isSelected = widget.config.widgetType == type;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    avatar: Icon(
                      type.icon,
                      size: 18,
                      color: isSelected ? Colors.white : Colors.indigo,
                    ),
                    label: Text(type.label),
                    selected: isSelected,
                    selectedColor: Colors.indigo,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    onSelected: (selected) {
                      if (selected) {
                        widget.onConfigChanged(
                          CustomWidgetConfig.defaultConfig(type),
                        );
                      }
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildSectionCard(
          title: 'Tema Warna',
          icon: Icons.palette_rounded,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: CustomColorTheme.values.map((theme) {
                final isSelected = widget.config.colorTheme == theme;
                return GestureDetector(
                  onTap: () {
                    widget.onConfigChanged(
                      widget.config.copyWith(colorTheme: theme),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.black87 : Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              size: 18,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildSectionCard(
          title: 'Ukuran & Bentuk Geometris',
          icon: Icons.aspect_ratio_rounded,
          child: Column(
            children: [
              _buildSliderRow(
                label: 'Border Radius',
                value: widget.config.borderRadius,
                min: 0,
                max: 40,
                unit: 'px',
                onChanged: (val) {
                  widget.onConfigChanged(
                    widget.config.copyWith(borderRadius: val),
                  );
                },
              ),
              const Divider(height: 20),
              _buildSliderRow(
                label: 'Padding Konten',
                value: widget.config.padding,
                min: 4,
                max: 32,
                unit: 'px',
                onChanged: (val) {
                  widget.onConfigChanged(widget.config.copyWith(padding: val));
                },
              ),
              const Divider(height: 20),
              _buildSliderRow(
                label: 'Elevasi & Bayangan',
                value: widget.config.elevation,
                min: 0,
                max: 12,
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
        const SizedBox(height: 16),
        _buildSectionCard(
          title: 'Efek Visual & Gaya',
          icon: Icons.auto_awesome_rounded,
          child: Column(
            children: [
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Gunakan Gradasi Warna (LinearGradient)'),
                subtitle: const Text('Mencampur warna primer dan aksen tema'),
                value: widget.config.hasGradient,
                activeThumbColor: Colors.indigo,
                onChanged: (val) {
                  widget.onConfigChanged(
                    widget.config.copyWith(hasGradient: val),
                  );
                },
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Aktifkan Bayangan (BoxShadow)'),
                subtitle: const Text(
                  'Menampilkan bayangan lembut di bawah widget',
                ),
                value: widget.config.hasShadow,
                activeThumbColor: Colors.indigo,
                onChanged: (val) {
                  widget.onConfigChanged(
                    widget.config.copyWith(hasShadow: val),
                  );
                },
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Gaya Garis Luar (Is Outlined)'),
                subtitle: const Text('Beri garis border tepi yang kontras'),
                value: widget.config.isOutlined,
                activeThumbColor: Colors.indigo,
                onChanged: (val) {
                  widget.onConfigChanged(
                    widget.config.copyWith(isOutlined: val),
                  );
                },
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Status Aktif (Is Active)'),
                subtitle: const Text('Kontrol ketersediaan interaksi widget'),
                value: widget.config.isActive,
                activeThumbColor: Colors.indigo,
                onChanged: (val) {
                  widget.onConfigChanged(widget.config.copyWith(isActive: val));
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildSectionCard(
          title: 'Konten & Ikon',
          icon: Icons.edit_note_rounded,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Judul Utama',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title_rounded),
                ),
                onChanged: (val) {
                  widget.onConfigChanged(widget.config.copyWith(title: val));
                },
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _subtitleController,
                decoration: const InputDecoration(
                  labelText: 'Subjudul / Deskripsi',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.short_text_rounded),
                ),
                onChanged: (val) {
                  widget.onConfigChanged(widget.config.copyWith(subtitle: val));
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Pilih Ikon Simbol:',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _availableIcons.map((icon) {
                  final isSelected = widget.config.selectedIcon == icon;
                  return ChoiceChip(
                    label: Icon(
                      icon,
                      size: 20,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                    selected: isSelected,
                    selectedColor: widget.config.colorTheme.primaryColor,
                    onSelected: (selected) {
                      if (selected) {
                        widget.onConfigChanged(
                          widget.config.copyWith(selectedIcon: icon),
                        );
                      }
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildSectionCard(
          title: 'Aksi & Respon Fungsi',
          icon: Icons.touch_app_rounded,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pilih jenis respon fungsi saat widget diklik:',
                style: TextStyle(fontSize: 13, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              RadioGroup<CustomActionType>(
                groupValue: widget.config.actionType,
                onChanged: (value) {
                  if (value != null) {
                    widget.onConfigChanged(
                      widget.config.copyWith(actionType: value),
                    );
                  }
                },
                child: Column(
                  children: CustomActionType.values.map((action) {
                    final isSelected = widget.config.actionType == action;
                    return RadioListTile<CustomActionType>(
                      contentPadding: EdgeInsets.zero,
                      value: action,
                      activeColor: Colors.indigo,
                      title: Text(
                        action.label,
                        style: TextStyle(
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(
                        action.deskripsi,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () {
            widget.onConfigChanged(
              CustomWidgetConfig.defaultConfig(widget.config.widgetType),
            );
          },
          icon: const Icon(Icons.refresh_rounded),
          label: const Text('Reset Konfigurasi ke Default'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.redAccent,
            side: const BorderSide(color: Colors.redAccent),
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: Colors.indigo),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
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
            Text(label, style: const TextStyle(fontSize: 13)),
            Text(
              '${value.toStringAsFixed(1)} $unit',
              style: const TextStyle(
                fontSize: 13,
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

import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/custom_widget/custom_widget_enum.dart';
import 'package:pelatihan_app_dev/custom_widget/custom_widget_state.dart';

class CustomWidgetCodeGenerator {
  static String generate(CustomWidgetConfig config) {
    switch (config.widgetType) {
      case CustomWidgetType.card:
        return _generateCardCode(config);
      case CustomWidgetType.button:
        return _generateButtonCode(config);
      case CustomWidgetType.inputField:
        return _generateInputFieldCode(config);
      case CustomWidgetType.avatar:
        return _generateAvatarCode(config);
      case CustomWidgetType.banner:
        return _generateBannerCode(config);
    }
  }

  static String _generateCardCode(CustomWidgetConfig config) {
    final primaryHex =
        '0x${config.colorTheme.primaryColor.toARGB32().toRadixString(16).toUpperCase()}';
    final accentHex =
        '0x${config.colorTheme.accentColor.toARGB32().toRadixString(16).toUpperCase()}';
    final radius = config.borderRadius.toStringAsFixed(1);
    final pad = config.padding.toStringAsFixed(1);
    final shadowStr = config.hasShadow
        ? '''
    boxShadow: [
      BoxShadow(
        color: Color($primaryHex).withOpacity(0.25),
        blurRadius: ${config.elevation * 3},
        offset: Offset(0, ${config.elevation}),
      ),
    ],'''
        : '';
    final borderStr = config.isOutlined
        ? '''
    border: Border.all(color: Color($primaryHex), width: 2),'''
        : '';
    final bgDecoration = config.hasGradient
        ? '''
    gradient: LinearGradient(
      colors: [Color($primaryHex), Color($accentHex)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),'''
        : '''
    color: Color($primaryHex),''';

    return '''Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular($radius),$borderStr$bgDecoration$shadowStr
  ),
  child: Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular($radius),
      onTap: () {
        ${_generateActionSnippet(config.actionType)}
      },
      child: Padding(
        padding: const EdgeInsets.all($pad),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.${_iconName(config.selectedIcon)},
                color: Colors.white,
                size: 26,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${config.title}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${config.subtitle}",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Colors.white70,
            ),
          ],
        ),
      ),
    ),
  ),
)''';
  }

  static String _generateButtonCode(CustomWidgetConfig config) {
    final primaryHex =
        '0x${config.colorTheme.primaryColor.toARGB32().toRadixString(16).toUpperCase()}';
    final accentHex =
        '0x${config.colorTheme.accentColor.toARGB32().toRadixString(16).toUpperCase()}';
    final radius = config.borderRadius.toStringAsFixed(1);
    final pad = config.padding.toStringAsFixed(1);

    if (config.hasGradient) {
      return '''Container(
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color($primaryHex), Color($accentHex)],
    ),
    borderRadius: BorderRadius.circular($radius),
    boxShadow: ${config.hasShadow ? '[BoxShadow(color: Color($primaryHex).withOpacity(0.3), blurRadius: ${config.elevation * 2}, offset: Offset(0, ${config.elevation}))]' : 'null'},
  ),
  child: ElevatedButton.icon(
    onPressed: ${config.isActive ? '() { ${_generateActionSnippet(config.actionType)} }' : 'null'},
    icon: const Icon(Icons.${_iconName(config.selectedIcon)}, color: Colors.white),
    label: Text(
      "${config.title}",
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: $pad),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular($radius),
      ),
    ),
  ),
)''';
    }

    return '''ElevatedButton.icon(
  onPressed: ${config.isActive ? '() { ${_generateActionSnippet(config.actionType)} }' : 'null'},
  icon: const Icon(Icons.${_iconName(config.selectedIcon)}),
  label: Text("${config.title}"),
  style: ElevatedButton.styleFrom(
    backgroundColor: Color($primaryHex),
    foregroundColor: Colors.white,
    elevation: ${config.elevation},
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: $pad),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular($radius),
      side: ${config.isOutlined ? 'const BorderSide(color: Colors.white, width: 2)' : 'BorderSide.none'},
    ),
  ),
)''';
  }

  static String _generateInputFieldCode(CustomWidgetConfig config) {
    final primaryHex =
        '0x${config.colorTheme.primaryColor.toARGB32().toRadixString(16).toUpperCase()}';
    final radius = config.borderRadius.toStringAsFixed(1);

    return '''TextField(
  enabled: ${config.isActive},
  decoration: InputDecoration(
    labelText: "${config.title}",
    hintText: "${config.subtitle}",
    prefixIcon: const Icon(Icons.${_iconName(config.selectedIcon)}, color: Color($primaryHex)),
    filled: true,
    fillColor: Colors.grey.shade50,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular($radius),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular($radius),
      borderSide: const BorderSide(color: Color($primaryHex), width: 2),
    ),
  ),
  onChanged: (value) {
    ${_generateActionSnippet(config.actionType)}
  },
)''';
  }

  static String _generateAvatarCode(CustomWidgetConfig config) {
    final primaryHex =
        '0x${config.colorTheme.primaryColor.toARGB32().toRadixString(16).toUpperCase()}';
    final accentHex =
        '0x${config.colorTheme.accentColor.toARGB32().toRadixString(16).toUpperCase()}';
    final pad = config.padding.toStringAsFixed(1);

    return '''Stack(
  clipBehavior: Clip.none,
  children: [
    Container(
      padding: const EdgeInsets.all($pad),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: ${config.hasGradient ? 'const LinearGradient(colors: [Color($primaryHex), Color($accentHex)])' : 'null'},
        color: ${!config.hasGradient ? 'Color($primaryHex)' : 'null'},
        boxShadow: ${config.hasShadow ? '[BoxShadow(color: Color($primaryHex).withOpacity(0.35), blurRadius: ${config.elevation * 2}, offset: Offset(0, ${config.elevation}))]' : 'null'},
      ),
      child: CircleAvatar(
        radius: ${config.borderRadius.clamp(28.0, 50.0)},
        backgroundColor: Colors.white,
        child: Icon(Icons.${_iconName(config.selectedIcon)}, size: 36, color: Color($primaryHex)),
      ),
    ),
    Positioned(
      bottom: 4,
      right: 4,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: ${config.isActive ? 'Colors.green' : 'Colors.grey'},
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.5),
        ),
      ),
    ),
  ],
)''';
  }

  static String _generateBannerCode(CustomWidgetConfig config) {
    final primaryHex =
        '0x${config.colorTheme.primaryColor.toARGB32().toRadixString(16).toUpperCase()}';
    final radius = config.borderRadius.toStringAsFixed(1);
    final pad = config.padding.toStringAsFixed(1);

    return '''Container(
  padding: const EdgeInsets.all($pad),
  decoration: BoxDecoration(
    color: Color($primaryHex).withOpacity(0.12),
    borderRadius: BorderRadius.circular($radius),
    border: Border.all(color: Color($primaryHex).withOpacity(0.4), width: 1.5),
  ),
  child: Row(
    children: [
      Icon(Icons.${_iconName(config.selectedIcon)}, color: Color($primaryHex), size: 28),
      const SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${config.title}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 2),
            Text(
              "${config.subtitle}",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
            ),
          ],
        ),
      ),
      IconButton(
        icon: const Icon(Icons.close, size: 18),
        onPressed: () {
          ${_generateActionSnippet(config.actionType)}
        },
      ),
    ],
  ),
)''';
  }

  static String _generateActionSnippet(CustomActionType type) {
    switch (type) {
      case CustomActionType.snackBar:
        return 'ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Aksi dijalankan!")));';
      case CustomActionType.dialogAlert:
        return '''showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Informasi"),
            content: const Text("Dialog kustom berhasil dibuka."),
            actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Tutup"))],
          ),
        );''';
      case CustomActionType.modalBottomSheet:
        return '''showModalBottomSheet(
          context: context,
          builder: (ctx) => Container(
            padding: const EdgeInsets.all(20),
            child: const Text("Panel Modal BottomSheet Terbuka"),
          ),
        );''';
      case CustomActionType.toggleState:
        return 'setState(() { isAktif = !isAktif; });';
    }
  }

  static String _iconName(IconData icon) {
    if (icon == Icons.stars_rounded) return 'stars_rounded';
    if (icon == Icons.rocket_launch_rounded) return 'rocket_launch_rounded';
    if (icon == Icons.person_outline_rounded) return 'person_outline_rounded';
    if (icon == Icons.verified_user_rounded) return 'verified_user_rounded';
    if (icon == Icons.campaign_rounded) return 'campaign_rounded';
    if (icon == Icons.favorite_rounded) return 'favorite_rounded';
    if (icon == Icons.flash_on_rounded) return 'flash_on_rounded';
    if (icon == Icons.shield_rounded) return 'shield_rounded';
    return 'star_rounded';
  }
}

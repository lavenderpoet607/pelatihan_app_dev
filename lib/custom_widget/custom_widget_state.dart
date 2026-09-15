import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/custom_widget/custom_widget_enum.dart';

class CustomWidgetConfig {
  final CustomWidgetType widgetType;
  final CustomColorTheme colorTheme;
  final double borderRadius;
  final double padding;
  final double elevation;
  final bool hasGradient;
  final bool hasShadow;
  final bool isOutlined;
  final String title;
  final String subtitle;
  final IconData selectedIcon;
  final CustomActionType actionType;
  final bool isActive;
  final bool isLoading;

  const CustomWidgetConfig({
    required this.widgetType,
    required this.colorTheme,
    required this.borderRadius,
    required this.padding,
    required this.elevation,
    required this.hasGradient,
    required this.hasShadow,
    required this.isOutlined,
    required this.title,
    required this.subtitle,
    required this.selectedIcon,
    required this.actionType,
    required this.isActive,
    required this.isLoading,
  });

  factory CustomWidgetConfig.defaultConfig(CustomWidgetType type) {
    switch (type) {
      case CustomWidgetType.card:
        return const CustomWidgetConfig(
          widgetType: CustomWidgetType.card,
          colorTheme: CustomColorTheme.indigo,
          borderRadius: 16.0,
          padding: 16.0,
          elevation: 4.0,
          hasGradient: true,
          hasShadow: true,
          isOutlined: false,
          title: 'Kartu Anggota Premium',
          subtitle: 'Akses penuh ke semua modul materi Flutter',
          selectedIcon: Icons.stars_rounded,
          actionType: CustomActionType.snackBar,
          isActive: true,
          isLoading: false,
        );
      case CustomWidgetType.button:
        return const CustomWidgetConfig(
          widgetType: CustomWidgetType.button,
          colorTheme: CustomColorTheme.blue,
          borderRadius: 12.0,
          padding: 14.0,
          elevation: 3.0,
          hasGradient: true,
          hasShadow: true,
          isOutlined: false,
          title: 'Mulai Belajar Sekarang',
          subtitle: 'Klik tombol untuk aksi',
          selectedIcon: Icons.rocket_launch_rounded,
          actionType: CustomActionType.snackBar,
          isActive: true,
          isLoading: false,
        );
      case CustomWidgetType.inputField:
        return const CustomWidgetConfig(
          widgetType: CustomWidgetType.inputField,
          colorTheme: CustomColorTheme.teal,
          borderRadius: 14.0,
          padding: 16.0,
          elevation: 0.0,
          hasGradient: false,
          hasShadow: false,
          isOutlined: true,
          title: 'Nama Lengkap',
          subtitle: 'Masukkan nama pengguna sesuai KTP',
          selectedIcon: Icons.person_outline_rounded,
          actionType: CustomActionType.toggleState,
          isActive: true,
          isLoading: false,
        );
      case CustomWidgetType.avatar:
        return const CustomWidgetConfig(
          widgetType: CustomWidgetType.avatar,
          colorTheme: CustomColorTheme.emerald,
          borderRadius: 50.0,
          padding: 4.0,
          elevation: 4.0,
          hasGradient: true,
          hasShadow: true,
          isOutlined: false,
          title: 'Ridho Dibaja',
          subtitle: 'Flutter Developer (Online)',
          selectedIcon: Icons.verified_user_rounded,
          actionType: CustomActionType.modalBottomSheet,
          isActive: true,
          isLoading: false,
        );
      case CustomWidgetType.banner:
        return const CustomWidgetConfig(
          widgetType: CustomWidgetType.banner,
          colorTheme: CustomColorTheme.amber,
          borderRadius: 16.0,
          padding: 16.0,
          elevation: 2.0,
          hasGradient: false,
          hasShadow: true,
          isOutlined: false,
          title: 'Pengumuman Penting',
          subtitle: 'Modul latihan baru telah tersedia untuk dipelajari',
          selectedIcon: Icons.campaign_rounded,
          actionType: CustomActionType.dialogAlert,
          isActive: true,
          isLoading: false,
        );
    }
  }

  CustomWidgetConfig copyWith({
    CustomWidgetType? widgetType,
    CustomColorTheme? colorTheme,
    double? borderRadius,
    double? padding,
    double? elevation,
    bool? hasGradient,
    bool? hasShadow,
    bool? isOutlined,
    String? title,
    String? subtitle,
    IconData? selectedIcon,
    CustomActionType? actionType,
    bool? isActive,
    bool? isLoading,
  }) {
    return CustomWidgetConfig(
      widgetType: widgetType ?? this.widgetType,
      colorTheme: colorTheme ?? this.colorTheme,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      elevation: elevation ?? this.elevation,
      hasGradient: hasGradient ?? this.hasGradient,
      hasShadow: hasShadow ?? this.hasShadow,
      isOutlined: isOutlined ?? this.isOutlined,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      selectedIcon: selectedIcon ?? this.selectedIcon,
      actionType: actionType ?? this.actionType,
      isActive: isActive ?? this.isActive,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

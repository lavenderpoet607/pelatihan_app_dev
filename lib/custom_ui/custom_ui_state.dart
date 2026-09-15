import 'package:pelatihan_app_dev/custom_ui/custom_ui_enum.dart';

class CustomUiConfig {
  final CustomUiTemplate template;
  final UiThemePreset preset;
  final DeviceFrameType frameType;
  final bool isDarkMode;
  final double borderRadius;
  final double elevation;
  final double padding;
  final String title;
  final String subtitle;
  final String extraText;
  final String metricValue;
  final bool isBookmarked;
  final int cartQuantity;
  final int selectedOptionIndex;

  const CustomUiConfig({
    required this.template,
    required this.preset,
    required this.frameType,
    required this.isDarkMode,
    required this.borderRadius,
    required this.elevation,
    required this.padding,
    required this.title,
    required this.subtitle,
    required this.extraText,
    required this.metricValue,
    required this.isBookmarked,
    required this.cartQuantity,
    required this.selectedOptionIndex,
  });

  factory CustomUiConfig.defaultConfig(CustomUiTemplate template) {
    switch (template) {
      case CustomUiTemplate.profileScreen:
        return const CustomUiConfig(
          template: CustomUiTemplate.profileScreen,
          preset: UiThemePreset.modernBlue,
          frameType: DeviceFrameType.smartphone,
          isDarkMode: false,
          borderRadius: 16.0,
          elevation: 2.0,
          padding: 16.0,
          title: 'Ridho Dibaja Tawang',
          subtitle: 'Mobile App Developer & UI Specialist',
          extraText: 'Jakarta, Indonesia • Aktif Membangun Proyek',
          metricValue: '1.240 Pengikut',
          isBookmarked: false,
          cartQuantity: 1,
          selectedOptionIndex: 0,
        );
      case CustomUiTemplate.ecommerceDetail:
        return const CustomUiConfig(
          template: CustomUiTemplate.ecommerceDetail,
          preset: UiThemePreset.pastelSunset,
          frameType: DeviceFrameType.smartphone,
          isDarkMode: false,
          borderRadius: 18.0,
          elevation: 3.0,
          padding: 16.0,
          title: 'Sepatu Olahraga Running Pro X',
          subtitle: 'Bantalan responsif ultra-ringan dengan sirkulasi udara optimal untuk lari jarak jauh.',
          extraText: 'Ukuran: 42 • Varian: Sunset Orange',
          metricValue: 'Rp 899.000',
          isBookmarked: false,
          cartQuantity: 1,
          selectedOptionIndex: 1,
        );
      case CustomUiTemplate.newsFeed:
        return const CustomUiConfig(
          template: CustomUiTemplate.newsFeed,
          preset: UiThemePreset.darkCyber,
          frameType: DeviceFrameType.smartphone,
          isDarkMode: true,
          borderRadius: 14.0,
          elevation: 2.0,
          padding: 16.0,
          title: 'Perkembangan AI & Framework Flutter 2026',
          subtitle: 'Generasi baru rendering grafis dan interaktivitas multiplatform yang mengubah industri aplikasi.',
          extraText: '5 Menit Baca • Oleh Ferry Santoso',
          metricValue: '12.5k Pembaca',
          isBookmarked: true,
          cartQuantity: 1,
          selectedOptionIndex: 0,
        );
      case CustomUiTemplate.dashboardAnalytics:
        return const CustomUiConfig(
          template: CustomUiTemplate.dashboardAnalytics,
          preset: UiThemePreset.emeraldEco,
          frameType: DeviceFrameType.smartphone,
          isDarkMode: false,
          borderRadius: 20.0,
          elevation: 3.0,
          padding: 16.0,
          title: 'Total Saldo Keuangan',
          subtitle: 'Kenaikan performa portofolio +18.4% bulan ini',
          extraText: 'Status: Akun Terverifikasi Tingkat Utama',
          metricValue: 'Rp 42.850.000',
          isBookmarked: false,
          cartQuantity: 1,
          selectedOptionIndex: 0,
        );
      case CustomUiTemplate.formCheckout:
        return const CustomUiConfig(
          template: CustomUiTemplate.formCheckout,
          preset: UiThemePreset.luxuryGold,
          frameType: DeviceFrameType.smartphone,
          isDarkMode: false,
          borderRadius: 16.0,
          elevation: 2.0,
          padding: 16.0,
          title: 'Ringkasan Pesanan Pembelian',
          subtitle: 'Pengiriman Reguler (1-2 Hari Kerja)',
          extraText: 'Metode Pembayaran: Dompet Digital Instan',
          metricValue: 'Total: Rp 914.000',
          isBookmarked: false,
          cartQuantity: 1,
          selectedOptionIndex: 0,
        );
    }
  }

  CustomUiConfig copyWith({
    CustomUiTemplate? template,
    UiThemePreset? preset,
    DeviceFrameType? frameType,
    bool? isDarkMode,
    double? borderRadius,
    double? elevation,
    double? padding,
    String? title,
    String? subtitle,
    String? extraText,
    String? metricValue,
    bool? isBookmarked,
    int? cartQuantity,
    int? selectedOptionIndex,
  }) {
    return CustomUiConfig(
      template: template ?? this.template,
      preset: preset ?? this.preset,
      frameType: frameType ?? this.frameType,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      padding: padding ?? this.padding,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      extraText: extraText ?? this.extraText,
      metricValue: metricValue ?? this.metricValue,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      cartQuantity: cartQuantity ?? this.cartQuantity,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
    );
  }
}

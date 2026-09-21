import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/routes.dart';
import 'package:pelatihan_app_dev/main.dart';
import 'package:pelatihan_app_dev/latihan_widget/drawer/latihan_drawer.dart';
import 'package:pelatihan_app_dev/latihan_widget/navigasi/latihan_navigasi.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas7/tugas_7_syarat_dan_ketentuan.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas8/tugas_8.dart';
import 'package:pelatihan_app_dev/tugas/ferry/tugas9/tugas_9.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas10/tugas_10_register_form.dart';
import 'package:pelatihan_app_dev/tugas/habibi/tugas11/tugas_11_shared_preferences.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas12/tugas_12_database_sqflite.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas13/tugas_13_database_sqflite.dart';
import 'package:pelatihan_app_dev/custom_widget/halaman_custom_widget.dart';
import 'package:pelatihan_app_dev/custom_ui/halaman_custom_ui_studio.dart';
import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/halaman_latihan_login_db.dart';
import 'package:pelatihan_app_dev/latihan_widget/shared_pref_session/halaman_splash_session.dart';

class AppRouting {
  static Map<String, WidgetBuilder> getRoutes({
    required bool isDarkMode,
    required ValueChanged<bool> onThemeChanged,
    WidgetBuilder? homeBuilder,
  }) {
    return {
      AppRoutes.home:
          homeBuilder ??
          ((context) => MultiWidgetApp(
            isDarkMode: isDarkMode,
            onThemeChanged: onThemeChanged,
          )),
      AppRoutes.latihanNavigasi: (context) => const LatihanNavigasi(),
      AppRoutes.latihanDrawer: (context) => const LatihanDrawer(),
      AppRoutes.tujuanNavigasi: (context) =>
          const HalamanTujuanNavigasi(metode: MetodeNavigasi.pushNamed),
      AppRoutes.tugas7: (context) =>
          Tugas7(isDarkMode: isDarkMode, onThemeChanged: onThemeChanged),
      AppRoutes.tugas8: (context) =>
          Tugas8(isDarkMode: isDarkMode, onThemeChanged: onThemeChanged),
      AppRoutes.tugas9: (context) => const Tugas9(),
      AppRoutes.tugas10: (context) => const Tugas10(),
      AppRoutes.tugas11: (context) => const Tugas11(),
      AppRoutes.tugas12: (context) => const Tugas12(),
      AppRoutes.tugas13: (context) => const Tugas13(),
      AppRoutes.customWidget: (context) => const HalamanCustomWidget(),
      AppRoutes.customUi: (context) => const HalamanCustomUiStudio(),
      AppRoutes.latihanTextFormFieldLogin: (context) => const LoginScreenDB(),
      AppRoutes.latihanSharedPrefSession: (context) =>
          const SplashScreenDay15(),
    };
  }

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings, {
    required bool isDarkMode,
    required ValueChanged<bool> onThemeChanged,
    WidgetBuilder? homeBuilder,
  }) {
    final routes = getRoutes(
      isDarkMode: isDarkMode,
      onThemeChanged: onThemeChanged,
      homeBuilder: homeBuilder,
    );
    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: settings);
    }
    return null;
  }
}

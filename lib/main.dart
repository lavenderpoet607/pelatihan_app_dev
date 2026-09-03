import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_rich_text.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_column.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_row.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_scaffold.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_widget_circle_avatar.dart';
import 'package:pelatihan_app_dev/latihan_widget/latihan_widget_icon.dart';
import 'package:pelatihan_app_dev/tugas/tugas_1.dart';
import 'package:pelatihan_app_dev/tugas/tugas_2.dart';
import 'package:pelatihan_app_dev/tugas/tugas_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MultiWidgetApp());
  }
}

class MultiWidgetApp extends StatefulWidget {
  const MultiWidgetApp({super.key});

  @override
  State<MultiWidgetApp> createState() => _MultiWidgetAppState();
}

class _MultiWidgetAppState extends State<MultiWidgetApp> {
  int _currentIndex = 0;

  List<Widget> getWidgets() {
    return [
      const LatihanScaffold(),
      const LatihanColumn(),
      const LatihanRow(),
      const LatihanRichText(),
      const LatihanWidgetIcon(),
      const LatihanWidgetCircleAvatar(),
      const Tugas1(),
      const Tugas2(),
      const Tugas3(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WIDGET LATIHAN',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 248, 14, 14),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: getWidgets()[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 3, 168, 245),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_agenda),
            label: 'Scaffold',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_column),
            label: 'Column',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.view_week), label: 'Row'),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_format),
            label: 'RichText',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Icon'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'CircleAvatar',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tugas 1'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tugas 2'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tugas 3'),
        ],
      ),
    );
  }
}

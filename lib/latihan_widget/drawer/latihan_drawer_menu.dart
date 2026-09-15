import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/latihan_widget/drawer/latihan_drawer_enum.dart';

class LatihanDrawerMenu extends StatelessWidget {
  final LatihanDrawerPage selectedPage;
  final ValueChanged<LatihanDrawerPage> onPageSelected;

  const LatihanDrawerMenu({
    super.key,
    required this.selectedPage,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Budi Setiawan"),
            accountEmail: Text("budi.setiawan@email.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "B",
                style: TextStyle(fontSize: 40.0, color: Colors.blue),
              ),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ...LatihanDrawerPage.values.map(
            (item) => ListTile(
              leading: Icon(item.icon),
              title: Text(item.menuTitle),
              selected: selectedPage == item,
              onTap: () {
                onPageSelected(item);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

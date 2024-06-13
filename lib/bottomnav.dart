import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/data/constant.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/profilePage.dart';

// ignore: must_be_immutable
class BottomNav extends StatefulWidget {
  BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  List<Widget> get pages => [const HomePage(), const ProfilePage()];

  void _onItemTapped(int index) async {
    if (index >= 0 && index < pages.length) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: pages.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: const Color.fromRGBO(147, 147, 147, 1),
            selectedItemColor: appMainColor,
            selectedFontSize: 12,
            unselectedFontSize: 9,
            unselectedLabelStyle: GoogleFonts.nunito(textStyle: const TextStyle(color: Color.fromRGBO(147, 147, 147, 1))),
            selectedLabelStyle: GoogleFonts.nunito(textStyle: TextStyle(color: appMainColor, fontWeight: FontWeight.w500)),
            elevation: 10,
            backgroundColor: Colors.grey.shade300,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.home, size: 25, color: appMainColor),
                icon: const Icon(Icons.home, size: 20, color: Color.fromRGBO(147, 147, 147, 1)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.person, size: 25, color: appMainColor),
                icon: const Icon(Icons.person, size: 20, color: Color.fromRGBO(147, 147, 147, 1)),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ],
    );
  }
}

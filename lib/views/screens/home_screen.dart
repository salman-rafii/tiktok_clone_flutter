import 'package:flutter/material.dart';
import 'package:tiktok_clone_flutter/utils/constants.dart';
import 'package:tiktok_clone_flutter/views/widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColor,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: redColor,
        unselectedItemColor: whiteColor,
        currentIndex: pageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: "Search",
            tooltip: "Search",
          ),
          BottomNavigationBarItem(
            icon: CustomIcon(),
            label: "",
            tooltip: "Add Video",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              size: 30,
            ),
            label: "Messages",
            tooltip: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: "Profile",
            tooltip: "Profile",
          ),
        ],
      ),
      body: Center(child: pages[pageIndex]),
    );
  }
}

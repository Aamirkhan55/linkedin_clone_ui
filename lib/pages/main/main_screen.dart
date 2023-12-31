import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_clone_ui/pages/main/AppBar_Widgets/appBar_widget.dart';
import 'package:linkedin_clone_ui/pages/main/AppBar_Widgets/drawar_widget.dart';
import 'package:linkedin_clone_ui/pages/main/create/create_screen.dart';
import 'package:linkedin_clone_ui/pages/main/home/home_screen.dart';
import 'package:linkedin_clone_ui/pages/main/jobs/jobs_screen.dart';
import 'package:linkedin_clone_ui/pages/main/network/network_screen.dart';
import 'package:linkedin_clone_ui/pages/main/notification/notification_screen.dart';
import 'package:linkedin_clone_ui/theme/style.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      key: _scaffoldState,
      appBar: _currentPageIndex == 4? appBarWidget(
          context,
          title: "Search Jobs",
          isJobsTab: true,
          onLeadingTapClickListener: () {
            setState(() {
              _scaffoldState.currentState!.openDrawer();
            });
          }
      ) :appBarWidget(
          context,
          title: "Search",
          isJobsTab: false,
          onLeadingTapClickListener: () {
            setState(() {
              _scaffoldState.currentState!.openDrawer();
            });
          }
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedItemColor: linkedInBlack000000,
        selectedLabelStyle: const TextStyle(color: linkedInBlack000000),
        unselectedItemColor: linkedInMediumGrey86888A,
        unselectedLabelStyle: const TextStyle(color: linkedInMediumGrey86888A),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_fill),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userGroup),
            label: "Network",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box,
              size: 30,
            ),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              size: 30,
            ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.briefcase),
            label: "Jobs",
          ),
        ],
      ),
      body: _switchPages(_currentPageIndex)
    );
  }

  _switchPages(int index) {
    switch (index) {
      case 0:
        {
          return const HomeScreen();
        }
      case 1:
        {
          return const NetworkScreen();
        }
      case 2:
        {
          return CreateScreen(onCloneClickListener: () {
            Navigator.pop(context);
            setState(() {
              _currentPageIndex = 0;
            });
          },);
        }
      case 3:
        {
          return const NotificationScreen();
        }
      case 4:
        {
          return const JobsScreen();
        }
    }
  }
}
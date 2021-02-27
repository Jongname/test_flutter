
import 'package:flutter/material.dart';
import 'package:test_flutter/constants/screen_size.dart';
import 'package:test_flutter/screens/feed_screen.dart';
import 'package:test_flutter/screens/profile_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add'),
    BottomNavigationBarItem(icon: Icon(Icons.healing), label: 'healing'),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'account_circle')
  ];

  int selectedIndex = 0;

  static List<Widget> _screens = <Widget>[
    FeedScreen(),
    Container(color: Colors.amber,),
    Container(color: Colors.orange,),
    Container(color: Colors.blue,),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (size == null) {
      size = MediaQuery.of(context).size;
    }
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(items: btmNavItems,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black87,
        currentIndex: selectedIndex,
        onTap: _onBtmItemClick,),
    );
  }

  void _onBtmItemClick(int index) {
    print(index);
    setState(() {
      selectedIndex = index;
    });
  }
}
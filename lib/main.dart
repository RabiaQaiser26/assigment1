import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Assignment',
      debugShowCheckedModeBanner: false,
      home: ScaffoldExample(),
    );
  }
}

class ScaffoldExample extends StatefulWidget {
  @override
  _ScaffoldExampleState createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample> {
  String _floatingActionText = '';
  int _selectedIndex = 0;

  void _onFabPressed() {
    print('FAB Pressed');
    setState(() {
      _floatingActionText = 'FAB Pressed';
    });
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  final List<Widget> _pages = [
    Center(child: Text('Welcome to the Drawer App', style: TextStyle(fontSize: 20))),
    Center(child: Text('Search Page', style: TextStyle(fontSize: 20))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 20))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Assignment'),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Kashif Aman"),
              accountEmail: Text("kashif.aman@cecos.edu.pk"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "KA",
                  style: TextStyle(fontSize: 24.0, color: Colors.green),
                ),
              ),
              decoration: BoxDecoration(color: Colors.green),
            ),
            _buildDrawerItem("Home"),
            _buildDrawerItem("About"),
            _buildDrawerItem("Contact"),
            _buildDrawerItem("My Profile"),
            _buildDrawerItem("My Course"),
            _buildDrawerItem("Go Premium"),
            _buildDrawerItem("Saved Videos"),
            _buildDrawerItem("Edit Profile"),
            _buildDrawerItem("LogOut"),
          ],
        ),
      ),
      body: Stack(
        children: [
          _pages[_selectedIndex],
          if (_floatingActionText.isNotEmpty)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Text(
                  _floatingActionText,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onBottomNavTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // close the drawer
        _showSnackBar("$title clicked");
      },
    );
  }
}

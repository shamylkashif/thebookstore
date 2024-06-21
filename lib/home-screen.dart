import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:thebookstore/drawer/about_us.dart';
import 'package:thebookstore/drawer/logout.dart';
import 'package:thebookstore/drawer/profile.dart';
import 'package:thebookstore/drawer/settings.dart';
import 'package:thebookstore/screens/filter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> books = [
    {
      'title': 'Harry Potter',
      'author': 'J.K. Rowling',
      'price': '\$20.00',
      'imagePath': 'assets/slider/download.jpeg',
    },
    {
      'title': 'The Deadly Hallows',
      'author': 'Author 2',
      'price': '\$15.00',
      'imagePath': 'assets/slider/book2.jpg',
    },
    {
      'title': 'Forty Rules of Love',
      'author': 'Author 3',
      'price': '\$10.00',
      'imagePath': 'assets/slider/book3.jpg',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen() ));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MyProfile() ));

        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutUs() ));

        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings() ));

        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LogOut() ));

        break;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.yellow[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu_open_outlined, color: Colors.yellow[700]),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.notification_add, color: Colors.yellow[700]),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                accountName: Text('Clara Albert', style: TextStyle(color: Colors.white)),
                accountEmail: Text('clara21@gmail.com', style: TextStyle(color: Colors.white)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/pp.png'), // Replace with your profile image asset
                ),
              ),
              _buildDrawerItem(Icons.home, "HOME", 0),
              _buildDrawerItem(Icons.person, "PROFILE", 1),
              _buildDrawerItem(Icons.info, "ABOUT US", 2),
              _buildDrawerItem(Icons.settings, "SETTING", 3),
              _buildDrawerItem(Icons.logout, "LOGOUT", 4),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white,),
                    decoration: InputDecoration(
                      labelText: 'Search book',
                      labelStyle: TextStyle(color: Colors.yellow[700]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.yellow[700]),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list_alt, color: Colors.yellow[700]),
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> FilterScreen() ));
                  },
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Popular Books',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.yellow[700],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: books.map((book) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(book['imagePath']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Colors.black.withOpacity(0.5),
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      book['title']!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      book['author']!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      book['price']!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.grey),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.grey),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.yellow[700],
        onTap: _onItemTapped,
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon, color: _selectedIndex == index ? Colors.yellow[700] : Colors.white),
      title: Text(
        title,
        style: TextStyle(color: _selectedIndex == index ? Colors.yellow[700] : Colors.white),
      ),
      tileColor: _selectedIndex == index ? Colors.yellow : Colors.transparent,
      onTap: () {
        Navigator.pop(context);
        _onItemTapped(index);
      },
    );
  }
}

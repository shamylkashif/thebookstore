import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:thebookstore/commons/colors.dart';
import 'package:thebookstore/main.dart';

void main() {
  runApp(MyApp());
}



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'assets/slider/download.jpeg',
    'assets/slider/book2.jpg',
    'assets/slider/book3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        backgroundColor: backGround,
        title: Text('Home'),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Which book do you want to buy?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Search book',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Popular Books',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: images.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  BookItem(
                    title: 'Harry Potter',
                    author: 'J.K. Rowling',
                    price: '\$20.00',
                    imagePath: 'assets/slider/download.jpeg',
                  ),
                  BookItem(
                    title: 'Harry Potter and the deadly hollows',
                    author: 'J.K. Rowling',
                    price: '\$20.00',
                    imagePath: 'assets/slider/book2.jpg',
                  ),
                  BookItem(
                    title: 'Fourty rules of love',
                    author: 'Elif Shafq',
                    price: '\$20.00',
                    imagePath: 'assets/slider/book3.jpg',
                  ),
                  // Add more BookItem widgets here
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.orange,
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  final String title;
  final String author;
  final String price;
  final String imagePath;

  const BookItem({
    Key? key,
    required this.title,
    required this.author,
    required this.price,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Image.asset(imagePath, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(author),
        trailing: Text(price),
      ),
    );
  }
}

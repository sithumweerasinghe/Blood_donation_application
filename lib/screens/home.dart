import 'package:bloodapp/screens/about.dart';
import 'package:bloodapp/screens/finddonor.dart';
import 'package:bloodapp/screens/login.dart';
import 'package:bloodapp/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Go to Home Page'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/blood1.jpg',
    'assets/images/blood2.png',
    'assets/images/blood3.jpg',
  ];

  Future<void> _signOut(BuildContext context) async {
    // Sign out from Firebase Auth
    await FirebaseAuth.instance.signOut();

    // Clear user data from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLoggedIn');

    // Navigate to welcome page
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/applogo.png', 
                      height: 70,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Blood Donation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.login),
                title: const Text('Login'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_emergency),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage(userData: {},)),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_page),
                title: const Text('Contact'),
                onTap: () {
                  // Add contact page navigation or content here
                  Navigator.pop(context);
                },
              ),
              // Additional Buttons
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                onTap: () {
                  // Add notification page navigation or content here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Add settings page navigation or content here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favorites'),
                onTap: () {
                  // Add favorites page navigation or content here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('About us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sign Out'),
                onTap: () => _signOut(context),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Logo and title
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Image.asset(
                  'assets/applogo.png', // Replace with your logo URL
                  height: 80,
                ),
              ),

              // Carousel Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: imageList.map((item) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Add radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), // Add radius
                    child: Image.asset(item, fit: BoxFit.cover, width: 2000),
                  ),
                )).toList(),
              ),
              const SizedBox(height: 20),

              // Welcome text
              Padding(
                padding: const EdgeInsets
              .symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                        children: [
                          TextSpan(text: 'FIND DONOR'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Are you in need of blood or looking to make a life-saving donation in Sri Lanka? Our Blood Donation Finder website is here to connect donors with those in need.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

// Buttons
Column(
  children: [
    ElevatedButton(
      onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FindDonor()),
                  );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.red, // Text color
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
      ),
      child: const Text('Find Donor'),
    ),
  ],
),
const SizedBox(height: 20),


              // Photo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/hero-banner.png', // Replace with your photo path
                      height: 400,
                    ),
                                        RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                        children: [
                          TextSpan(text: 'Connecting The Donors'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Welcome to the Sri Lanka Blood Donation Finder website, a crucial platform dedicated to bridging the gap between blood donors and recipients in need. In a country where timely access to blood can be a matter of life and death, our website strives to provide a comprehensive solution. Through an intuitive interface, users can effortlessly locate nearby blood donation centers and stay informed about upcoming events. The emphasis on user-friendly features aims to simplify the process, encouraging more individuals to participate in this noble cause.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:bloodapp/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; 

class WelcomePage extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/blood1.jpg',
    'assets/images/blood2.png',
    'assets/images/blood3.jpg',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
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
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  // Add about page navigation or content here
                  Navigator.pop(context);
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
                title: const Text('Help'),
                onTap: () {
                  // Add help page navigation or content here
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                        TextSpan(text: 'Welcome to Blood\n'),
                        TextSpan(text: 'Donation'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Our mission is to bridge the gap between blood donors and recipients, providing a seamless and efficient experience for both parties. You can trust us, we provide the best service.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Spacer(),

            // Login Button
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
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
                  child: const Text('Get Start'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

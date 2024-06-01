import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart'; // Add this import
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _passwordVisible = false;
  String _bloodType = 'A+'; // Initialize with default blood type
  String _selectedProvince = 'Western'; // Initialize with a default province
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  bool _showAdditionalFields = false; // Initially hide additional fields

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.red, // Red background color
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white, // White container color
              borderRadius: BorderRadius.circular(20.0), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Image.asset(
                  'assets/applogo.png', // Replace with your logo URL
                  height: 70,
                ),
                const SizedBox(height: 20.0),

                // Main title
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),

                // Subtitle
                const Text(
                  'New user register',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),

                // First name text field
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),

                // Last name text field
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),

                // Username text field
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),

                // Email text field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),

                // Password text field
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_passwordVisible,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),

                // Checkbox for donation intent
                Row(
                  children: [
                    Checkbox(
                      value: _showAdditionalFields,
                      onChanged: (value) {
                        setState(() {
                          _showAdditionalFields = value!;
                        });
                      },
                    ),
                    Text('I would like to donate'),
                  ],
                ),

                // Additional fields
                Visibility(
                  visible: _showAdditionalFields,
                  child: Column(
                    children: [
                      // Blood type dropdown
                      DropdownButtonFormField<String>(
                        value: _bloodType,
                        decoration: InputDecoration(
                          labelText: 'Blood Type',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _bloodType = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 10.0),

                      // City text field
                      TextFormField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          labelText: 'City',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your city';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),

                      // Province dropdown
                      DropdownButtonFormField<String>(
                        value: _selectedProvince,
                        decoration: InputDecoration(
                          labelText: 'Province',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        items: [
                          'Western',
                          'Central',
                          'Southern',
                          'Northern',
                          'Eastern',
                          'North Western',
                          'North Central',
                          'Uva',
                          'Sabaragamuwa'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedProvince = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 10.0),

                      // Contact number text field
                      TextFormField(
                        controller: _contactNumberController,
                        decoration: InputDecoration(
                          labelText: 'Contact Number',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your contact number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),

                      // Date picker
                      TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: 'Date',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onTap: () async {
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              _dateController.text = selectedDate.toString();
                            });
                          }
                        },
                        readOnly: true,
                        style: const TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select a date';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),

                // Register button
                ElevatedButton(
                  onPressed: () {
                    // Create new user in Firebase Authentication
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    )
                        .then((UserCredential userCredential) {
                      // Upload user data to Firebase Realtime Database
                      DatabaseReference userRef =
                          FirebaseDatabase.instance.reference().child('users');
                      userRef.push().set({
                        'firstName': _firstNameController.text,
                        'lastName': _lastNameController.text,
                        'username': _usernameController.text,
                        'email': _emailController.text,
                        if (_showAdditionalFields) // Only include if checkbox is selected
                          ...{
                            'bloodType': _bloodType,
                            'city': _cityController.text,
                            'province': _selectedProvince,
                            'contactNumber': _contactNumberController.text,
                            'date': _dateController.text,
                          },
                      }).then((_) {
                        print("Data uploaded successfully");
                        // Navigate to login page after successful registration
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      }).catchError((error) {
                        print("Error uploading data: $error");
                      });
                    }).catchError((error) {
                      print("Error creating user: $error");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red, // Button text color
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    textStyle: const TextStyle(fontSize: 18.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Register'),
                ),
                const SizedBox(height: 10.0),

                // Or sign up with
                const Text(
                  'Or sign up with',
                  style: TextStyle(fontSize: 16.0, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),

                // Google sign-in button
                ElevatedButton.icon(
                  onPressed: () {
                    // Perform Google sign-in action
                  },
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/google.png', // Replace with the Google logo image URL
                        height: 25.0,
                      ),
                      const SizedBox(width: 10.0),
                      const Text(
                        'Continue with Google',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  label: const Text(''), // Empty text for better alignment
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Color.fromARGB(5, 0, 0, 0)),
                    ),
                    shadowColor: Colors.grey.withOpacity(0.5),
                    elevation: 5, // Adjust the elevation for the shadow effect
                  ),
                ),
                const SizedBox(height: 20.0),

                // Login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Have an account? ',
                      style: TextStyle(fontSize: 16.0, color: Colors.black54),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to login page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        'Login now',
                        style: TextStyle(fontSize: 16.0, color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

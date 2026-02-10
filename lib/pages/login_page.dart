import 'package:bridgeinsp_new/pages/home_page.dart'; // Adjust import if BrHomePage is in a different file
import 'package:flutter/material.dart';

// Define your hardcoded credentials here.
// Key: Username, Value: Password
// You can add more users as needed.
const Map<String, String> _kUserCredentials = {
  'FAIZ': 'FAIZ',
  'NURFARAH': 'NURFARAH',
  'NADHIRA': 'NADHIRA',
  'AZRULDIN': 'AZRULDIN',
  'ADAM': 'ADAM',
  'user': 'user789',
  // Add more username-password pairs as needed
};

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage; // To store and display login errors

  void _performLogin() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    setState(() {
      _errorMessage = null; // Clear any previous error
    });

    // Validate inputs (optional but good practice)
    if (username.isEmpty) {
      setState(() {
        _errorMessage = 'Username is required.';
      });
      return;
    }
    if (password.isEmpty) {
      setState(() {
        _errorMessage = 'Password is required.';
      });
      return;
    }

    // Check credentials against the map
    if (_kUserCredentials.containsKey(username)) {
      if (_kUserCredentials[username] == password) {
        // Credentials are correct
        // Navigate to the home page (replace BrHomePage with your actual home page widget if different)
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const BrHomePage(); // Ensure BrHomePage is correctly imported
            },
          ),
        );
      } else {
        // Password is incorrect
        setState(() {
          _errorMessage = 'Incorrect password for user: $username';
        });
      }
    } else {
      // Username is incorrect
      setState(() {
        _errorMessage = 'Username not found: $username';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body -- content
      body: Center(
        child: SingleChildScrollView( // Add SingleChildScrollView to handle small screens if keyboard pops up
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Add padding around the content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ), //create space between text
                //Image - LOGO PLUS
                Image.asset('images/PLUS.png', height: 120),
                const SizedBox(
                  height: 20.0,
                ), //create space between text

                const Text(
                  'MARS-BRIDGE',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 40.0,
                ), //create space between text

                //Login Function --- Authentication
                if (_errorMessage != null) // Display error message if present
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),

                //Username Input Field
                TextFormField(
                  controller: _usernameController, // Assign the controller
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    // hintMaxLines: 20, // Likely a typo, removed
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    isDense: true,
                  ),
                  // No need for validator if you handle it in _performLogin
                  autocorrect: false,
                  // onChanged: (value) => _username = value, // Alternative to controller, but controller is preferred
                ),

                const SizedBox(
                  height: 20.0,
                ),

                //Password Input Field
                TextFormField(
                  controller: _passwordController, // Assign the controller
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    // hintMaxLines: 20, // Likely a typo, removed
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    isDense: true,
                  ),
                  obscureText: true, // Hide password characters
                  autocorrect: false,
                  // onChanged: (value) => _password = value, // Alternative to controller
                ),

                const SizedBox(
                  height: 40.0,
                ),

                ElevatedButton(
                  onPressed: _performLogin, // Call the new login function
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(120, 40),
                  ),
                  child: const Text('Login'),
                ),

                const SizedBox(height: 20,), // Optional: Add some space below the button

                // Optional: Display a hint about valid credentials
                const Text(
                  'Hint: Valid users are admin, inspector, user',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers to free up resources
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

//Authentication part
/*
class _AuthForm extends StatelessWidget {
  const _AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
*/
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginPage/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("img/wp2.png"),
              fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // logo
            _buildLogo(),
            // button
            Positioned(
              top: MediaQuery.of(context).size.height * 0.7,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  _buildButtonAvailable(
                      Icons.email, "1", "1", "Login With Email", "1",LoginPage()),
                  const SizedBox(height: 7),
                  _buildButtonAvailable(
                      Icons.facebook, "2", "2", "Login With facebook", "2",LoginPage()),
                  const SizedBox(height: 7),
                  _buildButtonAvailable(
                      Icons.apple, "2", "2", "Login With username", "2",LoginPage()),
                  const SizedBox(height: 7),
                  _buildSignUp()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _buildSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Don't Have An Account? ",
          style: TextStyle(color: Colors.white, decorationThickness: 3),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ))
      ],
    );
  }

  Positioned _buildLogo() {
    return Positioned(
      top: 50,
      left: 50,
      right: 50,
      child: Column(
        children: [
          Container(
            height: 80,
            width: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("img/logo2.png"), fit: BoxFit.contain),
            ),
          ),
          const Text(
            "Music App",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )
        ],
      ),
    );
  }

  _buildButtonAvailable(icon, colorIcon, colorBg, title, colorTitle,destination) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
            colorBg == "1" ? Colors.white70 : Colors.transparent),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        side: const WidgetStatePropertyAll(
          BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid),
        ),
        fixedSize: const WidgetStatePropertyAll(
          Size(700, 50),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.all(15),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: colorIcon == "1" ? Colors.black : Colors.white),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
                color: colorTitle == "1" ? Colors.black : Colors.white),
          ),
        ],
      ),
    );
  }
}

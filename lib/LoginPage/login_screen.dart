import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePage/main_home.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'loading_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;
  bool _isPasswordVisible = false;

  // untuk mengontrol teks email dan password,
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isCheckBox = false;

  @override
  void initState() {
    super.initState();

    // Listener untuk email
    _emailFocusNode.addListener(() {
      setState(() {
        _isEmailFocused = _emailFocusNode.hasFocus;
      });
    });

    // Listener untuk password
    _passwordFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onPressButtonLogin() {
    if (_formKey.currentState!.validate() && isCheckBox) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoadingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          decoration: const bool.fromEnvironment('dart.vm.product')
              ? const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/wp2.png'),
                    fit: BoxFit.cover,
                  ),
                )
              : null,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _builTextTemplate("Hello", 30, Colors.black, FontWeight.w900),
              _builTextTemplate(
                  "Welcome Back", 15, Colors.black, FontWeight.w300),
              SizedBox(height: 30),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormValidate(),
                      _buildCheckBox(),
                      _builButtonLogin(),
                      _buildHaveAccoun(context),
                      SizedBox(height: 20),
                      Center(
                        child: _builTextTemplate("OR CONTINUE WITH", 15,
                            Colors.black38, FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildSocialButton("img/google.png", MainHome()),
                          _buildSocialButton("img/fb.png", MainHome()),
                          _buildSocialButton("img/github.png", MainHome()),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _loadingAnimation() {
    return LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.lightGreen, size: 15);
  }

  _buildHaveAccoun(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _builTextTemplate(
            "Dont have an account?", 15, Colors.black38, FontWeight.w300),
        GestureDetector(
          child: _builTextTemplate('Sign Up', 15, Colors.blue, FontWeight.bold),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage())),
        ),
      ],
    );
  }

  _buildSocialButton(String img, navigateTo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(
              img,
              fit: BoxFit.contain,
            ),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => navigateTo));
          },
        ),
      ],
    );
  }

  Widget _buildCheckBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              tristate: false, // Nonaktifkan tristate agar hanya true/false
              value: isCheckBox,
              onChanged: (bool? value) {
                setState(() {
                  isCheckBox = value ?? false; // Perbarui nilai isCheckBox
                });
              },
            ),
            const Text(
              'Remember Me',
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        GestureDetector(
          child: const Text(
            'Forgot Password?',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainHome())),
        ),
      ],
    );
  }

  Form _buildFormValidate() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _builTextTemplate("E-mail", 15, Colors.black, FontWeight.w300),
            const SizedBox(height: 8),
            // Email TextFormField
            TextFormField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'isian email na atuh siah teh';
                }
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return 'Email nyaneh teu valid';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: 'E-mail',
                prefixIcon: Icon(
                  _isEmailFocused
                      ? Icons.drafts_outlined
                      : Icons.email_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Password TextFormField

            _builTextTemplate("Password", 15, Colors.black, FontWeight.w300),
            const SizedBox(height: 8),
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              focusNode: _passwordFocusNode,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Kudu Di Isian';
                }
                // Memastikan sandi mengandung huruf kecil, huruf besar, dan angka
                if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$')
                    .hasMatch(value)) {
                  return 'Make Huruf Letik, Gedhe,jeng Angka';
                }
                // Memastikan panjang sandi lebih dari 6 karakter
                if (value.trim().length < 6) {
                  return 'panjangna minimal 6';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: 'Password',
                prefixIcon: Icon(
                  _isPasswordFocused ? Icons.lock_open : Icons.lock_outlined,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? CupertinoIcons.eye_slash
                        : Icons.remove_red_eye_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _builButtonLogin() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.deepPurpleAccent.shade400),
          onPressed: isCheckBox && _formKey.currentState?.validate() != null
              ? _onPressButtonLogin
              : null,
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _builTextTemplate(
      String title, double size, Color color, FontWeight? fontWeight) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Text(
        title,
        style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../../../../core/api_service.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool visible = true;
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ApiService apiService = ApiService(Dio());

  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('userToken');
  }

  Future<void> registerUser() async {
    if (formKey.currentState!.validate()) {
      String userName = emailController.text;
      String userPassword = passwordController.text;

      String result = await apiService.UserLogin(userName: userName, userPassword: userPassword);


      }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB2EBF2), Color(0xFFF48FB1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60),
                  // Icon for Register Screen
                  Icon(Icons.person_add_alt_1_rounded, size: 100, color: Colors.white),
                  SizedBox(height: 20),
                  Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  // Email TextFormField
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  // Password TextFormField
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obscureText: visible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        icon: Icon(
                          visible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  // Register Button
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple, Colors.purpleAccent],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: MaterialButton(
                      onPressed: registerUser,
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Already have an account? Text and Login Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.purpleAccent, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

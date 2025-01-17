import 'package:deit/common/colo_extension.dart';
import 'package:deit/common_widget/round_button.dart';
import 'package:deit/view/login/complete_profile_view.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isCheck = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      if (!isCheck) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please accept the Privacy Policy and Terms of Use."),
          ),
        );
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CompleteProfileView(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hey there,",
                    style: TextStyle(color: TColor.gray, fontSize: 16),
                  ),
                  Text(
                    "Create an Account",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: media.width * 0.05),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      hintText: "First Name",
                      prefixIcon: Icon(Icons.person, color: TColor.gray),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "First name is required.";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: media.width * 0.04),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      hintText: "Last Name",
                      prefixIcon: Icon(Icons.person, color: TColor.gray),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Last name is required.";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: media.width * 0.04),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email, color: TColor.gray),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required.";
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Enter a valid email address.";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: media.width * 0.04),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock, color: TColor.gray),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required.";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters.";
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isCheck,
                        onChanged: (value) {
                          setState(() {
                            isCheck = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          "By continuing, you accept our Privacy Policy and Terms of Use.",
                          style: TextStyle(color: TColor.gray, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: media.width * 0.4),
                  RoundButton(
                    title: "Register",
                    onPressed: _register,
                  ),
                  SizedBox(height: media.width * 0.04),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: TColor.gray.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        "  Or  ",
                        style: TextStyle(color: TColor.black, fontSize: 12),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: TColor.gray.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: media.width * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: TColor.white,
                            border: Border.all(
                              width: 1,
                              color: TColor.gray.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            "assets/img/google.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: media.width * 0.04),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: TColor.white,
                            border: Border.all(
                              width: 1,
                              color: TColor.gray.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            "assets/img/facebook.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: media.width * 0.04),
                  TextButton(
                    onPressed: () {
                      // Navigate to Login Page
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

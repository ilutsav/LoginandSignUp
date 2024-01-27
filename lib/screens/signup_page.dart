import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mudita/screens/home_page.dart';
import 'package:mudita/screens/login_screen.dart';
import 'package:mudita/signup/bloc/signup_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final primaryColor = const Color(0xFF8B4CFC);
  final signUpBloc = SignupBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<SignupBloc, SignupState>(
      bloc: signUpBloc,
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
        if (state is NavigateToLoginState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.arrow_back),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: const [
                              Text(
                                "Skip",
                                style: TextStyle(fontSize: 14),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ]),
                  const SizedBox(height: 18),
                  const Text(
                    'Let\'s begin!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: primaryColor,
                            )),
                      )),
                  const SizedBox(height: 12),
                  TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'email',
                        suffixIcon: const Icon(
                          Icons.mail,
                          color: Color(0xFF8B4CFC),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: primaryColor,
                            )),
                      )),
                  const SizedBox(height: 12),
                  TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        hintText: 'number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: primaryColor,
                            )),
                      )),
                  const SizedBox(height: 12),
                  TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: primaryColor,
                            )),
                      )),
                  const SizedBox(height: 12),
                  TextField(
                      controller: genderController,
                      decoration: InputDecoration(
                        hintText: 'gender',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: primaryColor,
                            )),
                      )),
                  const SizedBox(height: 12),
                  TextField(
                      controller: dobController,
                      decoration: InputDecoration(
                        hintText: 'DOB',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: primaryColor,
                            )),
                      )),
                  const SizedBox(height: 12),
                  TextField(
                      controller: occupationController,
                      decoration: InputDecoration(
                        hintText: 'Occupation',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: primaryColor,
                            )),
                      )),
                  const SizedBox(height: 12),
                  TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: 'address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF8B4CFC),
                            )),
                      )),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    onPressed: () async {
                      signUpBloc.add(ContinueButtonPressed(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          gender: genderController.text,
                          address: addressController.text,
                          mobile: numberController.text,
                          occupation: occupationController.text,
                          dob: dobController.text));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          signUpBloc.add(SigninPressed());
                        },
                        child: const Text(
                          'Sign In',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
          ),
        );
      },
    ));
  }
}

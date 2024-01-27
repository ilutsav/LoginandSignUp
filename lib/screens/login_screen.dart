import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mudita/login/bloc/login_bloc.dart';
import 'package:mudita/screens/home_page.dart';
import 'package:mudita/screens/signup_page.dart';

import '../login/bloc/auth/login_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final loginauth = LoginAuth();

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final primaryColor = const Color(0xFF8B4CFC);
  bool rememberMe = false;
  final LoginBloc loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listener: (context, state) {
        if (state is NavigateToSignUpState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUp()),
          );
        }
        if (state is LoginSuccess) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      },
      builder: (context, state) {
        return Padding(
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
                  'What’s your email',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 30),
                TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'email',
                      suffixIcon: Icon(
                        Icons.mail,
                        color: primaryColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: primaryColor,
                          )),
                    )),
                const SizedBox(height: 12),
                TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'password',
                      suffixIcon: const Icon(
                        Icons.mail,
                        color: Color(0xFF8B4CFC),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF8B4CFC),
                          )),
                    )),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          fillColor: MaterialStateProperty.all(primaryColor),
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'forgot password?',
                          style: TextStyle(
                              color: primaryColor,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () async {
                    loginBloc.add(LoginButtonPressed(
                        email: emailController.text,
                        password: passwordController.text));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        loginBloc.add(NavigateToSignUpEvent());
                      },
                      child: const Text(
                        'Create new account',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
        );
      },
    ));
  }
}

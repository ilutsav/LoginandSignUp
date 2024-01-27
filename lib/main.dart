import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mudita/login/bloc/login_bloc.dart';
import 'login/bloc/auth/login_auth.dart';
import 'screens/home_page.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LoginAuth loginAuthInstance = LoginAuth();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:
          // BlocBuilder<LoginBloc, LoginState>(
          //   builder: (context, state) {
          //     if (state is LoginSuccess) {
          //       // Navigate to another screen after successful login
          //       return const HomeScreen(); // Replace HomeScreen with your desired screen
          //     } else {
          //       // Show the login screen if not logged in
          //       return BlocProvider(
          //         create: (context) => LoginBloc(loginAuth: loginAuthInstance),
          const LoginPage(),
    );
  }
}
//       ),
//     );
//   }
// }

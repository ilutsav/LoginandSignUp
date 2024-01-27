import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginAuth {
  Future<bool> Login(String email, String password) async {
    final Map<String, dynamic> requestbody = {
      'email': email,
      'password': password
    };
    try {
      final response = await http.post(
          Uri.parse('https://backend-gilt-two.vercel.app/api/v1/login'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(requestbody));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        String token = responseData['token'];
        print('Login successful. Token: $token');
        print('sucess');
        return true;
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('error $e');
      return false;
    }
  }
}

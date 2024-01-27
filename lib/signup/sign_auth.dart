import 'package:http/http.dart' as http;
import 'dart:convert';

// class SignUpAuth {
//   Future<bool> signUp(String name, String email, String password, String gender,
//       String address, String mobile, String occupation, String dob) async {
//     try {
//       final response = await http.post(
//           Uri.parse(
//               'https://backend-gilt-two.vercel.app/api/v1/registerMentee'),
//           body: {
//             'email': email,
//             'password': password,
//             'name': name,
//             'gender': gender,
//             'address': address,
//             'mobile': mobile,
//             'occupation': occupation,
//             'dob': dob
//           });

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = json.decode(response.body);
//         print('sucess');
//         return true;
//       } else {
//         print('Error: ${response.statusCode} - ${response.body}');
//         return false;
//       }
//     } catch (e) {
//       print('error $e');
//       return false;
//     }
//   }
// }
class SignUpAuth {
  Future<bool> signUp(String name, String email, String password, String gender,
      String address, String mobile, String occupation, String dob) async {
    final Map<String, dynamic> requestBody = {
      'email': email,
      'password': password,
      'name': name,
      'gender': gender,
      'address': address,
      'mobile': mobile,
      'occupation': occupation,
      'dob': dob,
    };

    try {
      final response = await http.post(
        Uri.parse('https://backend-gilt-two.vercel.app/api/v1/registerMentee'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return true;
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}

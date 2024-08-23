import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiMock {
  final http.Client client;
  final String baseUrl = dotenv.get('BASE_URL');
  final logger = Logger();

  ApiMock({required this.client});

  Future<Map<String, dynamic>> getApiKey() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/api-key'),
        headers: <String, String>{
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      final responseData = jsonDecode(response.body);

      if (responseData['status'] == 1) {
        // Return the entire response data
        return {
          'timestamp': responseData['timestamp'],
          'status': responseData['status'],
          'message': responseData['message'],
          'token': responseData['token'],
        };
      } else {
        throw Exception('Failed to load API key');
      }
    } catch (_) {
      throw Exception('Failed to load API key');
    }
  }

  Future<Map<String, dynamic>> userLogin(
      String namaPengguna, String kataSandi) async {
    try {
      // Mendapatkan token dari getApiKey
      final apiKey = await getApiKey();
      final token = apiKey['token'];

      // Melakukan permintaan login dengan token yang diperoleh
      final response = await client.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: <String, String>{
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token,
        },
        body: jsonEncode(<String, String>{
          'username': namaPengguna,
          'password': kataSandi,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 && responseData['status'] == 1) {
        // Return the entire response data
        return {
          'timestamp': responseData['timestamp'],
          'status': responseData['status'],
          'message': responseData['message'],
          'token': responseData['token']
        };
      } else {
        // Jika status bukan 1 atau response status code tidak 200
        return {
          'status': responseData['status'],
          'message': responseData['message'],
        };
      }
    } catch (e) {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> userLogout() async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['Authorization'];

      final response = await client.delete(
        Uri.parse('$baseUrl/logout'),
        headers: <String, String>{
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token,
          'mobile-credential': token2,
        },
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 && responseData['status'] == 1) {
        // Return the entire response data
        return {
          'timestamp': responseData['timestamp'],
          'status': responseData['status'],
          'message': responseData['message'],
        };
      } else {
        // Jika status bukan 1 atau response status code tidak 200
        return {
          'timestamp': responseData['timestamp'],
          'status': responseData['status'],
          'message': responseData['message'],
        };
      }
    } catch (e) {
      throw Exception('Failed to logout');
    }
  }

  Future<Map<String, dynamic>> userGantiPassword(
      String passwordLama, String passwordBaru) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['Authorization'];

      // Melakukan permintaan login dengan token yang diperoleh
      final response = await client.put(
        Uri.parse('$baseUrl/users/password'),
        headers: <String, String>{
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token,
          'mobile-credential': token2,
        },
        body: jsonEncode(<String, String>{
          'passwordLama': passwordLama,
          'passwordBaru': passwordBaru,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 && responseData['status'] == 1) {
        // Return the entire response data
        return {
          'timestamp': responseData['timestamp'],
          'status': responseData['status'],
          'message': responseData['message'],
          'token': responseData['token']
        };
      } else {
        // Jika status bukan 1 atau response status code tidak 200
        return {
          'timestamp': responseData['timestamp'],
          'status': responseData['status'],
          'message': responseData['message'],
        };
      }
    } catch (e) {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> rekeningUtama() async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['Authorization'];

      final response = await client.get(
        Uri.parse('$baseUrl/user/rekening-utama'),
        headers: <String, String>{
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token,
          'mobile-credential': token2
        },
      );
      final responseData = jsonDecode(response.body);

      if (responseData['status'] == 1) {
        // Return the entire response data
        return {
          'timestamp': responseData['timestamp'],
          'status': responseData['status'],
          'message': responseData['message'],
          'registration': responseData['registration'],
          'prouctname': responseData['prouctname'],
          'code': responseData['code'],
          'name': responseData['name'],
          'balance': responseData['balance']
        };
      } else {
        // Jika status bukan 1 atau response status code tidak 200
        return {
          'timestamp': responseData['timestamp'],
          'status': responseData['status'],
          'message': responseData['message'],
        };
      }
    } catch (_) {
      throw Exception('Failed to load API key');
    }
  }
}

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

  Future<Map<String, dynamic>> userLogin(String namaPengguna, String kataSandi) async {
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

  Future<Map<String, dynamic>> userLogout(String namaPengguna) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['token'];

      final response = await client.delete(
        Uri.parse('$baseUrl/logout/$namaPengguna'),
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
        return {
          'timestamp': responseData['timestamp'],
          'status': responseData['status'],
          'message': responseData['message'],
        };
      }
    } catch (e) {
      logger.e('Exception: $e');
      throw Exception('Failed to logout');
    }
  }

  Future<Map<String, dynamic>> userGantiPassword(String passwordLama, String passwordBaru, String namaPengguna) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['token'];

      // Melakukan permintaan login dengan token yang diperoleh
      final response = await client.put(
        Uri.parse('$baseUrl/users/password/$namaPengguna'),
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

  Future<Map<String, dynamic>> rekeningUtama(String namaPengguna) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['token'];

      final response = await client.get(
        Uri.parse('$baseUrl/user/rekening-utama/$namaPengguna'),
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
          'productName': responseData['productName'],
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
    } catch (e) {
      logger.i(e);
      throw Exception('Failed to load API key');
    }
  }

  Future<Map<String, dynamic>> listTabunganSimpanan(String namaPengguna) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['token'];

      final response = await client.get(
        Uri.parse('$baseUrl/user/list-tabungan-simpanan-users/$namaPengguna'),
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
          'savings': [
            {
              "name": "Irvan Al Rasyid",
              "code": "116 04 5063",
              "productName": "TABUNGAN SIMPATI",
              "balance": "4209596.00"
            }
          ]
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
      logger.i(e);
      throw Exception('Failed to load API key');
    }
  }

  Future<Map<String, dynamic>> listRekeningDepositSimpananBerjangka(String namaPengguna) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['token'];

      final response = await client.get(
        Uri.parse('$baseUrl/user/rekening-deposito/$namaPengguna'),
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
          'deposits': [
            {
              "code": "2036625026",
              "productName": "SIMPANAN BERJANGKA 3 BULAN",
              "name": "Irvan Al Rasyid",
              "bilyet": "123456",
              "begin": "2024-01-01",
              "end": "2024-06-30",
              "value": "1000000.00",
              "aro": 1
            }
          ]
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
      logger.i(e);
      throw Exception('Failed to load API key');
    }
  }

  Future<Map<String, dynamic>> rekeningPembiayaan(String namaPengguna) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['token'];

      final response = await client.get(
        Uri.parse('$baseUrl/user/list-rekening-pembiayaan/$namaPengguna'),
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
          'loans': [
            {
              "code": "09MRJP03229",
              "name": "Irvan Al Rasyid",
              "contract": "09MRJP03229",
              "principal": "13000000.00",
              "margin": "7800000.00",
              "rate": 30,
              "tenor": 24,
              "contractDate": "2024-01-01",
              "productName": "MURABAHAH JANGKA PANJANG",
              "tenorType": 1,
              "tenorName": "BULAN"
            }
          ]
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
      logger.i(e);
      throw Exception('Failed to load API key');
    }
  }

  Future<Map<String, dynamic>> list5transaksiTabungan(String listTabunganCode, String namaPengguna) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['token'];

      final response = await client.get(
        Uri.parse('$baseUrl/user/transaksi/last5date/$listTabunganCode/$namaPengguna'),
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
          'transactions': [
            {
              "date": "2024-08-01",
              "code": "TRANS041",
              "description": "Transfer - Irvan Al Rasyid (SW 16 05 00099)",
              "direction": "1",
              "value1": "40000.00",
              "endValue1": "380000.00"
            },
          ]
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
      logger.i(e);
      throw Exception('Failed to load API key');
    }
  }

  Future<Map<String, dynamic>> list10transaksiTabungan(String listTabunganCode, String namaPengguna) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['token'];

      final response = await client.get(
        Uri.parse('$baseUrl/user/transaksi/last10date/$listTabunganCode/$namaPengguna'),
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
          'transactions': [
            {
              "date": "2024-08-01",
              "code": "TRANS041",
              "description": "Transfer - Irvan Al Rasyid (SW 16 05 00099)",
              "direction": "1",
              "value1": "40000.00",
              "endValue1": "380000.00"
            },
          ]
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
      logger.i(e);
      throw Exception('Failed to load API key');
    }
  }

  Future<Map<String, dynamic>> list20transaksiTabungan(String listTabunganCode, String namaPengguna) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['token'];

      final response = await client.get(
        Uri.parse('$baseUrl/user/transaksi/last20date/$listTabunganCode/$namaPengguna'),
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
          'transactions': [
            {
              "date": "2024-08-01",
              "code": "TRANS041",
              "description": "Transfer - Irvan Al Rasyid (SW 16 05 00099)",
              "direction": "1",
              "value1": "40000.00",
              "endValue1": "380000.00"
            },
          ]
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
      logger.i(e);
      throw Exception('Failed to load API key');
    }
  }

  Future<Map<String, dynamic>> list5transaksiTabunganWithDate(String listTabunganCode, String date, String namaPengguna) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['token'];

      final response = await client.get(
        Uri.parse('$baseUrl/user/transaksi/last5date/$listTabunganCode/$date/$namaPengguna'),
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
          'transactions': [
            {
              "date": "2024-08-01",
              "code": "TRANS041",
              "description": "Transfer - Irvan Al Rasyid (SW 16 05 00099)",
              "direction": "1",
              "value1": "40000.00",
              "endValue1": "380000.00"
            },
          ]
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
      logger.i(e);
      throw Exception('Failed to load API key');
    }
  }

  Future<Map<String, dynamic>> list10transaksiTabunganWithDate(String listTabunganCode, String date, String namaPengguna) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['token'];

      final response = await client.get(
        Uri.parse('$baseUrl/user/transaksi/last10date/$listTabunganCode/$date/$namaPengguna'),
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
          'transactions': [
            {
              "date": "2024-08-01",
              "code": "TRANS041",
              "description": "Transfer - Irvan Al Rasyid (SW 16 05 00099)",
              "direction": "1",
              "value1": "40000.00",
              "endValue1": "380000.00"
            },
          ]
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
      logger.i(e);
      throw Exception('Failed to load API key');
    }
  }

  Future<Map<String, dynamic>> list20transaksiTabunganWithDate(String listTabunganCode, String date, String namaPengguna) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['token'];

      final response = await client.get(
        Uri.parse('$baseUrl/user/transaksi/last20date/$listTabunganCode/$date/$namaPengguna'),
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
          'transactions': [
            {
              "date": "2024-08-01",
              "code": "TRANS041",
              "description": "Transfer - Irvan Al Rasyid (SW 16 05 00099)",
              "direction": "1",
              "value1": "40000.00",
              "endValue1": "380000.00"
            },
          ]
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
      logger.i(e);
      throw Exception('Failed to load API key');
    }
  }

  Future<Map<String, dynamic>> informasiUsers(String namaPengguna) async {
    try {
      // Mendapatkan token dari getApiKey dan login
      final apiKey = await getApiKey();
      final token = apiKey['token'];
      final loginKey = await userLogin("irvan", "irvan123");
      final token2 = loginKey['token'];

      final response = await client.get(
        Uri.parse('$baseUrl/user/informations/$namaPengguna'),
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
          'user': {
            "companyCode": "998",
            "company": "KOPERASI SYARIAH DEMO",
            "branch": "PUSAT",
            "code": "10000213",
            "name": "Irvan Al Rasyid",
            "registration": "2023-08-20",
            "handphone": "081234567890",
            "email": "irvan@gmail.com",
            "gender": "Laki-laki",
            "dob": "2000-10-15",
            "address": "Jl. Raya No. 1",
            "city": "Jakarta",
            "postcode": "12345"
          }
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
      logger.i(e);
      throw Exception('Failed to load API key');
    }
  }
}

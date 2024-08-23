import 'dart:convert';

import 'package:febankflutter/api/api_services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiMain implements ApiServices {
  final String baseUrl = dotenv.get('BASE_URL');

  @override
  Future<http.Response> getTokenApiKey() async {
    return await http.get(
      Uri.parse('$baseUrl/api-key'),
      headers: <String, String>{
        'mobile-app': 'mobile-application',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    );
  }

  @override
  Future<http.Response> userLogin(String getApiKey, String namaPengguna, String kataSandi) async {
    return await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: <String, String>{
        'mobile-app': 'mobile-application',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': getApiKey
      },
      body: jsonEncode(<String, String>{
        'username': namaPengguna,
        'password': kataSandi,
      }),
    );
  }

  @override
  Future<http.Response> userLogout(String getApiKey, String loginKey, String namaPengguna) async {
    return await http.delete(
      Uri.parse('$baseUrl/logout/$namaPengguna'),
      headers: <String, String>{
        'mobile-app': 'mobile-application',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': getApiKey,
        'mobile-credential': loginKey
      },
    );
  }

  @override
  Future<http.Response> userGantiPassword(String getApiKey, String loginKey, String passwordLama, String passwordBaru, String namaPengguna) async {
    return await http.put(
      Uri.parse('$baseUrl/users/password/$namaPengguna'),
      headers: <String, String>{
        'mobile-app': 'mobile-application',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': getApiKey,
        'mobile-credential': loginKey
      },
      body: jsonEncode(<String, String>{
        'passwordLama': passwordLama,
        'passwordBaru': passwordBaru,
      }),
    );
  }

  @override
  Future<http.Response> rekeningUtama(String getApiKey, String loginKey, String namaPengguna) async {
    return await http.get(
      Uri.parse('$baseUrl/user/rekening-utama/$namaPengguna'),
      headers: <String, String>{
        'mobile-app': 'mobile-application',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': getApiKey,
        'mobile-credential': loginKey
      },
    );
  }

  @override
  Future<http.Response> listTabunganSimpanan(String getApiKey, String loginKey, String namaPengguna) async {
    return await http.get(
      Uri.parse('$baseUrl/user/list-tabungan-simpanan-users/$namaPengguna'),
      headers: <String, String>{
        'mobile-app': 'mobile-application',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': getApiKey,
        'mobile-credential': loginKey
      },
    );
  }

  @override
  Future<http.Response> listRekeningDepositSimpananBerjangka(String getApiKey, String loginKey, String namaPengguna) async {
    return await http.get(
      Uri.parse('$baseUrl/user/rekening-deposito/$namaPengguna'),
      headers: <String, String>{
        'mobile-app': 'mobile-application',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': getApiKey,
        'mobile-credential': loginKey
      },
    );
  }

  @override
  Future<http.Response> listRekeningPembiayaan(String getApiKey, String loginKey, String namaPengguna) async {
    return await http.get(
      Uri.parse('$baseUrl/user/list-rekening-pembiayaan/$namaPengguna'),
      headers: <String, String>{
        'mobile-app': 'mobile-application',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': getApiKey,
        'mobile-credential': loginKey
      },
    );
  }

  @override
  Future<http.Response> list5transaksiTabungan(String getApiKey, String loginKey, String listTabunganCode, String namaPengguna) async {
    return await http.get(
        Uri.parse('$baseUrl/user/transaksi/last5date/$listTabunganCode/$namaPengguna'),
        headers: <String, String> {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': getApiKey,
          'mobile-credential': loginKey
        }
    );
  }

  @override
  Future<http.Response> list10transaksiTabungan(String getApiKey, String loginKey, String listTabunganCode, String namaPengguna) async {
    return await http.get(
        Uri.parse('$baseUrl/user/transaksi/last10date/$listTabunganCode/$namaPengguna'),
        headers: <String, String> {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': getApiKey,
          'mobile-credential': loginKey
        }
    );
  }

  @override
  Future<http.Response> list20transaksiTabungan(String getApiKey, String loginKey, String listTabunganCode, String namaPengguna) async {
    return await http.get(
        Uri.parse('$baseUrl/user/transaksi/last20date/$listTabunganCode/$namaPengguna'),
        headers: <String, String> {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': getApiKey,
          'mobile-credential': loginKey
        }
    );
  }

  @override
  Future<http.Response> list5transaksiTabunganWithDate(String getApiKey, String loginKey, String listTabunganCode, String date, String namaPengguna) async {
    return await http.get(
        Uri.parse('$baseUrl/user/transaksi/last5date/$listTabunganCode/$date/$namaPengguna'),
        headers: <String, String> {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': getApiKey,
          'mobile-credential': loginKey
        }
    );
  }

  @override
  Future<http.Response> list10transaksiTabunganWithDate(String getApiKey, String loginKey, String listTabunganCode, date, String namaPengguna) async {
    return await http.get(
        Uri.parse('$baseUrl/user/transaksi/last10date/$listTabunganCode/$date/$namaPengguna'),
        headers: <String, String> {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': getApiKey,
          'mobile-credential': loginKey
        }
    );
  }

  @override
  Future<http.Response> list20transaksiTabunganWithDate(String getApiKey, String loginKey, String listTabunganCode, String date, String namaPengguna) async {
    return await http.get(
        Uri.parse('$baseUrl/user/transaksi/last20date/$listTabunganCode/$date/$namaPengguna'),
        headers: <String, String> {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': getApiKey,
          'mobile-credential': loginKey
        }
    );
  }

  @override
  Future<http.Response> informasiRekeningSimpanan(String getApiKey, String loginKey, String code, String namaPengguna) async {
    return await http.get(
        Uri.parse('$baseUrl/user/informasi-rekening-simpanan/$code/$namaPengguna'),
        headers: <String, String> {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': getApiKey,
          'mobile-credential': loginKey
        }
    );
  }

  @override
  Future<http.Response> informasiUsers(String getApiKey, String loginKey, String namaPengguna) async {
    return await http.get(
        Uri.parse('$baseUrl/user/informations/$namaPengguna'),
        headers: <String, String> {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': getApiKey,
          'mobile-credential': loginKey
        }
    );
  }
}
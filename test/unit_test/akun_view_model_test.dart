import 'dart:convert';

import 'package:febankflutter/api/api_mock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../mocking/http_client_mock.mocks.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final logger = Logger();

  group('akunViewModel method informasiDataPengguna', () {
    // atur (arrange)
    late MockClient mockClient;
    late ApiMock apiMock;
    final String baseUrl = dotenv.get('BASE_URL');

    setUp(() {
      mockClient = MockClient();
      apiMock = ApiMock(client: mockClient);
    });

    test('informasiDataPengguna', () async {
      logger.i('Menjalankan informasiDataPengguna');

      // atur (arrange) getApiKey
      when(mockClient.get(
        Uri.parse('$baseUrl/api-key'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "SUCCESS", "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY"}',
          200));
      logger.i('Berhasil menjalankan mock getApiKey');

      // atur (arrange) userLogin
      when(mockClient.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
        body: jsonEncode(<String, String>{
          'username': 'irvan',
          'password': 'irvan123',
        }),
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Login berhasil", "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY"}',
          200));
      logger.i('Berhasil menjalankan mock userLogin');

      // atur (arrange)
      when(mockClient.get(
        Uri.parse('$baseUrl/user/informations/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Succes", "user": {"companyCode": "998","company": "KOPERASI SYARIAH DEMO","branch": "PUSAT","code": "10000213","name": "Irvan Al Rasyid","registration": "2023-08-20","handphone": "081234567890","email": "irvan@gmail.com","gender": "Laki-laki","dob": "2000-10-15","address": "Jl. Raya No. 1","city": "Jakarta","postcode": "12345"}}',
          200));
      logger.i('Berhasil menjalankan mock informationUser');

      final data = await apiMock.informasiUsers('irvan');
      logger.i('Berhasil mendapatkan kembalian dari listTabunganSimpanan ke variabel data');
      logger.i(data);

      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 1);
      expect(data['message'], "Succes");
      // Verifikasi data user
      final user = data["user"] as Map<String, dynamic>;
      expect(user['companyCode'], "998");
      expect(user['company'], "KOPERASI SYARIAH DEMO");
      expect(user['code'], "10000213");
      expect(user['name'], "Irvan Al Rasyid");
      expect(user['registration'], "2023-08-20");
      expect(user['handphone'], "081234567890");
      expect(user['email'], "irvan@gmail.com");
      expect(user['gender'], "Laki-laki");
      expect(user['dob'], "2000-10-15");
      expect(user['address'], "Jl. Raya No. 1");
      expect(user['city'], "Jakarta");
      expect(user['postcode'], "12345");

      logger.i('Berhasil memverifikasi data');
    });
  });
}
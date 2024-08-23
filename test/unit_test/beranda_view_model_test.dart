import 'dart:convert';

import 'package:febankflutter/api/api_mock.dart';
import 'package:febankflutter/viewmodels/beranda_view_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../mocking/http_client_mock.mocks.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  // final logger = Logger();

  group('berandaViewModel formatValuetoRupiah', () {
    group('formatValuetoRupiah', () {
      test('Seharusnya menformat tipe data double menjadi format rupiah', () {
        // atur (arrange)
        double value = 1234567890.12;
        String expectedResult = '1.234.567.890,12';
        final berandaViewModel = BerandaViewModel(notifyListeners: () {});

        // aksi (act)
        String result = berandaViewModel.formatValuetoRupiah(value);

        // tegaskan (assert)
        expect(result, expectedResult);
      });

      test('Seharusnya mengembalikan 0 jika inputnya adalah null', () {
        // atur (arrange)
        double? value = null;
        String expectedResult = '0';
        final berandaViewModel = BerandaViewModel(notifyListeners: () {});

        // aksi (act)
        String result = berandaViewModel.formatValuetoRupiah(value);

        // tegaskan (assert)
        expect(result, expectedResult);
      });

      test(
          'Jika memasukan input tanpa koma pada tipe data double, akan mengembalikan double',
          () {
        // atur (arrange)
        double value = 1234567890;
        String expectedResult = '1.234.567.890,0';
        final berandaViewModel = BerandaViewModel(notifyListeners: () {});

        // aksi (act)
        String result = berandaViewModel.formatValuetoRupiah(value);

        // tegaskan (assert)
        expect(result, expectedResult);
      });

      test('Seharusnya menjadikan format terkecil dari nilai rupiah', () {
        // atur (arrange)
        double value = 1234.56;
        String expectedResult = '1.234,56';
        final berandaViewModel = BerandaViewModel(notifyListeners: () {});

        // aksi (act)
        String result = berandaViewModel.formatValuetoRupiah(value);

        // tegaskan (assert)
        expect(result, expectedResult);
      });

      test('Seharusnya menjadikan format terbesar dari nilai rupiah', () {
        // atur (arrange)
        double value = 123456789012345.67;
        String expectedResult = '123.456.789.012.345,67';
        final berandaViewModel = BerandaViewModel(notifyListeners: () {});

        // aksi (act)
        String result = berandaViewModel.formatValuetoRupiah(value);

        // tegaskan (assert)
        expect(result, expectedResult);
      });

      test(
          'Seharusnya mengembalikan In.fin.ity jika tipe data nya inputnya adalah double.infinity',
          () {
        // atur (arrange)
        String expectedResult = 'In.fin.ity';
        final berandaViewModel = BerandaViewModel(notifyListeners: () {});

        // aksi (act)
        String result = berandaViewModel.formatValuetoRupiah(
            double.infinity); // Using infinity to force an error

        // tegaskan (assert)
        expect(result, expectedResult);
      });
    });
  });

  group('berandaViewModel API', () {
    // atur (arrange)
    late MockClient mockClient;
    late ApiMock apiMock;
    final String baseUrl = dotenv.get('BASE_URL');

    setUp(() {
      mockClient = MockClient();
      apiMock = ApiMock(client: mockClient);
    });

    test('berandaCardInformasiRekeningUtama', () async {
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
        body: jsonEncode({'username': 'irvan', 'password': 'irvan123'}),
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Login berhasil", "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY"}',
          200));

      // atur (arrange) userLogout
      when(mockClient.get(
        Uri.parse('$baseUrl/user/rekening-utama'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{    "timestamp": "2024-08-09T13:41:12.196Z", "status": 1, "message": "Success rekening utama", "registration": "2024-07-22", "prouctname": "TABUNGAN SIMPATI", "code": "116 04 5063", "name": "Irvan Al Rasyid", "balance": 4209596}',
          200));

      // aksi (act)
      final data = await apiMock.rekeningUtama();

      // tegaskan (assert)
      expect(data['timestamp'], '2024-08-09T13:41:12.196Z');
      expect(data['status'], 1);
      expect(data['message'], 'Success rekening utama');
      expect(data['registration'], '2024-07-22');
      expect(data['prouctname'], 'TABUNGAN SIMPATI');
      expect(data['code'], '116 04 5063');
      expect(data['name'], 'Irvan Al Rasyid');
      expect(data['balance'], 4209596);
    });
  });
}

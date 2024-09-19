import 'dart:convert';

import 'package:febankflutter/api/api_mock.dart';
import 'package:febankflutter/viewmodels/beranda_view_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../mocking/http_client_mock.mocks.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final logger = Logger();

  group('berandaViewModel formatValuetoRupiah', () {

    test('Seharusnya menformat tipe data double menjadi format rupiah', () {
      logger.i('Menjalankan Seharusnya menformat tipe data double menjadi format rupiah');

      // atur (arrange)
      double value = 1234567890.12;
      String expectedResult = '1.234.567.890,12';
      logger.i('Berhasil membuat variabel value dan expectedResult');

      final berandaViewModel = BerandaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance berandaViewModel');

      // aksi (act)
      String result = berandaViewModel.formatValuetoRupiah(value);
      logger.i('Berhasil menyimpan kembalian dari function formatValueToRupiah');

      // tegaskan (assert)
      expect(result, expectedResult);
      logger.i('Berhasil membuat tipe data double menjadi berformat rupiah $result}');

    });

    test('Seharusnya mengembalikan 0 jika inputnya adalah null', () {
      logger.i('Menjalankan Seharusnya mengembalikan 0 jika inputnya adalah null');

      // atur (arrange)
      double? value;
      String expectedResult = '0';
      logger.i('Berhasil membuat variabel value dan expectedResult');

      final berandaViewModel = BerandaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance berandaViewModel');

      // aksi (act)
      String result = berandaViewModel.formatValuetoRupiah(value);
      logger.i('Berhasil menyimpan kembalian dari function formatValueToRupiah');

      // tegaskan (assert)
      expect(result, expectedResult);
      logger.i('Berhasil mendapatkan angka 0 jika di isikan null : $result');
    });

    test('Jika memasukan input tanpa koma pada tipe data double, akan mengembalikan double dengan koma', () {
      logger.i('Menjalankan Jika memasukan input tanpa koma pada tipe data double, akan mengembalikan double dengan koma');

      // atur (arrange)
      double value = 1234567890;
      String expectedResult = '1.234.567.890,0';
      logger.i('Berhasil membuat variabel value dan expectedResult');

      final berandaViewModel = BerandaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance berandaViewModel');

      // aksi (act)
      String result = berandaViewModel.formatValuetoRupiah(value);
      logger.i('Berhasil menyimpan kembalian dari function formatValueToRupiah');

      // tegaskan (assert)
      expect(result, expectedResult);
      logger.i('Berhasil memverifikasi result $result');
    });

    test('Seharusnya menjadikan format terkecil dari nilai rupiah', () {
      logger.i('Menjalankan Seharusnya menjadikan format terkecil dari nilai rupiah');

      // atur (arrange)
      double value = 1234.56;
      String expectedResult = '1.234,56';
      logger.i('Berhasil membuat variabel value dan expectedResult');

      final berandaViewModel = BerandaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance berandaViewModel');

      // aksi (act)
      String result = berandaViewModel.formatValuetoRupiah(value);
      logger.i('Berhasil menyimpan kembalian dari formatValueToRupiah');

      // tegaskan (assert)
      expect(result, expectedResult);
      logger.i('Berhasil memverifikasi result : $result');
    });

    test('Seharusnya menjadikan format terbesar dari nilai rupiah', () {
      logger.i('Menjalanakan Seharusnya menjadikan format terbesar dari nilai rupiah');

      // atur (arrange)
      double value = 1.7976931348623157E+308;
      String expectedResult = '1,7976931348623157e+308';
      logger.i('Berhasil membuat variabel value dan expectedResult');

      final berandaViewModel = BerandaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance berandaViewModel');

      // aksi (act)
      String result = berandaViewModel.formatValuetoRupiah(value);
      logger.i('Berhasil menyimpan value dari function formatValueToRupiah');

      // tegaskan (assert)
      expect(result, expectedResult);
      logger.i('Berhasil memverifikasi result : $result');
    });

    test('Seharusnya mengembalikan In.fin.ity jika tipe data nya inputnya adalah double.infinity', () {
      logger.i('Menjalankan Seharusnya mengembalikan In.fin.ity jika tipe data nya inputnya adalah double.infinity');

      // atur (arrange)
      String expectedResult = 'In.fin.ity';
      logger.i('Berhasil membuat variabel expectedResult');

      final berandaViewModel = BerandaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance berandaViewModel');

      // aksi (act)
      String result = berandaViewModel.formatValuetoRupiah(double.infinity);
      logger.i('Berhasil menyimpan kembalian dari function formatValueToRupiah');

      // tegaskan (assert)
      expect(result, expectedResult);
      logger.i('Berhasil memverifikasi result : $result');
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

    test('berandaCardInformasiRekeningUtama response berhasil', () async {
      logger.i('Menjalankan berandaCardInformasiRekeningUtama response berhasil');

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
      logger.i('Berhasil menjalankan mock getApiKey status 200');

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
      logger.i('Berhasil menjalankan mock userLogin status 200');

      // atur (arrange) userLogout
      when(mockClient.get(
        Uri.parse('$baseUrl/user/rekening-utama/irvan'),
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
          '{    "timestamp": "2024-08-09T13:41:12.196Z", "status": 1, "message": "Success rekening utama", "registration": "2024-07-22", "productName": "TABUNGAN SIMPATI", "code": "116 04 5063", "name": "Irvan Al Rasyid", "balance": "4209596.00"}',
          200));
      logger.i('Berhasil menjalankan mock rekeningUtama');

      // aksi (act)
      final data = await apiMock.rekeningUtama('irvan');
      logger.i('Berhasil menyimpan kembalian dari api_mock.dart rekeningUtama');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], '2024-08-09T13:41:12.196Z');
      expect(data['status'], 1);
      expect(data['message'], 'Success rekening utama');
      expect(data['registration'], '2024-07-22');
      expect(data['productName'], 'TABUNGAN SIMPATI');
      expect(data['code'], '116 04 5063');
      expect(data['name'], 'Irvan Al Rasyid');
      expect(data['balance'], "4209596.00");
      logger.i('Berhasil memverifikasi data dengan hasil mock rekeningUtama');
    });

    test('berandaCardInformasiRekeningUtama response gagal', () async {
      logger.i('Menjalankan berandaCardInformasiRekeningUtama response gagal');

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
      logger.i('Berhasil menjalankan mock getApiKey status 200');

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
      logger.i('Berhasil menjalankan mock userLogin status 200');

      // atur (arrange) userLogout
      when(mockClient.get(
        Uri.parse('$baseUrl/user/rekening-utama/irvan'),
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
          '{    "timestamp": "2024-08-09T13:41:12.196Z", "status": 0, "message": "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!"}',
          500));
      logger.i('Berhasil menjalankan mock rekeningUtama');

      // aksi (act)
      final data = await apiMock.rekeningUtama('irvan');
      logger.i('Berhasil menyimpan kembalian dari api_mock.dart rekeningUtama');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], '2024-08-09T13:41:12.196Z');
      expect(data['status'], 0);
      expect(data['message'], 'SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!');
    });
  });
}

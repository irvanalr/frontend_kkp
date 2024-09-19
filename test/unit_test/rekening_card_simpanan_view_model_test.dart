import 'dart:convert';

import 'package:febankflutter/api/api_mock.dart';
import 'package:febankflutter/viewmodels/rekening_card_simpanan_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../mocking/http_client_mock.mocks.dart';

// Mock SharedPreferences
class MockSharedPreferences extends Mock implements SharedPreferences {
  @override
  Future<bool> setString(String key, String value) =>
      super.noSuchMethod(Invocation.method(#setString, [key, value]),
          returnValue: Future.value(true));

  @override
  String? getString(String key) => super
      .noSuchMethod(Invocation.method(#getString, [key]), returnValue: '123');

  @override
  Future<bool> remove(String key) =>
      super.noSuchMethod(Invocation.method(#remove, [key]),
          returnValue: Future.value(true));
}

void main() async {
  await dotenv.load(fileName: ".env");
  final logger = Logger();

  group('RekeningCardSimpananViewModel method formatValueToRupiah', () {

    test('Seharusnya menformat tipe data double menjadi format rupiah', () {
      logger.i('Menjalankan Seharusnya menformat tipe data double menjadi format rupiah');

      // atur (arrange)
      double value = 1234567890.12;
      String expectedResult = '1.234.567.890,12';
      logger.i('Berhasil membuat variabel value dan expectedResult');

      final rekeningCardSimpananViewModel = RekeningCardSimpananViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance rekeningCardSimpananViewModel');

      // aksi (act)
      String result = rekeningCardSimpananViewModel.formatValuetoRupiah(value);
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

      final rekeningCardSimpananViewModel = RekeningCardSimpananViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance rekeningCardSimpananViewModel');

      // aksi (act)
      String result = rekeningCardSimpananViewModel.formatValuetoRupiah(value);
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

      final rekeningCardSimpananViewModel = RekeningCardSimpananViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance rekeningCardSimpananViewModel');

      // aksi (act)
      String result = rekeningCardSimpananViewModel.formatValuetoRupiah(value);
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

      final rekeningCardSimpananViewModel = RekeningCardSimpananViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance rekeningCardSimpananViewModel');

      // aksi (act)
      String result = rekeningCardSimpananViewModel.formatValuetoRupiah(value);
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

      final rekeningCardSimpananViewModel = RekeningCardSimpananViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance rekeningCardSimpananViewModel');

      // aksi (act)
      String result = rekeningCardSimpananViewModel.formatValuetoRupiah(value);
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

      final rekeningCardSimpananViewModel = RekeningCardSimpananViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance rekeningCardSimpananViewModel');

      // aksi (act)
      String result = rekeningCardSimpananViewModel.formatValuetoRupiah(double.infinity);
      logger.i('Berhasil menyimpan kembalian dari function formatValueToRupiah');

      // tegaskan (assert)
      expect(result, expectedResult);
      logger.i('Berhasil memverifikasi result : $result');
    });

  });

  group("sharedPreferences", () {
    // atur (arrange)
    final mockSharedPreferences = MockSharedPreferences();
    test('sebaiknya menyimpan key token dan value token ke shared preferences', () async {
      logger.i('Menjalankan sharedPreferences untuk menyimpan token');

      // aksi (act)
      when(mockSharedPreferences.setString('token', '123'))
          .thenAnswer((_) async => true);
      logger.i('Berhasil menjalankan mock untuk menyimpan token ke local');

      final result = await mockSharedPreferences.setString('token', '123');
      logger.i('Berhasil menjalankan class mockSharedPreferences dengan method setString');
      logger.i('Result : $result');

      // tegaskan (assert)
      expect(result, isTrue);
      logger.i('Berhasil menverifikasi penyimpanan data ke local');
    });

    test('sebaiknya mendapatkan nilai token dari shared preferences', () {
      logger.i('Menjalankan sharedPreferences untuk mendapatkan token');

      // aksi (act)
      when(mockSharedPreferences.getString('token')).thenReturn('123');
      logger.i('Berhasil menjalankan mock untuk mendapatkan token dan isinya');

      final result = mockSharedPreferences.getString('token');
      logger.i('Berhasil menjalankan class mockSharedPreferences dengan method getString');
      logger.i('Result : $result');

      // tegaskan (assert)
      expect(result, '123');
      logger.i('Berhasil memverifikasi mengambil data dari local');
    });

    test('sebaiknya menghapus key token dari shared preferences', () async {
      logger.i('Menjalankan sharedPreferences untuk menghapus token');
      // aksi (act)
      when(mockSharedPreferences.remove('token')).thenAnswer((_) async => true);
      logger.i('Berhasil menjalankan mock untuk menghapus token');

      final result = await mockSharedPreferences.remove('token');
      logger.i('Berhasil menjalankan class mockSharedPreferences dengan method remove');
      logger.i('Result : $result');

      // tegaskan (assert)
      expect(result, isTrue);
      logger.i('Berhasil memverifikasi menghapus data dari local');
    });
  });

  group('RekeningCardSimpananViewModel api', () {
    // atur (arrange)
    late MockClient mockClient;
    late ApiMock apiMock;
    final String baseUrl = dotenv.get('BASE_URL');

    setUp(() {
      mockClient = MockClient();
      apiMock = ApiMock(client: mockClient);
    });

    test('listTabunganSimpanan response berhasil', () async {
      logger.i('Menjalankan listTabunganSimpanan response berhasil');

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
        Uri.parse('$baseUrl/user/list-tabungan-simpanan-users/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Succes", "savings": [{"name": "Irvan Al Rasyid","code": "116 04 5063","productName": "TABUNGAN SIMPATI","balance": "4209596.00"}]}',
          200));

      final data = await apiMock.listTabunganSimpanan('irvan');
      logger.i('Berhasil mendapatkan kembalian dari listTabunganSimpanan ke variabel data');
      logger.i(data);

      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 1);
      expect(data['message'], "Succes");
      // Verifikasi data savings
      final List<dynamic> savings = data["savings"];
      expect(savings.length, 1);
      final firstSaving = savings[0];
      expect(firstSaving['name'], "Irvan Al Rasyid");
      expect(firstSaving['code'], "116 04 5063");
      expect(firstSaving['productName'], "TABUNGAN SIMPATI");
      expect(firstSaving['balance'], "4209596.00");

      logger.i('Berhasil menjalankan mock listTabunganSimpanan berhasil');
    });

    test('listTabunganSimpanan response gagal', () async {
      logger.i('listTabunganSimpanan response gagal');

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
        Uri.parse('$baseUrl/user/list-tabungan-simpanan-users/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!" }',
          500));

      final data = await apiMock.listTabunganSimpanan('irvan');
      logger.i('Berhasil mendapatkan kembalian dari listTabunganSimpanan ke variabel data');
      logger.i(data);

      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 0);
      expect(data['message'], "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!");

      logger.i('Berhasil menjalankan mock listTabunganSimpanan gagal');
    });
  });
}
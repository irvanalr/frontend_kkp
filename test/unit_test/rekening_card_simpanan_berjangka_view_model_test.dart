import 'dart:convert';

import 'package:febankflutter/api/api_mock.dart';
import 'package:febankflutter/viewmodels/rekening_card_simpanan_berjangka_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../mocking/http_client_mock.mocks.dart';

void main () async {
  await dotenv.load(fileName: ".env");
  final logger = Logger();

  group('RekeningCardSimpananBerjangkaViewModel method formatValueToRupiah', () {

    test('Seharusnya menformat tipe data double menjadi format rupiah', () {
      logger.i('Menjalankan Seharusnya menformat tipe data double menjadi format rupiah');

      // atur (arrange)
      double value = 1234567890.12;
      String expectedResult = '1.234.567.890,12';
      logger.i('Berhasil membuat variabel value dan expectedResult');

      final rekeningCardSimpananBerjangkaViewModel = RekeningCardSimpananBerjangkaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance rekeningCardSimpananBerjangkaViewModel');

      // aksi (act)
      String result = rekeningCardSimpananBerjangkaViewModel.formatValuetoRupiah(value);
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

      final rekeningCardSimpananBerjangkaViewModel = RekeningCardSimpananBerjangkaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance rekeningCardSimpananBerjangkaViewModel');

      // aksi (act)
      String result = rekeningCardSimpananBerjangkaViewModel.formatValuetoRupiah(value);
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

      final rekeningCardSimpananBerjangkaViewModel = RekeningCardSimpananBerjangkaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance rekeningCardSimpananBerjangkaViewModel');

      // aksi (act)
      String result = rekeningCardSimpananBerjangkaViewModel.formatValuetoRupiah(value);
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

      final rekeningCardSimpananBerjangkaViewModel = RekeningCardSimpananBerjangkaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance rekeningCardSimpananBerjangkaViewModel');

      // aksi (act)
      String result = rekeningCardSimpananBerjangkaViewModel.formatValuetoRupiah(value);
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

      final rekeningCardSimpananBerjangkaViewModel = RekeningCardSimpananBerjangkaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance rekeningCardSimpananBerjangkaViewModel');

      // aksi (act)
      String result = rekeningCardSimpananBerjangkaViewModel.formatValuetoRupiah(value);
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

      final rekeningCardSimpananBerjangkaViewModel = RekeningCardSimpananBerjangkaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance rekeningCardSimpananBerjangkaViewModel');

      // aksi (act)
      String result = rekeningCardSimpananBerjangkaViewModel.formatValuetoRupiah(double.infinity);
      logger.i('Berhasil menyimpan kembalian dari function formatValueToRupiah');

      // tegaskan (assert)
      expect(result, expectedResult);
      logger.i('Berhasil memverifikasi result : $result');
    });

  });

  group('RekeningCardSimpananBerjangkaViewModel method formatDate', () {
    test('formatDate jika tahun-bulan-tanggal', () {
      logger.i('Menjalankan formatDate jika tahun-bulan-tanggal');
      
      // atur (arrange)
      final rekeningCardSimpananBerjangkaViewModel = RekeningCardSimpananBerjangkaViewModel(notifyListeners: () {});
      logger.i('Membuat instance rekeningCardSimpananBerjangkaViewModel');
      
      // aksi (act)
      String result = rekeningCardSimpananBerjangkaViewModel.formatDate('2024-01-25');
      logger.i('Berhasil memasukan kembalian dari function formatDate');

      // tegaskan (assert)
      expect(rekeningCardSimpananBerjangkaViewModel.formatDate('2024-01-25'), result);
      logger.i('Seharusnya berformat tanggal-bulan-tahun : $result');
      logger.i('Berhasil memverifikasi result : $result');
    });

    test('formatDate jika tanggal-bulan-tahun', () {
      logger.i('Menjalankan formatDate jika tanggal-bulan-tahun');

      // atur (arrange)
      final rekeningCardSimpananBerjangkaViewModel = RekeningCardSimpananBerjangkaViewModel(notifyListeners: () {});
      logger.i('Membuat instance rekeningCardSimpananBerjangkaViewModel');

      // aksi (act)
      String result = rekeningCardSimpananBerjangkaViewModel.formatDate('25-01-2024');
      logger.i('Berhasil memasukan kembalian dari function formatDate');

      // tegaskan (assert)
      expect(rekeningCardSimpananBerjangkaViewModel.formatDate('25-01-2024'), result);
      logger.i('Seharusnya berformat tanggal-bulan-tahun : $result');
      logger.i('Berhasil memverifikasi result : $result');
    });
  });

  group('RekeningCardSimpananBerjangkaViewModel API', () {
    // atur (arrange)
    late MockClient mockClient;
    late ApiMock apiMock;
    final String baseUrl = dotenv.get('BASE_URL');

    setUp(() {
      mockClient = MockClient();
      apiMock = ApiMock(client: mockClient);
    });

    test('listTabunganSimpananBerjangka response berhasil', () async {
      logger.i('Menjalankan listTabunganSimpananBerjangka response berhasil');

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
        body: jsonEncode(<String, String>{
          'username': 'irvan',
          'password': 'irvan123',
        }),
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Login berhasil", "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY"}',
          200));
      logger.i('Berhasil menjalankan mock userLogin status 200');

      // atur (arrange) userLogin
      when(mockClient.get(
        Uri.parse('$baseUrl/user/rekening-deposito/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Succes", "deposits": [{"code": "2036625026","productName": "SIMPANAN BERJANGKA 3 BULAN","name": "Irvan Al Rasyid","bilyet": "123456","begin": "2024-01-01","end": "2024-06-30","value": "1000000.00","aro": 1}]}',
          200));
      logger.i('Berhasil menjalankan mock listRekeningDepositSimpananBerjangka status 200');

      final data = await apiMock.listRekeningDepositSimpananBerjangka('irvan');
      logger.i('Berhasil mendapatkan kembalian dari listTabunganSimpananBerjangka ke variabel data');
      logger.i(data);

      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 1);
      expect(data['message'], "Succes");
      // Verifikasi data savings
      final List<dynamic> deposits = data["deposits"];
      expect(deposits.length, 1);
      final firstDeposits = deposits[0];
      expect(firstDeposits['code'], "2036625026");
      expect(firstDeposits['productName'], "SIMPANAN BERJANGKA 3 BULAN");
      expect(firstDeposits['name'], "Irvan Al Rasyid");
      expect(firstDeposits['bilyet'], "123456");
      expect(firstDeposits['begin'], "2024-01-01");
      expect(firstDeposits['end'], "2024-06-30");
      expect(firstDeposits['value'], "1000000.00");
      expect(firstDeposits['aro'], 1);

      logger.i('Berhasil menjalankan mock listTabunganSimpananBerjangka berhasil');
    });

    test('listTabunganSimpananBerjangka response gagal', () async {
      logger.i('Menjalankan listTabunganSimpananBerjangka response gagal');

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
        body: jsonEncode(<String, String>{
          'username': 'irvan',
          'password': 'irvan123',
        }),
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Login berhasil", "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY"}',
          200));
      logger.i('Berhasil menjalankan mock userLogin status 200');

      // atur (arrange) userLogin
      when(mockClient.get(
        Uri.parse('$baseUrl/user/rekening-deposito/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!"}',
          500));
      logger.i('Berhasil menjalankan mock listRekeningDepositSimpananBerjangka status 500');

      final data = await apiMock.listRekeningDepositSimpananBerjangka('irvan');
      logger.i('Berhasil mendapatkan kembalian dari listTabunganSimpananBerjangka ke variabel data');
      logger.i(data);

      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 0);
      expect(data['message'], "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!");

      logger.i('Berhasil menjalankan mock listTabunganSimpananBerjangka gagal');
    });
  });
}
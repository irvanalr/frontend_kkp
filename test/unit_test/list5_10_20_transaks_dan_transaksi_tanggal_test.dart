import 'dart:convert';

import 'package:febankflutter/api/api_mock.dart';
import 'package:febankflutter/models/mutasi_beranda_model.dart';
import 'package:febankflutter/viewmodels/mutasi_beranda_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../mocking/http_client_mock.mocks.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final logger = Logger();

  group('MutasiBerandaViewModel method updateTransaksi', () {
    test('updateTransaksi 5 Transaksi', () {
      logger.i('Menjalankan updateTransaksi 5 Transaksi');

      // atur (arrange)
      final mutasiBerandaViewModel = MutasiBerandaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance mutasiBerandaViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel transaksi berisikan : ${mutasiBerandaViewModel.mutasiBerandaModel.transaksi}');
      mutasiBerandaViewModel.updateTransaksi('5 Transaksi terakhir');
      logger.i('Berhasil menjalankan function updateTransaksi');

      // tegaskan (assert)
      expect(mutasiBerandaViewModel.mutasiBerandaModel.transaksi, '5 Transaksi terakhir');
      logger.i('Seharusnya variabel transaksi berisikan : ${mutasiBerandaViewModel.mutasiBerandaModel.transaksi}');
    });

  });

  group('MutasiBerandaViewModel method updateSelectedTransaksi', () {
    test('updateSelectedTransaksi 5 Transaksi', () {
      logger.i('updateSelectedTransaksi 5 Transaksi');

      // atur (arrange)
      final mutasiBerandaViewModel = MutasiBerandaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance mutasiBerandaViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel selectedTransaksi berisikan : ${mutasiBerandaViewModel.mutasiBerandaModel.selectedTransaksi}');
      mutasiBerandaViewModel.updateSelectedTransaksi('5 Transaksi terakhir');
      logger.i('Berhasil menjalankan function updateSelectedTransaksi');

      // tegaskan (assert)
      expect(mutasiBerandaViewModel.mutasiBerandaModel.selectedTransaksi, '5 Transaksi terakhir');
      logger.i('Seharusnya variabel selectedTransaksi berisikan : ${mutasiBerandaViewModel.mutasiBerandaModel.selectedTransaksi}');
    });
  });

  group('MutasiBerandaViewModel method updateRadioButton', () {
    test('updateRadioButton', () {
      logger.i('Menjalankan updateRadioButton');

      // atur (arrange)
      final mutasiBerandaViewModel = MutasiBerandaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance mutasiBerandaViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel selectedRadio berisikan : ${mutasiBerandaViewModel.mutasiBerandaModel.selectedRadio}');
      mutasiBerandaViewModel.updateRadioButton('5 Transaksi terakhir');
      logger.i('Berhasil menjalankan function updateRadioButton');

      // tegaskan (assert)
      expect(mutasiBerandaViewModel.mutasiBerandaModel.selectedRadio, '5 Transaksi terakhir');
      logger.i('Seharusnya variabel selectedRadio berisikan : ${mutasiBerandaViewModel.mutasiBerandaModel.selectedRadio}');
    });
  });

  group('MutasiBerandaViewModel method containsDate', () {
    test('containsDate jika memasukan tanggal, bulan dan tahun', () {
      logger.i('Menjalankan containsDate jika memasukan tanggal, bulan dan tahun');

      // atur (arrange)
      final mutasiBerandaViewModel = MutasiBerandaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance mutasiBerandaViewModel');

      // aksi (act)
      final result = mutasiBerandaViewModel.containsDate('25-01-2024');
      logger.i('Berhasil menyimpan kembalian function containsDate ke variabel result');

      // tegaskan (assert)
      expect(result, true);
      logger.i('Berhasil memverifikasi result bernilai $result');
    });

    test('containsDate jika memasukan tahun, tanggal dan bulan', () {
      logger.i('Menjalankan containsDate jika memasukan tahun, tanggal dan bulan');

      // atur (arrange)
      final mutasiBerandaViewModel = MutasiBerandaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance mutasiBerandaViewModel');

      // aksi (act)
      final result = mutasiBerandaViewModel.containsDate('2024-01-25');
      logger.i('Berhasil menyimpan kembalian function containsDate ke variabel result');

      // tegaskan (assert)
      expect(result, false);
      logger.i('Berhasil memverifikasi result bernilai $result');
    });
  });

  group('MutasiBerandaViewModel method clearMutasiBerandaModel', () {
    test('clearMutasiBerandaModel', () {
      logger.i('Menjalankan clearMutasiBerandaModel');

      // atur (arrange)
      final mutasiBerandaViewModel = MutasiBerandaViewModel(notifyListeners: () {});
      logger.i('Berhasil membuat instance mutasiBerandaViewModel');

      // Tambahkan transaksi ke dalam list
      mutasiBerandaViewModel.mutasiBerandaModel.transactions.add(
        Transactions(
            date: '25-01-2024',
            code: 'TRANS041',
            description: 'Transfer - Irvan Al Rasyid (SW 16 05 00099)',
            direction: '1',
            value1: '40000.00',
            endValue1: '380000.00'
        ),
      );

      // aksi (act)
      mutasiBerandaViewModel.mutasiBerandaModel.transaksi = '5 Transaksi terakhir';
      mutasiBerandaViewModel.mutasiBerandaModel.selectedTransaksi = '5 Transaksi terakhir';
      mutasiBerandaViewModel.mutasiBerandaModel.selectedRadio = '5 Transaksi terakhir';
      mutasiBerandaViewModel.mutasiBerandaModel.dropdownItems = [
        '5 Transaksi',
        '10 Transaksi',
        '20 Transaksi'
      ];
      mutasiBerandaViewModel.mutasiBerandaModel.selectedDropdownItem = '5 Transaksi terakhir';
      mutasiBerandaViewModel.mutasiBerandaModel.selectedDate = DateTime.now();
      mutasiBerandaViewModel.mutasiBerandaModel.dateNow = DateTime.now();

      logger.i('transaksi : ${mutasiBerandaViewModel.mutasiBerandaModel.transaksi}');
      logger.i('selectedTransaksi : ${mutasiBerandaViewModel.mutasiBerandaModel.selectedTransaksi}');
      logger.i('selectedRadio : ${mutasiBerandaViewModel.mutasiBerandaModel.selectedRadio}');
      logger.i('dropdownItems : ${mutasiBerandaViewModel.mutasiBerandaModel.dropdownItems}');
      logger.i('selectedDropdownItem : ${mutasiBerandaViewModel.mutasiBerandaModel.selectedDropdownItem}');
      logger.i('selectedDate : ${mutasiBerandaViewModel.mutasiBerandaModel.selectedDate}');
      logger.i('dateNow : ${mutasiBerandaViewModel.mutasiBerandaModel.dateNow}');
      logger.i('transactions date : ${mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].date}');
      logger.i('transactions code : ${mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].code}');
      logger.i('transactions description : ${mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].description}');
      logger.i('transactions direction : ${mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].direction}');
      logger.i('transactions value1 : ${mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].value1}');
      logger.i('transactions endValue1 : ${mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].endValue1}');
      
      logger.i('Berhasil mengisikan semua variabel terkait');
      
      mutasiBerandaViewModel.clearMutasiBerandaModel();
      logger.i('Berhasil mengeksekusi function clearMutasiBerandaModel');
      
      expect(mutasiBerandaViewModel.mutasiBerandaModel.transaksi, '');
      expect(mutasiBerandaViewModel.mutasiBerandaModel.selectedTransaksi, '');
      expect(mutasiBerandaViewModel.mutasiBerandaModel.selectedRadio, '');
      expect(mutasiBerandaViewModel.mutasiBerandaModel.dropdownItems, []);
      expect(mutasiBerandaViewModel.mutasiBerandaModel.selectedDropdownItem, null);
      expect(mutasiBerandaViewModel.mutasiBerandaModel.selectedDate, null);
      expect(
        mutasiBerandaViewModel.mutasiBerandaModel.dateNow.millisecondsSinceEpoch,
        closeTo(DateTime.now().millisecondsSinceEpoch, 10), // 10 ms toleransi
      );
      expect(mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].date, '');
      expect(mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].code, '');
      expect(mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].description, '');
      expect(mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].direction, '');
      expect(mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].value1, '');
      expect(mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].endValue1, '');

      logger.i('transaksi : ${mutasiBerandaViewModel.mutasiBerandaModel.transaksi}');
      logger.i('selectedTransaksi : ${mutasiBerandaViewModel.mutasiBerandaModel.selectedTransaksi}');
      logger.i('selectedRadio : ${mutasiBerandaViewModel.mutasiBerandaModel.selectedRadio}');
      logger.i('dropdownItems : ${mutasiBerandaViewModel.mutasiBerandaModel.dropdownItems}');
      logger.i('selectedDropdownItem : ${mutasiBerandaViewModel.mutasiBerandaModel.selectedDropdownItem}');
      logger.i('selectedDate : ${mutasiBerandaViewModel.mutasiBerandaModel.selectedDate}');
      logger.i('dateNow : ${mutasiBerandaViewModel.mutasiBerandaModel.dateNow}');
      logger.i('transactions date : ${mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].date}');
      logger.i('transactions code : ${mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].code}');
      logger.i('transactions description : ${mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].description}');
      logger.i('transactions direction : ${mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].direction}');
      logger.i('transactions value1 : ${mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].value1}');
      logger.i('transactions endValue1 : ${mutasiBerandaViewModel.mutasiBerandaModel.transactions[0].endValue1}');

      logger.i('Berhasil semua data di kosongkan !!!');
    });
  });

  group('list5Transaksi api', () {
    // atur (arrange)
    late MockClient mockClient;
    late ApiMock apiMock;
    final String baseUrl = dotenv.get('BASE_URL');

    setUp(() {
      mockClient = MockClient();
      apiMock = ApiMock(client: mockClient);
    });

    test('Menjalankan list5Transaksi api response berhasil', () async {
      logger.i('Menjalankan list5Transaksi api response berhasil');

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
      logger.i('Berhasil menjalankan mock login');

      // aksi (act)
      when(mockClient.get(
        Uri.parse('$baseUrl/user/transaksi/last5date/116 04 5063/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Success", "transactions": [{"date": "2024-08-01","code": "TRANS041","description": "Transfer - Irvan Al Rasyid (SW 16 05 00099)","direction": "1","value1": "40000.00","endValue1": "380000.00"}]}',
          200));
      logger.i('Berhasil menjalankan mock list5Transaksi');

      // aksi (act)
      final data = await apiMock.list5transaksiTabungan('116 04 5063', 'irvan');
      logger.i('Berhasil menyimpan kembalian dari list5transaksiTabungan ke data');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 1);
      expect(data['message'], "Success");
      // Verifikasi data transactions
      final List<dynamic> transactions = data["transactions"];
      expect(transactions.length, 1);
      final firstTransactions = transactions[0];
      expect(firstTransactions['date'], "2024-08-01");
      expect(firstTransactions['code'], "TRANS041");
      expect(firstTransactions['description'], "Transfer - Irvan Al Rasyid (SW 16 05 00099)");
      expect(firstTransactions['direction'], "1");
      expect(firstTransactions['value1'], "40000.00");
      expect(firstTransactions['endValue1'], "380000.00");

      logger.i('Berhasil menjalankan mock list5Transaksi response berhasil');
    });

    test('Menjalankan list5Transaksi api response gagal', () async {
      logger.i('Menjalankan list5Transaksi api response gagal');

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
      logger.i('Berhasil menjalankan mock login');

      // aksi (act)
      when(mockClient.get(
        Uri.parse('$baseUrl/user/transaksi/last5date/116 04 5063/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!", "transactions": []}',
          500));
      logger.i('Berhasil menjalankan mock list5Transaksi');

      // aksi (act)
      final data = await apiMock.list5transaksiTabungan('116 04 5063', 'irvan');
      logger.i('Berhasil menyimpan kembalian dari list5transaksiTabungan ke data');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 0);
      expect(data['message'], "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!");
      expect(data['transaction'], null);

      logger.i('Berhasil menjalankan mock list5Transaksi response gagal');
    });
  });

  group('list10Transaksi api', () {
    // atur (arrange)
    late MockClient mockClient;
    late ApiMock apiMock;
    final String baseUrl = dotenv.get('BASE_URL');

    setUp(() {
      mockClient = MockClient();
      apiMock = ApiMock(client: mockClient);
    });

    test('Menjalankan list10Transaksi api response berhasil', () async {
      logger.i('Menjalankan list10Transaksi api response berhasil');

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
      logger.i('Berhasil menjalankan mock login');

      // aksi (act)
      when(mockClient.get(
        Uri.parse('$baseUrl/user/transaksi/last10date/116 04 5063/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Success", "transactions": [{"date": "2024-08-01","code": "TRANS041","description": "Transfer - Irvan Al Rasyid (SW 16 05 00099)","direction": "1","value1": "40000.00","endValue1": "380000.00"}]}',
          200));
      logger.i('Berhasil menjalankan mock list10Transaksi');

      // aksi (act)
      final data = await apiMock.list10transaksiTabungan('116 04 5063', 'irvan');
      logger.i('Berhasil menyimpan kembalian dari list10transaksiTabungan ke data');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 1);
      expect(data['message'], "Success");
      // Verifikasi data transactions
      final List<dynamic> transactions = data["transactions"];
      expect(transactions.length, 1);
      final firstTransactions = transactions[0];
      expect(firstTransactions['date'], "2024-08-01");
      expect(firstTransactions['code'], "TRANS041");
      expect(firstTransactions['description'], "Transfer - Irvan Al Rasyid (SW 16 05 00099)");
      expect(firstTransactions['direction'], "1");
      expect(firstTransactions['value1'], "40000.00");
      expect(firstTransactions['endValue1'], "380000.00");

      logger.i('Berhasil menjalankan mock list10Transaksi response berhasil');
    });

    test('Menjalankan list10Transaksi api response gagal', () async {
      logger.i('Menjalankan list10Transaksi api response gagal');

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
      logger.i('Berhasil menjalankan mock login');

      // aksi (act)
      when(mockClient.get(
        Uri.parse('$baseUrl/user/transaksi/last10date/116 04 5063/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!", "transactions": []}',
          500));
      logger.i('Berhasil menjalankan mock list10Transaksi');

      // aksi (act)
      final data = await apiMock.list10transaksiTabungan('116 04 5063', 'irvan');
      logger.i('Berhasil menyimpan kembalian dari list10transaksiTabungan ke data');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 0);
      expect(data['message'], "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!");
      expect(data['transaction'], null);

      logger.i('Berhasil menjalankan mock list10Transaksi response gagal');
    });
  });

  group('list20Transaksi api', () {
    // atur (arrange)
    late MockClient mockClient;
    late ApiMock apiMock;
    final String baseUrl = dotenv.get('BASE_URL');

    setUp(() {
      mockClient = MockClient();
      apiMock = ApiMock(client: mockClient);
    });

    test('Menjalankan list20Transaksi api response berhasil', () async {
      logger.i('Menjalankan list20Transaksi api response berhasil');

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
      logger.i('Berhasil menjalankan mock login');

      // aksi (act)
      when(mockClient.get(
        Uri.parse('$baseUrl/user/transaksi/last20date/116 04 5063/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Success", "transactions": [{"date": "2024-08-01","code": "TRANS041","description": "Transfer - Irvan Al Rasyid (SW 16 05 00099)","direction": "1","value1": "40000.00","endValue1": "380000.00"}]}',
          200));
      logger.i('Berhasil menjalankan mock list20Transaksi');

      // aksi (act)
      final data = await apiMock.list20transaksiTabungan('116 04 5063', 'irvan');
      logger.i('Berhasil menyimpan kembalian dari list20transaksiTabungan ke data');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 1);
      expect(data['message'], "Success");
      // Verifikasi data transactions
      final List<dynamic> transactions = data["transactions"];
      expect(transactions.length, 1);
      final firstTransactions = transactions[0];
      expect(firstTransactions['date'], "2024-08-01");
      expect(firstTransactions['code'], "TRANS041");
      expect(firstTransactions['description'], "Transfer - Irvan Al Rasyid (SW 16 05 00099)");
      expect(firstTransactions['direction'], "1");
      expect(firstTransactions['value1'], "40000.00");
      expect(firstTransactions['endValue1'], "380000.00");

      logger.i('Berhasil menjalankan mock list20Transaksi response berhasil');
    });

    test('Menjalankan list20Transaksi api response gagal', () async {
      logger.i('Menjalankan list20Transaksi api response gagal');

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
      logger.i('Berhasil menjalankan mock login');

      // aksi (act)
      when(mockClient.get(
        Uri.parse('$baseUrl/user/transaksi/last20date/116 04 5063/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!", "transactions": []}',
          500));
      logger.i('Berhasil menjalankan mock list20Transaksi');

      // aksi (act)
      final data = await apiMock.list20transaksiTabungan('116 04 5063', 'irvan');
      logger.i('Berhasil menyimpan kembalian dari list20transaksiTabungan ke data');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 0);
      expect(data['message'], "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!");
      expect(data['transaction'], null);

      logger.i('Berhasil menjalankan mock list20Transaksi response gagal');
    });
  });

  group('list5TransaksiWithDate api', () {
    // atur (arrange)
    late MockClient mockClient;
    late ApiMock apiMock;
    final String baseUrl = dotenv.get('BASE_URL');

    setUp(() {
      mockClient = MockClient();
      apiMock = ApiMock(client: mockClient);
    });

    test('Menjalankan list5TransaksiWithDate api response berhasil', () async {
      logger.i('Menjalankan list5TransaksiWithDate api response berhasil');

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
      logger.i('Berhasil menjalankan mock login');

      // aksi (act)
      when(mockClient.get(
        Uri.parse('$baseUrl/user/transaksi/last5date/116 04 5063/2024-08-01/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Success", "transactions": [{"date": "2024-08-01","code": "TRANS041","description": "Transfer - Irvan Al Rasyid (SW 16 05 00099)","direction": "1","value1": "40000.00","endValue1": "380000.00"}]}',
          200));
      logger.i('Berhasil menjalankan mock list5Transaksi');

      // aksi (act)
      final data = await apiMock.list5transaksiTabunganWithDate('116 04 5063', '2024-08-01','irvan');
      logger.i('Berhasil menyimpan kembalian dari list5transaksiTabunganWithDate ke data');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 1);
      expect(data['message'], "Success");
      // Verifikasi data transactions
      final List<dynamic> transactions = data["transactions"];
      expect(transactions.length, 1);
      final firstTransactions = transactions[0];
      expect(firstTransactions['date'], "2024-08-01");
      expect(firstTransactions['code'], "TRANS041");
      expect(firstTransactions['description'], "Transfer - Irvan Al Rasyid (SW 16 05 00099)");
      expect(firstTransactions['direction'], "1");
      expect(firstTransactions['value1'], "40000.00");
      expect(firstTransactions['endValue1'], "380000.00");

      logger.i('Berhasil menjalankan mock list5TransaksiWithDate response berhasil');
    });

    test('Menjalankan list5TransaksiWithDate api response gagal', () async {
      logger.i('Menjalankan list5TransaksiWithDate api response gagal');

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
      logger.i('Berhasil menjalankan mock login');

      // aksi (act)
      when(mockClient.get(
        Uri.parse('$baseUrl/user/transaksi/last5date/116 04 5063/2024-08-01/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!", "transactions": []}',
          500));
      logger.i('Berhasil menjalankan mock list5Transaksi');

      // aksi (act)
      final data = await apiMock.list5transaksiTabunganWithDate('116 04 5063', '2024-08-01','irvan');
      logger.i('Berhasil menyimpan kembalian dari list5transaksiTabungan ke data');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 0);
      expect(data['message'], "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!");
      expect(data['transaction'], null);

      logger.i('Berhasil menjalankan mock list5Transaksi response gagal');
    });
  });

  group('list10TransaksiWithDate api', () {
    // atur (arrange)
    late MockClient mockClient;
    late ApiMock apiMock;
    final String baseUrl = dotenv.get('BASE_URL');

    setUp(() {
      mockClient = MockClient();
      apiMock = ApiMock(client: mockClient);
    });

    test('Menjalankan list10TransaksiWithDate api response berhasil', () async {
      logger.i('Menjalankan list10TransaksiWithDate api response berhasil');

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
      logger.i('Berhasil menjalankan mock login');

      // aksi (act)
      when(mockClient.get(
        Uri.parse('$baseUrl/user/transaksi/last10date/116 04 5063/2024-08-01/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Success", "transactions": [{"date": "2024-08-01","code": "TRANS041","description": "Transfer - Irvan Al Rasyid (SW 16 05 00099)","direction": "1","value1": "40000.00","endValue1": "380000.00"}]}',
          200));
      logger.i('Berhasil menjalankan mock list10TransaksiWithDate');

      // aksi (act)
      final data = await apiMock.list10transaksiTabunganWithDate('116 04 5063','2024-08-01', 'irvan');
      logger.i('Berhasil menyimpan kembalian dari list10transaksiTabunganWithDate ke data');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 1);
      expect(data['message'], "Success");
      // Verifikasi data transactions
      final List<dynamic> transactions = data["transactions"];
      expect(transactions.length, 1);
      final firstTransactions = transactions[0];
      expect(firstTransactions['date'], "2024-08-01");
      expect(firstTransactions['code'], "TRANS041");
      expect(firstTransactions['description'], "Transfer - Irvan Al Rasyid (SW 16 05 00099)");
      expect(firstTransactions['direction'], "1");
      expect(firstTransactions['value1'], "40000.00");
      expect(firstTransactions['endValue1'], "380000.00");

      logger.i('Berhasil menjalankan mock list10Transaksi response berhasil');
    });

    test('Menjalankan list10TransaksiWithDate api response gagal', () async {
      logger.i('Menjalankan list10TransaksiWithDate api response gagal');

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
      logger.i('Berhasil menjalankan mock login');

      // aksi (act)
      when(mockClient.get(
        Uri.parse('$baseUrl/user/transaksi/last10date/116 04 5063/2024-08-01/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!", "transactions": []}',
          500));
      logger.i('Berhasil menjalankan mock list10TransaksiWithDate');

      // aksi (act)
      final data = await apiMock.list10transaksiTabunganWithDate('116 04 5063', '2024-08-01', 'irvan');
      logger.i('Berhasil menyimpan kembalian dari list10transaksiTabunganWithDate ke data');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 0);
      expect(data['message'], "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!");
      expect(data['transaction'], null);

      logger.i('Berhasil menjalankan mock list10TransaksiWithDate response gagal');
    });
  });

  group('list20TransaksiWithDate api', () {
    // atur (arrange)
    late MockClient mockClient;
    late ApiMock apiMock;
    final String baseUrl = dotenv.get('BASE_URL');

    setUp(() {
      mockClient = MockClient();
      apiMock = ApiMock(client: mockClient);
    });

    test('Menjalankan list20TransaksiWithDate api response berhasil', () async {
      logger.i('Menjalankan list20TransaksiWithDate api response berhasil');

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
      logger.i('Berhasil menjalankan mock login');

      // aksi (act)
      when(mockClient.get(
        Uri.parse('$baseUrl/user/transaksi/last20date/116 04 5063/2024-08-01/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Success", "transactions": [{"date": "2024-08-01","code": "TRANS041","description": "Transfer - Irvan Al Rasyid (SW 16 05 00099)","direction": "1","value1": "40000.00","endValue1": "380000.00"}]}',
          200));
      logger.i('Berhasil menjalankan mock list20TransaksiWithDate');

      // aksi (act)
      final data = await apiMock.list20transaksiTabunganWithDate('116 04 5063', '2024-08-01', 'irvan');
      logger.i('Berhasil menyimpan kembalian dari list20transaksiTabunganWithDate ke data');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 1);
      expect(data['message'], "Success");
      // Verifikasi data transactions
      final List<dynamic> transactions = data["transactions"];
      expect(transactions.length, 1);
      final firstTransactions = transactions[0];
      expect(firstTransactions['date'], "2024-08-01");
      expect(firstTransactions['code'], "TRANS041");
      expect(firstTransactions['description'], "Transfer - Irvan Al Rasyid (SW 16 05 00099)");
      expect(firstTransactions['direction'], "1");
      expect(firstTransactions['value1'], "40000.00");
      expect(firstTransactions['endValue1'], "380000.00");

      logger.i('Berhasil menjalankan mock list20TransaksiWithDate response berhasil');
    });

    test('Menjalankan list20TransaksiWithDate api response gagal', () async {
      logger.i('Menjalankan list20TransaksiWithDate api response gagal');

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
      logger.i('Berhasil menjalankan mock login');

      // aksi (act)
      when(mockClient.get(
        Uri.parse('$baseUrl/user/transaksi/last20date/116 04 5063/2024-08-01/irvan'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!", "transactions": []}',
          500));
      logger.i('Berhasil menjalankan mock list20TransaksiWithDate');

      // aksi (act)
      final data = await apiMock.list20transaksiTabunganWithDate('116 04 5063', '2024-08-01', 'irvan');
      logger.i('Berhasil menyimpan kembalian dari list20transaksiTabunganWithDate ke data');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], "2024-08-09T06:32:48.701Z");
      expect(data['status'], 0);
      expect(data['message'], "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!");
      expect(data['transaction'], null);

      logger.i('Berhasil menjalankan mock list20TransaksiWithDate response gagal');
    });
  });
}
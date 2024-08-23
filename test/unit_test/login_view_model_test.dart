import 'dart:convert';

import 'package:febankflutter/api/api_mock.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class MockFlutterLocalNotificationsPlugin extends Mock
    implements FlutterLocalNotificationsPlugin {
  @override
  Future<void> show(int id, String? title, String? body,
      NotificationDetails? notificationDetails,
      {String? payload}) {
    return super.noSuchMethod(
      Invocation.method(#show, [id, title, body, notificationDetails, payload]),
      returnValue: Future.value(),
    );
  }
}

void main() async {
  await dotenv.load(fileName: ".env");
  final logger = Logger();

  group('LoginViewModel method togglePasswordVisibility', () {
    test('togglePasswordVisibility', () {
      // atur (arrange)
      final loginViewModel = LoginViewModel();
      // tegaskan (assert)
      expect(loginViewModel.kataSandiVisible, false);
      logger.i(
          'Seharusnya nilai awal variable kataSandiVisible = ${loginViewModel.kataSandiVisible}');
      // aksi (act)
      loginViewModel.kataSandiVisibility();
      // tegaskan (assert)
      expect(loginViewModel.kataSandiVisible, true);
      logger.i(
          'Seharusnya ketika di tap nilai variable kataSandiVisible = ${loginViewModel.kataSandiVisible}');
      // aksi (act)
      loginViewModel.kataSandiVisibility();
      // tegaskan (assert)
      expect(loginViewModel.kataSandiVisible, false);
      logger.i(
          'Seharusnya ketika di tap lagi nilai variable kataSandiVisible = ${loginViewModel.kataSandiVisible}');
    });
  });

  group('LoginViewModel method updateNamaPengguna', () {
    test('updateNamaPengguna', () {
      // atur (arrange)
      final loginViewModel = LoginViewModel();
      // tegaskan (assert)
      expect(loginViewModel.namaPengguna, '');
      logger.i(
          'Seharusnya namaPengguna tidak ada isinya : ${loginViewModel.namaPengguna}');
      // aksi (act)
      loginViewModel.updateNamaPengguna('username');
      // tegaskan (assert)
      expect(loginViewModel.namaPengguna, 'username');
      logger.i(
          'Seharusnya namaPengguna ada isinya : ${loginViewModel.namaPengguna}');
    });
  });

  group('LoginViewModel method updateKataSandi', () {
    test('updateKataSandi', () {
      // atur (arrange)
      final loginViewModel = LoginViewModel();
      // tegaskan (assert)
      expect(loginViewModel.kataSandi, '');
      logger.i(
          'Seharusnya kataSandi tidak ada isinya : ${loginViewModel.kataSandi}');
      // aksi (act)
      loginViewModel.updateKataSandi('kata sandi');
      // tegaskan (assert)
      expect(loginViewModel.kataSandi, 'kata sandi');
      logger.i('Seharusnya kataSandi ada isinya : ${loginViewModel.kataSandi}');
    });
  });

  group('LoginViewModel method updateButtonStatus', () {
    test(
        'updateButtonStatus akan bernilai true jika kedua textField terdapat nilai',
        () {
      // atur (arrange)
      final loginViewModel = LoginViewModel();
      // karena kedua textField tidak ada nilai seharusnya false
      logger.i(
          'Seharusnya isButtonEnabled bernilai : ${loginViewModel.loginModel.isButtonEnabled}');
      expect(loginViewModel.loginModel.isButtonEnabled, false);
      // aksi (act)
      loginViewModel.updateNamaPengguna('username');
      loginViewModel.updateKataSandi('password');
      // tegaskan (assert)
      expect(loginViewModel.loginModel.isButtonEnabled, true);
      logger.i(
          'Seharusnya namaPengguna ada isinya : ${loginViewModel.namaPengguna}');
      logger.i('Seharusnya kataSandi ada isinya : ${loginViewModel.kataSandi}');
      logger.i(
          'Seharusnya isButtonEnabled bernilai : ${loginViewModel.loginModel.isButtonEnabled}');
    });

    test(
        'updateNamaPengguna saja yang di isi akan membuat button tetap visible',
        () {
      // atur (arrange)
      final loginViewModel = LoginViewModel();
      const newUserName = 'username';
      // aksi (act)
      loginViewModel.updateNamaPengguna(newUserName);
      // tegaskan (assert)
      expect(loginViewModel.namaPengguna, newUserName);
      // verifikasi jika hanya namaPengguna saja yang di isi
      // maka button login harusnya tidak bisa di tekan
      expect(loginViewModel.loginModel.isButtonEnabled, false);
      logger.i(
          'Seharusnya namaPengguna ada isinya : ${loginViewModel.namaPengguna}');
      logger.i('Seharusnya kataSandi ada isinya : ${loginViewModel.kataSandi}');
      logger.i(
          'Seharusnya isButtonEnabled bernilai : ${loginViewModel.loginModel.isButtonEnabled}');
    });

    test('updateKataSandi saja yang di isi akan membuat button tetap visible',
        () {
      // atur (arrange)
      final loginViewModel = LoginViewModel();
      const newUserKataSandi = 'password';
      // aksi (act)
      loginViewModel.updateKataSandi(newUserKataSandi);
      // tegaskan (assert)
      expect(loginViewModel.kataSandi, newUserKataSandi);
      // verifikasi jika hanya namaPengguna saja yang di isi
      // maka button login harusnya tidak bisa di tekan
      expect(loginViewModel.loginModel.isButtonEnabled, false);
      logger.i(
          'Seharusnya namaPengguna ada isinya : ${loginViewModel.namaPengguna}');
      logger.i('Seharusnya kataSandi ada isinya : ${loginViewModel.kataSandi}');
      logger.i(
          'Seharusnya isButtonEnabled bernilai : ${loginViewModel.loginModel.isButtonEnabled}');
    });
  });

  group('LoginViewModel method changeOverlayRegistrasi', () {
    test(
        'changeOverlayRegistrasi akan merubah field informationMessageOverlayRegistrasi',
        () {
      // atur (arrange)
      final loginViewModel = LoginViewModel();
      // informationMessageOverlayRegistrasi seharusnya bernilai false
      expect(
          loginViewModel.loginModel.informationMessageOverlayRegistrasi, false);
      logger.i(
          'Seharusnya informasiMessageOverlayRegistrasi bernilai : ${loginViewModel.loginModel.informationMessageOverlayRegistrasi}');
      // aksi (act)
      loginViewModel.changeOverlayRegistrasi();
      // tegaskan (assert)
      expect(
          loginViewModel.loginModel.informationMessageOverlayRegistrasi, true);
      logger.i(
          'Seharusnya informasiMessageOverlayRegistrasi bernilai : ${loginViewModel.loginModel.informationMessageOverlayRegistrasi}');
      // aksi (act)
      loginViewModel.changeOverlayRegistrasi();
      // tegaskan (assert)
      expect(
          loginViewModel.loginModel.informationMessageOverlayRegistrasi, false);
      logger.i(
          'Seharusnya informasiMessageOverlayRegistrasi bernilai : ${loginViewModel.loginModel.informationMessageOverlayRegistrasi}');
    });
  });

  group('LoginViewModel method getShortNamaPengguna', () {
    test('getShortNamaPengguna', () {
      // atur (arrange)
      final loginViewModel = LoginViewModel();
      logger.i(
          'Seharusnya namaPengguna berisikan : ${loginViewModel.namaPengguna}');
      loginViewModel.updateNamaPengguna('irvan');
      logger.i(
          'Seharusnya namaPengguna berisikan : ${loginViewModel.namaPengguna}');
      const expectedShortNamaPengguna = 'ir...';
      // aksi (act)
      final result = loginViewModel.getShortNamaPengguna();
      // tegaskan (assert)
      expect(result, expectedShortNamaPengguna);
      logger.i('Seharusnya namaPengguna menjadi : $result');
    });
  });

  group("sharedPreferences", () {
    // atur (arrange)
    final mockSharedPreferences = MockSharedPreferences();
    test('sebaiknya menyimpan key token dan value token ke shared preferences',
        () async {
      // aksi (act)
      when(mockSharedPreferences.setString('token', '123'))
          .thenAnswer((_) async => true);
      final result = await mockSharedPreferences.setString('token', '123');
      // tegaskan (assert)
      expect(result, isTrue);
      logger.i('Berhasil menyimpan data ke local');
    });
    test('sebaiknya mendapatkan nilai token dari shared preferences', () {
      // aksi (act)
      when(mockSharedPreferences.getString('token')).thenReturn('123');
      final result = mockSharedPreferences.getString('token');
      // tegaskan (assert)
      expect(result, '123');
      logger.i('Berhasil mengambil data dari local');
    });
    test('sebaiknya menghapus key token dari shared preferences', () async {
      // aksi (act)
      when(mockSharedPreferences.remove('token')).thenAnswer((_) async => true);
      final result = await mockSharedPreferences.remove('token');
      // tegaskan (assert)
      expect(result, isTrue);
      logger.i('Berhasil menghapus data dari local');
    });
  });

  group("notifikasi", () {
    // atur (arrange)
    final MockFlutterLocalNotificationsPlugin mockNotifications =
        MockFlutterLocalNotificationsPlugin();

    test('sebaiknya menampilkan notifikasi login', () async {
      // atur (arrange)
      var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'Cordova Notifikasi Login',
        'Cordova Mobile Login',
      );
      var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: iOSPlatformChannelSpecifics);

      // aksi (act)
      when(mockNotifications.show(
              0,
              'PERHATIAN !!!',
              'ANDA TELAH LOGIN DI JAM 17.00, TANGGAL 20-2-2024. ABAIKAN NOTIFIKASI INI JIKA INI ANDA !',
              platformChannelSpecifics))
          .thenAnswer((_) async => {});
      await mockNotifications.show(
          0,
          'PERHATIAN !!!',
          'ANDA TELAH LOGIN DI JAM 17.00, TANGGAL 20-2-2024. ABAIKAN NOTIFIKASI INI JIKA INI ANDA !',
          platformChannelSpecifics);
      // tegaskan (assert)
      verify(mockNotifications.show(
              0,
              'PERHATIAN !!!',
              'ANDA TELAH LOGIN DI JAM 17.00, TANGGAL 20-2-2024. ABAIKAN NOTIFIKASI INI JIKA INI ANDA !',
              platformChannelSpecifics))
          .called(1);
    });

    test('sebaiknya menampilkan notifikasi logout', () async {
      // atur (arrange)
      var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'Cordova Notifikasi Logout',
        'Cordova Mobile Logout',
      );
      var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: iOSPlatformChannelSpecifics);

      // aksi (act)
      when(mockNotifications.show(
              0,
              'PERHATIAN !!!',
              'Anda telah logout di jam 17.00, tanggal 20-2-2024',
              platformChannelSpecifics))
          .thenAnswer((_) async => {});
      await mockNotifications.show(
          0,
          'PERHATIAN !!!',
          'Anda telah logout di jam 17.00, tanggal 20-2-2024',
          platformChannelSpecifics);

      // tegaskan (assert)
      verify(mockNotifications.show(
              0,
              'PERHATIAN !!!',
              'Anda telah logout di jam 17.00, tanggal 20-2-2024',
              platformChannelSpecifics))
          .called(1);
    });
  });

  group('loginViewModel api test', () {
    // atur (arrange)
    late MockClient mockClient;
    late ApiMock apiMock;
    final String baseUrl = dotenv.get('BASE_URL');

    setUp(() {
      mockClient = MockClient();
      apiMock = ApiMock(client: mockClient);
    });

    group('getApiKey', () {
      test('getApiKey response benar', () async {
        // aksi (act)
        when(mockClient.get(
          Uri.parse('$baseUrl/api-key'),
          headers: {
            'mobile-app': 'mobile-application',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
        )).thenAnswer((_) async => http.Response(
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "SUCCESS", "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlblN0cmluZyI6ImEydHdYM0JsY21KaGJtdGhiZz09IiwiaWF0IjoxNzIzMTg1MTY4LCJleHAiOjE3MjM3ODk5Njh9.kCwHOhly7GDLs4-ITlN8V13Kq4Kmi2182ekUCeFCJYk"}',
            200));

        final data = await apiMock.getApiKey();

        // tegaskan (assert)
        expect(data['timestamp'], '2024-08-09T06:32:48.701Z');
        expect(data['status'], 1);
        expect(data['message'], 'SUCCESS');
        expect(data['token'],
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlblN0cmluZyI6ImEydHdYM0JsY21KaGJtdGhiZz09IiwiaWF0IjoxNzIzMTg1MTY4LCJleHAiOjE3MjM3ODk5Njh9.kCwHOhly7GDLs4-ITlN8V13Kq4Kmi2182ekUCeFCJYk');
      });

      test('getApiKey response salah', () async {
        // aksi (act)
        when(mockClient.get(
          Uri.parse('$baseUrl/api-key'),
          headers: {
            'mobile-app': 'mobile-application',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
        )).thenAnswer((_) async => http.Response(
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "FAILED"}',
            400));

        // tegaskan (assert)
        expect(() async => await apiMock.getApiKey(), throwsException);
      });
    });

    group('userLogin', () {
      test('userLogin response benar', () async {
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
          body: jsonEncode(<String, String>{
            'username': 'irvan',
            'password': 'irvan123',
          }),
        )).thenAnswer((_) async => http.Response(
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Login berhasil", "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY"}',
            200));

        // aksi (act)
        final data = await apiMock.userLogin('irvan', 'irvan123');
        logger.i(data);

        // tegaskan (assert)
        expect(data['timestamp'], '2024-08-09T06:32:48.701Z');
        expect(data['status'], 1);
        expect(data['message'], 'Login berhasil');
        expect(data['token'],
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY');
      });

      test('userLogin response salah alert kredensial 1 (password salah)',
          () async {
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
          body: jsonEncode(<String, String>{
            'username': 'irvan',
            'password': 'irvan1234', // password salah
          }),
        )).thenAnswer((_) async => http.Response(
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "Username dan Password salah!"}',
            401));

        // aksi (act)
        final data = await apiMock.userLogin('irvan', 'irvan1234');

        // tegaskan (assert)
        expect(data['status'], 0);
        expect(data['message'], 'Username dan Password salah!');
      });

      test('userLogin response salah alert kredensial 2 (username salah)',
          () async {
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
          body: jsonEncode(<String, String>{
            'username': 'irvans', // username salah
            'password': 'irvan123',
          }),
        )).thenAnswer((_) async => http.Response(
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "Username dan Password salah!"}',
            401));

        // aksi (act)
        final data = await apiMock.userLogin('irvans', 'irvan123');

        // tegaskan (assert)
        expect(data['status'], 0);
        expect(data['message'], 'Username dan Password salah!');
      });

      test('userLogin response salah alert kredensial 3 (akun dinonaktifkan)',
          () async {
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
          body: jsonEncode(<String, String>{
            'username': 'irvan',
            'password': 'irvan123',
          }),
        )).thenAnswer((_) async => http.Response(
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "Akun Anda dinonaktifkan"}',
            403));

        // aksi (act)
        final data = await apiMock.userLogin('irvan', 'irvan123');

        // tegaskan (assert)
        expect(data['status'], 0);
        expect(data['message'], 'Akun Anda dinonaktifkan');
      });
    });

    group('userLogout', () {
      test('userLogout response berhasil', () async {
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
        when(mockClient.delete(
          Uri.parse('$baseUrl/logout'),
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
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Logout berhasil"}',
            200));

        // aksi (act)
        final data = await apiMock.userLogout();

        // tegaskan (assert)
        expect(data['status'], 1);
        expect(data['message'], 'Logout berhasil');
      });

      test('userLogout response gagal', () async {
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
        when(mockClient.delete(
          Uri.parse('$baseUrl/logout'),
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
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "Logout gagal"}',
            401));

        // aksi (act)
        final data = await apiMock.userLogout();

        expect(data['status'], 0);
        expect(data['message'], 'Logout gagal');
      });

      test('userLogout response gagal karena status code bukan 200', () async {
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
        when(mockClient.delete(
          Uri.parse('$baseUrl/logout'),
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
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!"}',
            500));

        // aksi (act)
        final data = await apiMock.userLogout();

        // tegaskan (assert)
        expect(data['status'], 0);
        expect(data['message'],
            'SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!');
      });
    });
  });
}

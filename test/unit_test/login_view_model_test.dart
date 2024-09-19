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
      logger.i('Menjalankan togglePasswordVisibility');

      // atur (arrange)
      final loginViewModel = LoginViewModel();
      logger.i('Berhasil membuat instance loginViewModel');

      // tegaskan (assert)
      expect(loginViewModel.kataSandiVisible, false);
      logger.i('Seharusnya nilai awal variable kataSandiVisible = ${loginViewModel.kataSandiVisible}');

      // aksi (act)
      loginViewModel.kataSandiVisibility();
      logger.i('Berhasil menjalankan function kataSandiVisibility');

      // tegaskan (assert)
      expect(loginViewModel.kataSandiVisible, true);
      logger.i('Seharusnya ketika di tap nilai variable kataSandiVisible = ${loginViewModel.kataSandiVisible}');

      // aksi (act)
      loginViewModel.kataSandiVisibility();
      logger.i('Berhasil menjalankan function kataSandiVisibility');

      // tegaskan (assert)
      expect(loginViewModel.kataSandiVisible, false);
      logger.i('Seharusnya ketika di tap lagi nilai variable kataSandiVisible = ${loginViewModel.kataSandiVisible}');
    });
  });

  group('LoginViewModel method updateNamaPengguna', () {
    test('updateNamaPengguna', () {
      logger.i('Menjalankan updateNamaPengguna');

      // atur (arrange)
      final loginViewModel = LoginViewModel();
      logger.i('Berhasil membuat instance loginViewModel');

      // tegaskan (assert)
      expect(loginViewModel.namaPengguna, '');
      logger.i('Seharusnya namaPengguna tidak ada isinya : ${loginViewModel.namaPengguna}');

      // aksi (act)
      loginViewModel.updateNamaPengguna('username');
      logger.i('Berhasil menjalankan function updateNamaPengguna');

      // tegaskan (assert)
      expect(loginViewModel.namaPengguna, 'username');
      logger.i('Seharusnya namaPengguna ada isinya : ${loginViewModel.namaPengguna}');
    });
  });

  group('LoginViewModel method updateKataSandi', () {
    test('updateKataSandi', () {
      logger.i('Menjalankan updateKataSandi');

      // atur (arrange)
      final loginViewModel = LoginViewModel();
      logger.i('Berhasil membuat instance loginViewModel');

      // tegaskan (assert)
      expect(loginViewModel.kataSandi, '');
      logger.i('Seharusnya kataSandi tidak ada isinya : ${loginViewModel.kataSandi}');

      // aksi (act)
      loginViewModel.updateKataSandi('kata sandi');
      logger.i('Berhasil menjalankan function updateKataSandi');

      // tegaskan (assert)
      expect(loginViewModel.kataSandi, 'kata sandi');
      logger.i('Seharusnya kataSandi ada isinya : ${loginViewModel.kataSandi}');
    });
  });

  group('LoginViewModel method updateButtonStatus', () {
    test('updateButtonStatus akan bernilai true jika kedua textField terdapat nilai', () {
      logger.i('Menjalankan updateButtonStatus akan bernilai true jika kedua textField terdapat nilai');

      // atur (arrange)
      final loginViewModel = LoginViewModel();
      logger.i('Berhasil membuat intance bernama loginViewModel');

      // karena kedua textField tidak ada nilai seharusnya false
      logger.i('Seharusnya isButtonEnabled bernilai : ${loginViewModel.loginModel.isButtonEnabled}');
      expect(loginViewModel.loginModel.isButtonEnabled, false);

      // aksi (act)
      loginViewModel.updateNamaPengguna('username');
      logger.i('Berhasil menjalankan function updateNamaPengguna');

      loginViewModel.updateKataSandi('password');
      logger.i('Berhasil menjalankan function updateKataSandi');

      // tegaskan (assert)
      expect(loginViewModel.loginModel.isButtonEnabled, true);
      logger.i('Seharusnya namaPengguna ada isinya : ${loginViewModel.namaPengguna}');
      logger.i('Seharusnya kataSandi ada isinya : ${loginViewModel.kataSandi}');
      logger.i('Seharusnya isButtonEnabled bernilai : ${loginViewModel.loginModel.isButtonEnabled}');
    });

    test('jika updateNamaPengguna saja yang di isi akan membuat button tetap visible', () {
      logger.i('Menjalankan jika updateNamaPengguna saja yang di isi akan membuat button tetap visible');

      // atur (arrange)
      final loginViewModel = LoginViewModel();
      logger.i('Berhasil membuat instance loginViewModel');

      // aksi (act)
      loginViewModel.updateNamaPengguna('username');
      // tegaskan (assert)
      expect(loginViewModel.namaPengguna, 'username');
      logger.i('Seharusnya variabel namaPengguna berisikan : ${loginViewModel.namaPengguna}');

      // verifikasi jika hanya namaPengguna saja yang di isi
      // maka button login harusnya tidak bisa di tekan
      expect(loginViewModel.loginModel.isButtonEnabled, false);
      logger.i('Seharusnya variabel isButtonEnabled : ${loginViewModel.loginModel.isButtonEnabled}');

    });

    test('updateKataSandi saja yang di isi akan membuat button tetap visible', () {
      logger.i('Menajalankan updateKataSandi saja yang di isi akan membuat button tetap visible');

      // atur (arrange)
      final loginViewModel = LoginViewModel();
      logger.i('Berhasil membuat instance loginViewModel');

      // aksi (act)
      loginViewModel.updateKataSandi('password');
      logger.i('Berhasil menjalankan function updateKataSandi');
      // tegaskan (assert)
      expect(loginViewModel.kataSandi, 'password');
      logger.i('Seharusnya variabel kataSandi berisikan : ${loginViewModel.kataSandi}');

      // verifikasi jika hanya namaPengguna saja yang di isi
      // maka button login harusnya tidak bisa di tekan
      expect(loginViewModel.loginModel.isButtonEnabled, false);
      logger.i('Seharusnya namaPengguna ada isinya : ${loginViewModel.namaPengguna}');
      logger.i('Seharusnya kataSandi ada isinya : ${loginViewModel.kataSandi}');
      logger.i('Seharusnya isButtonEnabled bernilai : ${loginViewModel.loginModel.isButtonEnabled}');
    });
  });

  group('LoginViewModel method changeOverlayRegistrasi', () {
    test('changeOverlayRegistrasi akan merubah class informationMessageOverlayRegistrasi untuk di tampilkan atau tidak', () {
      logger.i('Menjalankan changeOverlayRegistrasi akan merubah class informationMessageOverlayRegistrasi untuk di tampilkan atau tidak');

      // atur (arrange)
      final loginViewModel = LoginViewModel();
      logger.i('Berhasil membuat instance bernama loginViewModel');

      // informationMessageOverlayRegistrasi seharusnya bernilai false
      expect(loginViewModel.loginModel.informationMessageOverlayRegistrasi, false);
      logger.i('Seharusnya informasiMessageOverlayRegistrasi bernilai : ${loginViewModel.loginModel.informationMessageOverlayRegistrasi}');

      // aksi (act)
      loginViewModel.changeOverlayRegistrasi();
      logger.i('Berhasil menjalankan function changeOverlayRegistrasi');


      // tegaskan (assert)
      expect(loginViewModel.loginModel.informationMessageOverlayRegistrasi, true);
      logger.i('Seharusnya informasiMessageOverlayRegistrasi bernilai : ${loginViewModel.loginModel.informationMessageOverlayRegistrasi}');

      // aksi (act)
      loginViewModel.changeOverlayRegistrasi();
      logger.i('Berhasil menjalankan function changeOverlayRegistrasi');

      // tegaskan (assert)
      expect(loginViewModel.loginModel.informationMessageOverlayRegistrasi, false);
      logger.i('Seharusnya informasiMessageOverlayRegistrasi bernilai : ${loginViewModel.loginModel.informationMessageOverlayRegistrasi}');

    });
  });

  group('LoginViewModel method getShortNamaPengguna', () {
    test('getShortNamaPengguna lebih dari 2 karakter', () {
      logger.i('Menjalankan function getShortNamaPengguna lebih dari 2 karakter');

      // atur (arrange)
      final loginViewModel = LoginViewModel();
      logger.i('Berhasil membuat instance loginViewModel');

      logger.i('Seharusnya namaPengguna berisikan : ${loginViewModel.namaPengguna}');
      loginViewModel.updateNamaPengguna('irvan');
      logger.i('Seharusnya namaPengguna berisikan : ${loginViewModel.namaPengguna}');

      const expectedShortNamaPengguna = 'ir...';

      // aksi (act)
      final result = loginViewModel.getShortNamaPengguna();
      logger.i('Berhasil membuat instance getShortNamaPengguna');

      // tegaskan (assert)
      expect(result, expectedShortNamaPengguna);
      logger.i('Seharusnya namaPengguna menjadi : $result');
    });

    test('getShortNamaPengguna kurang dari 2 karakter', () {
      logger.i('Menjalankan function getShortNamaPengguna kurang dari 2 karakter');

      // atur (arrange)
      final loginViewModel = LoginViewModel();
      logger.i('Berhasil membuat instance loginViewModel');

      logger.i('Seharusnya namaPengguna berisikan : ${loginViewModel.namaPengguna}');
      loginViewModel.updateNamaPengguna('i');
      logger.i('Seharusnya namaPengguna berisikan : ${loginViewModel.namaPengguna}');

      const expectedShortNamaPengguna = 'i';

      // aksi (act)
      final result = loginViewModel.getShortNamaPengguna();
      logger.i('Berhasil membuat instance getShortNamaPengguna');

      // tegaskan (assert)
      expect(result, expectedShortNamaPengguna);
      logger.i('Seharusnya namaPengguna menjadi : $result');
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

  group("notifikasi", () {
    // atur (arrange)
    final MockFlutterLocalNotificationsPlugin mockNotifications = MockFlutterLocalNotificationsPlugin();

    test('notifikasi login', () async {
      logger.i('Menjalankan notifikasi login');
      // atur (arrange)
      var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'Cordova Notifikasi Login',
        'Cordova Mobile Login',
      );

      logger.i('Mendapatkan channelId dari instance variabel : ${androidPlatformChannelSpecifics.channelId}');
      logger.i('Mendapatkan channelName dari instance variabel : ${androidPlatformChannelSpecifics.channelName}');

      var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
      logger.i('Mendapatkan semua nilai default untuk IOS dari class DarwinNotificationDetails $iOSPlatformChannelSpecifics');

      var platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: iOSPlatformChannelSpecifics
      );
      logger.i('Mendapatkan NotificationDetail Android : ${platformChannelSpecifics.android}');
      logger.i('Mendapatkan NotificationDetail IOS : ${platformChannelSpecifics.iOS}');

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
      logger.i('Berhasil menjalankan mock notifikasi login');

      // tegaskan (assert)
      verify(mockNotifications.show(
              0,
              'PERHATIAN !!!',
              'ANDA TELAH LOGIN DI JAM 17.00, TANGGAL 20-2-2024. ABAIKAN NOTIFIKASI INI JIKA INI ANDA !',
              platformChannelSpecifics))
          .called(1);
      logger.i('Berhasil memverifikasi notifikasi login bahwa notifikasi sudah di panggil sebanyak 1 kali');
    });

    test('notifikasi logout', () async {
      logger.i('Menjalankan notifikasi logout');

      // atur (arrange)
      var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'Cordova Notifikasi Logout',
        'Cordova Mobile Logout',
      );
      logger.i('Mendapatkan channelId dari instance variabel : ${androidPlatformChannelSpecifics.channelId}');
      logger.i('Mendapatkan channelName dari instance variabel : ${androidPlatformChannelSpecifics.channelName}');

      var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
      logger.i('Mendapatkan semua nilai default untuk IOS dari class DarwinNotificationDetails $iOSPlatformChannelSpecifics');

      var platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: iOSPlatformChannelSpecifics
      );
      logger.i('Mendapatkan NotificationDetail Android : ${platformChannelSpecifics.android}');
      logger.i('Mendapatkan NotificationDetail IOS : ${platformChannelSpecifics.iOS}');

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
          platformChannelSpecifics
      );
      logger.i('Berhasil menjalankan mock notifikasi login');

      // tegaskan (assert)
      verify(mockNotifications.show(
              0,
              'PERHATIAN !!!',
              'Anda telah logout di jam 17.00, tanggal 20-2-2024',
              platformChannelSpecifics))
          .called(1);
      logger.i('Berhasil memverifikasi notifikasi logout bahwa notifikasi sudah di panggil sebanyak 1 kali');
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
        logger.i('Menjalankan getApiKey response benar');
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
        logger.i('Berhasil menjalankan mock getApiKey response 200');

        final data = await apiMock.getApiKey();
        logger.i('Berhasil menjalankan api_mock.dart getApiKey');
        logger.i(data);

        // tegaskan (assert)
        expect(data['timestamp'], '2024-08-09T06:32:48.701Z');
        expect(data['status'], 1);
        expect(data['message'], 'SUCCESS');
        expect(data['token'], 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlblN0cmluZyI6ImEydHdYM0JsY21KaGJtdGhiZz09IiwiaWF0IjoxNzIzMTg1MTY4LCJleHAiOjE3MjM3ODk5Njh9.kCwHOhly7GDLs4-ITlN8V13Kq4Kmi2182ekUCeFCJYk');
        logger.i('Berhasil membandingkan data mock getApiKey response berhasil');
      });

      test('getApiKey response gagal', () async {
        logger.i('Menjalankan getApiKey response gagal');

        // Atur (arrange) mockClient.get untuk kasus gagal
        when(mockClient.get(
          Uri.parse('$baseUrl/api-key'),
          headers: {
            'mobile-app': 'mobile-application',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
        )).thenAnswer((_) async => http.Response(
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "ERROR"}',
            500));
        logger.i('Berhasil menjalankan mock getApiKey gagal response 500');

        // Aksi (act)
        final data = await apiMock.getApiKey();
        logger.i('Berhasil menjalankan api_mock.dart getApiKey');
        logger.i(data);

        // Tegaskan (assert)
        expect(data['timestamp'], '2024-08-09T06:32:48.701Z');
        expect(data['status'], 0);
        expect(data['message'], 'ERROR');

        logger.i('Berhasil memverifikasi data mock getApiKey response gagal');
      });
    });

    group('userLogin', () {
      test('userLogin response berhasil', () async {
        logger.i('Menjalankan userLogin response berhasil');
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
        logger.i('Berhasil menjalankan mock getApiKey response 200');

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
        logger.i('Berhasil menjalankan mock userLogin response 200');

        // aksi (act)
        final data = await apiMock.userLogin('irvan', 'irvan123');
        logger.i('Berhasil menjalankan api_mock.dart userLogin');
        logger.i(data);

        // tegaskan (assert)
        expect(data['timestamp'], '2024-08-09T06:32:48.701Z');
        expect(data['status'], 1);
        expect(data['message'], 'Login berhasil');
        expect(data['token'], 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY');
        logger.i('Berhasil memverifikasi data mock userLogin response berhasil');
      });

      test('userLogin response salah alert kredensial 1 (password salah)', () async {
        logger.i('Menjalankan userLogin response salah alert kredensial 1 (password salah)');
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
        logger.i('Berhasil menjalankan mock getApiKey response 200');

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
            'password': 'irvan1234',
          }),
        )).thenAnswer((_) async => http.Response(
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "Username dan Password salah!"}',
            401));
        logger.i('Berhasil menjalankan mock userLogin response 401');

        // aksi (act)
        final data = await apiMock.userLogin('irvan', 'irvan1234');
        logger.i('Berhasil menjalankan api_mock.dart userLogin');
        logger.i(data);

        // tegaskan (assert)
        expect(data['status'], 0);
        expect(data['message'], 'Username dan Password salah!');
        logger.i('Berhasil memverifikasi data mock userLogin response salah alert kredensial 1 (password salah)');
      });

      test('userLogin response salah alert kredensial 2 (username salah)', () async {
        logger.i('userLogin response salah alert kredensial 2 (username salah)');
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
        logger.i('Berhasil menjalankan mock getApiKey response 200');

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
        logger.i('Berhasil menjalankan mock userLogin response 401');

        // aksi (act)
        final data = await apiMock.userLogin('irvans', 'irvan123');
        logger.i('Berhasil menjalankan api_mock.dart userLogin');
        logger.i(data);

        // tegaskan (assert)
        expect(data['status'], 0);
        expect(data['message'], 'Username dan Password salah!');
        logger.i('Berhasil memverifikasi data mock userLogin response salah alert kredensial 2 (username salah)');
      });
    });

    group('userLogout', () {
      test('userLogout response benar', () async {
        logger.i('Menjalankan userLogout response benar');
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
        when(mockClient.delete(
          Uri.parse('$baseUrl/logout/irvan'),
          headers: {
            'mobile-app': 'mobile-application',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
            'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          },
        )).thenAnswer((_) async => http.Response(
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Logout berhasil"}',
            200));
        logger.i('Berhasil menjalankan mock logout');

        // aksi (act)
        final data = await apiMock.userLogout('irvan');
        logger.i('Berhasil menjalankan api_mock.dart userLogout');
        logger.i(data);

        // tegaskan (assert)
        expect(data['status'], 1);
        expect(data['message'], 'Logout berhasil');
        logger.i('Berhasil memverifikasi data mock logout response berhasil');
      });

      test('userLogout response gagal', () async {
        logger.i('Menajalankan userLogout response gagal');
        // Atur (arrange) getApiKey
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

        // Atur (arrange) userLogin
        when(mockClient.post(
          Uri.parse('$baseUrl/auth/login'),
          headers: {
            'mobile-app': 'mobile-application',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          },
          body: jsonEncode(<String, String>{
            'username': 'irvan',
            'password': 'irvan123',
          }),
        )).thenAnswer((_) async => http.Response(
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Login berhasil", "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY"}',
            200));
        logger.i('Berhasil menjalankan mock login');

        // Atur (arrange) mockClient.delete untuk kasus gagal
        when(mockClient.delete(
          Uri.parse('$baseUrl/logout/irvan'),
          headers: {
            'mobile-app': 'mobile-application',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
            'mobile-credential': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          },
        )).thenAnswer((_) async => http.Response(
            '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "Logout failed"}',
            500));
        logger.i('Berhasil menjalankan mock logout');

        // Aksi (act): Panggil metode userLogout
        final data = await apiMock.userLogout('irvan');
        logger.i('Berhasil menjalankan api_mock.dart userLogout');
        logger.i(data);

        // Assert: Verifikasi hasilnya
        expect(data['status'], 0);
        expect(data['message'], 'Logout failed');
        logger.i('Berhasil memverifikasi data mock logout response gagal');
      });
    });
  });
}

import 'dart:convert';

import 'package:febankflutter/api/api_mock.dart';
import 'package:febankflutter/viewmodels/akun_ganti_password_view_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../mocking/http_client_mock.mocks.dart';

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
  // final logger = Logger();

  group('AkunGantiPassword method updateKataSandiLama', () {
    test('AkunGantiPassword kataSandiLama', () {
      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.kataSandiLama, '');
      // aksi (act)
      akunGantiPasswordViewModel.updateKataSandiLama('abc');
      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.kataSandiLama, 'abc');
    });
  });

  group('AkunGantiPassword method updateKataSandiBaru', () {
    test('AkunGantiPassword kataSandiBaru', () {
      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.kataSandiBaru, '');
      // aksi (act)
      akunGantiPasswordViewModel.updateKataSandiBaru('cde');
      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.kataSandiBaru, 'cde');
    });
  });

  group('AkunGantiPassword method updateKonfirmasiKataSandiBaru', () {
    test('AkunGantiPassword KonfirmasiKataSandiBaru', () {
      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.konfirmasiKataSandiBaru, '');
      // aksi (act)
      akunGantiPasswordViewModel.updateKonfirmasiKataSandiBaru('aaas');
      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.konfirmasiKataSandiBaru, 'aaas');
    });
  });

  group('AkunGantiPassword method updateToggleButtonKataSandiLamaVisibility',
      () {
    test('AkunGantiPassword toggleButtonKataSandiLamaVisibility', () {
      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.toggleButtonKataSandiLamaVisibility,
          false);
      // aksi (act)
      akunGantiPasswordViewModel.updateToggleButtonKataSandiLamaVisibility();
      // tegaskan (assert)
      expect(
          akunGantiPasswordViewModel.toggleButtonKataSandiLamaVisibility, true);
    });
  });

  group('AkunGantiPassword method updateToggleButtonKataSandiBaruVisibility',
      () {
    test('AkunGantiPassword toggleButtonKataSandiBaruVisibility', () {
      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.toggleButtonKataSandiBaruVisibility,
          false);
      // aksi (act)
      akunGantiPasswordViewModel.updateToggleButtonKataSandiBaruVisibility();
      // tegaskan (assert)
      expect(
          akunGantiPasswordViewModel.toggleButtonKataSandiBaruVisibility, true);
    });
  });

  group(
      'AkunGantiPassword method updateToggleButtonKonfirmasiKataSandiBaruVisibility',
      () {
    test('AkunGantiPassword toggleButtonKonfirmasiKataSandiBaruVisibility', () {
      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      // tegaskan (assert)
      expect(
          akunGantiPasswordViewModel
              .toggleButtonKonfirmasiKataSandiBaruVisibility,
          false);
      // aksi (act)
      akunGantiPasswordViewModel
          .updateToggleButtonKonfirmasiKataSandiBaruVisibility();
      // tegaskan (assert)
      expect(
          akunGantiPasswordViewModel
              .toggleButtonKonfirmasiKataSandiBaruVisibility,
          true);
    });
  });

  group('AkunGantiPassword method updateButtonStatus', () {
    test('AkunGantiPassword isButtonEnabled', () {
      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.akunGantiPasswordModel.isButtonEnabled,
          false);
      // aksi (act)
      akunGantiPasswordViewModel.updateKataSandiLama('abc');
      akunGantiPasswordViewModel.updateKataSandiBaru('abc');
      akunGantiPasswordViewModel.updateKonfirmasiKataSandiBaru('abc');
      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.akunGantiPasswordModel.isButtonEnabled,
          true);
    });
  });

  group('showChangePasswordNotification', () {
    // atur (arrange)
    final MockFlutterLocalNotificationsPlugin mockNotifications =
        MockFlutterLocalNotificationsPlugin();

    test('sebaiknya menampilkan notifikasi ganti password', () async {
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
              'PASSWORD ANDA DI GANTI !!, PADA JAM 20.00 DAN TANGGAL 20-2-2024',
              platformChannelSpecifics))
          .thenAnswer((_) async => {});
      await mockNotifications.show(
          0,
          'PERHATIAN !!!',
          'PASSWORD ANDA DI GANTI !!, PADA JAM 20.00 DAN TANGGAL 20-2-2024',
          platformChannelSpecifics);

      // tegaskan (assert)
      verify(mockNotifications.show(
              0,
              'PERHATIAN !!!',
              'PASSWORD ANDA DI GANTI !!, PADA JAM 20.00 DAN TANGGAL 20-2-2024',
              platformChannelSpecifics))
          .called(1);
    });
  });

  group('akunGantiPassword method userGantiPassword', () {
    // atur (arrange)
    late MockClient mockClient;
    late ApiMock apiMock;
    final String baseUrl = dotenv.get('BASE_URL');

    setUp(() {
      mockClient = MockClient();
      apiMock = ApiMock(client: mockClient);
    });
    test('userGantiPassword response berhasil', () async {
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
      when(mockClient.put(
        Uri.parse('$baseUrl/users/password'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
        body: jsonEncode(<String, String>{
          'passwordLama': 'irvan123',
          'passwordBaru': 'irvan1234',
        }),
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Berhasil mengganti kata sandi !!!", "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY"}',
          200));

      // aksi (act)
      final data = await apiMock.userGantiPassword('irvan123', 'irvan1234');

      // tegaskan (assert)
      expect(data['timestamp'], '2024-08-09T06:32:48.701Z');
      expect(data['status'], 1);
      expect(data['message'], 'Berhasil mengganti kata sandi !!!');
      expect(data['token'],
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY");
    });

    test('userGantiPassword response gagal', () async {
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
      when(mockClient.put(
        Uri.parse('$baseUrl/users/password'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
        body: jsonEncode(<String, String>{
          'passwordLama': 'irvan1235',
          'passwordBaru': 'irvan1234',
        }),
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "Username dan Password salah !!!"}',
          404));

      // aksi (act)
      final data = await apiMock.userGantiPassword('irvan1235', 'irvan1234');
      expect(data['timestamp'], '2024-08-09T06:32:48.701Z');
      expect(data['status'], 0);
      expect(data['message'], 'Username dan Password salah !!!');
    });

    test('userGantiPassword response gagal selain 200 dan 404', () async {
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
      when(mockClient.put(
        Uri.parse('$baseUrl/users/password'),
        headers: {
          'mobile-app': 'mobile-application',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
          'mobile-credential':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY',
        },
        body: jsonEncode(<String, String>{
          'passwordLama': 'irvan1234',
          'passwordBaru': 'irvan123',
        }),
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 0, "message": "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!"}',
          500));

      // aksi (act)
      final data = await apiMock.userGantiPassword('irvan1234', 'irvan123');
      expect(data['timestamp'], '2024-08-09T06:32:48.701Z');
      expect(data['status'], 0);
      expect(data['message'],
          'SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!');
    });
  });
}

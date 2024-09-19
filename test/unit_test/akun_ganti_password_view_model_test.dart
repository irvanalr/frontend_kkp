import 'dart:convert';

import 'package:febankflutter/api/api_mock.dart';
import 'package:febankflutter/viewmodels/akun_ganti_password_view_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
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
  final logger = Logger();

  group('AkunGantiPassword method updateKataSandiLama', () {
    test('kataSandiLama', () {
      logger.i('Menjalankan kataSandiLama');

      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      logger.i('Berhasil membuat instance akunGantiPasswordViewModel');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.kataSandiLama, '');
      logger.i('Seharusnya variabel kataSandiLama berisikan : ${akunGantiPasswordViewModel.kataSandiLama}');

      // aksi (act)
      akunGantiPasswordViewModel.updateKataSandiLama('abc');
      logger.i('Berhasil menjalankan function updateKataSandiLama dengan parameter abc');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.kataSandiLama, 'abc');
      logger.i('Seharusnya variabel kataSandiLama berisikan : ${akunGantiPasswordViewModel.kataSandiLama}');
    });
  });

  group('AkunGantiPassword method updateKataSandiBaru', () {
    test('kataSandiBaru', () {
      logger.i('Menjalankan kataSandiBaru');

      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      logger.i('Berhasil membuat instance akunGantiPasswordViewModel');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.kataSandiBaru, '');
      logger.i('Seharusnya variabel kataSandiBaru berisikan : ${akunGantiPasswordViewModel.kataSandiBaru}');

      // aksi (act)
      akunGantiPasswordViewModel.updateKataSandiBaru('cde');
      logger.i('Berhasil menjalankan function updateKataSandiBaru');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.kataSandiBaru, 'cde');
      logger.i('Seharusnya variabel kataSandiBaru berisikan : ${akunGantiPasswordViewModel.kataSandiBaru}');

    });
  });

  group('AkunGantiPassword method updateKonfirmasiKataSandiBaru', () {
    test('KonfirmasiKataSandiBaru', () {
      logger.i('Menjalankan KonfirmasiKataSandiBaru');

      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      logger.i('Berhasil membuat instance akunGantiPasswordViewModel');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.konfirmasiKataSandiBaru, '');
      logger.i('Seharusnya konfirmasiKataSandiBaru berisikan : ${akunGantiPasswordViewModel.konfirmasiKataSandiBaru}');

      // aksi (act)
      akunGantiPasswordViewModel.updateKonfirmasiKataSandiBaru('aaas');
      logger.i('Berhasil menjalankan function updateKonfirmasiKataSandiBaru');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.konfirmasiKataSandiBaru, 'aaas');
      logger.i('Berhasil memverifikasi konfirmasiKataSandiBaru berisikan aaas');
    });
  });

  group('AkunGantiPassword method updateToggleButtonKataSandiLamaVisibility', () {
    test('toggleButtonKataSandiLamaVisibility', () {
      logger.i('Menjalankan toggleButtonKataSandiLamaVisibility');

      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      logger.i('Berhasil membuat instance akunGantiPasswordViewModel');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.toggleButtonKataSandiLamaVisibility, false);
      logger.i('Seharusnya toggleButtonKataSandiLama bernilai : ${akunGantiPasswordViewModel.toggleButtonKataSandiLamaVisibility}');

      // aksi (act)
      akunGantiPasswordViewModel.updateToggleButtonKataSandiLamaVisibility();
      logger.i('Berhasil menjalankan function updateToggleButtonKataSandiLamaVisibility');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.toggleButtonKataSandiLamaVisibility, true);
      logger.i('Seharusnya toggleButtonKataSandiLama bernilai : ${akunGantiPasswordViewModel.toggleButtonKataSandiLamaVisibility}');
    });
  });

  group('AkunGantiPassword method updateToggleButtonKataSandiBaruVisibility', () {
    test('toggleButtonKataSandiBaruVisibility', () {
      logger.i('Menjalankan toggleButtonKataSandiBaruVisibility');

      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      logger.i('Berhasil membuat akunGantiPasswordViewModel');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.toggleButtonKataSandiBaruVisibility, false);
      logger.i('Seharusnya toggleButtonKataSandiBaruVisibility berisikan : ${akunGantiPasswordViewModel.toggleButtonKataSandiBaruVisibility}');

      // aksi (act)
      akunGantiPasswordViewModel.updateToggleButtonKataSandiBaruVisibility();
      logger.i('Berhasil menjalankan function updateToggleButtonKataSandiBaruVisibility');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.toggleButtonKataSandiBaruVisibility, true);
      logger.i('Seharusnya toggleButtonKataSandiBaruVisibility berisikan : ${akunGantiPasswordViewModel.toggleButtonKataSandiBaruVisibility}');

    });
  });

  group('AkunGantiPassword method updateToggleButtonKonfirmasiKataSandiBaruVisibility', () {
    test('toggleButtonKonfirmasiKataSandiBaruVisibility', () {
      logger.i('Menjalankan toggleButtonKonfirmasiKataSandiBaruVisibility');

      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      logger.i('Berhasil membuat instance akunGantiPasswordViewModel');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.toggleButtonKonfirmasiKataSandiBaruVisibility, false);
      logger.i('Seharusnya toggleButtonKonfirmasiKataSandiBaruVisibility berisikan : ${akunGantiPasswordViewModel.toggleButtonKonfirmasiKataSandiBaruVisibility}');

      // aksi (act)
      akunGantiPasswordViewModel.updateToggleButtonKonfirmasiKataSandiBaruVisibility();
      logger.i('Berhasil menjalankan function updateToggleButtonKonfirmasiKataSandiBaruVisibility');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.toggleButtonKonfirmasiKataSandiBaruVisibility, true);
      logger.i('Seharusnya toggleButtonKonfirmasiKataSandiBaruVisibility berisikan : ${akunGantiPasswordViewModel.toggleButtonKonfirmasiKataSandiBaruVisibility}');

    });
  });

  group('AkunGantiPassword method updateButtonStatus', () {
    test('isButtonEnabled', () {
      logger.i('Menjalankan isButtonEnabled');

      // atur (arrange)
      final akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
      logger.i('Berhasil membuat instance akunGantiPasswordViewModel');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.akunGantiPasswordModel.isButtonEnabled, false);
      logger.i('Seharusnya isButtonEnabled berisikan : ${akunGantiPasswordViewModel.akunGantiPasswordModel.isButtonEnabled}');

      // aksi (act)
      akunGantiPasswordViewModel.updateKataSandiLama('abc');
      logger.i('Berhasil menjalankan function updateKataSandiLama dengan parameter abc');
      akunGantiPasswordViewModel.updateKataSandiBaru('abc');
      logger.i('Berhasil menjalankan function updateKataSandiBaru dengan parameter abc');
      akunGantiPasswordViewModel.updateKonfirmasiKataSandiBaru('abc');
      logger.i('Berhasil menajalankan function updateKonfirmasiKataSandiBaru dengan parameter abc');

      // tegaskan (assert)
      expect(akunGantiPasswordViewModel.akunGantiPasswordModel.isButtonEnabled, true);
      logger.i('Seharusnya isButtonEnabled berisikan : ${akunGantiPasswordViewModel.akunGantiPasswordModel.isButtonEnabled}');

    });
  });

  group('showChangePasswordNotification', () {
    // atur (arrange)
    final MockFlutterLocalNotificationsPlugin mockNotifications = MockFlutterLocalNotificationsPlugin();

    test('notifikasi ganti password', () async {
      logger.i('Menjalankan notifikasi ganti password');

      // atur (arrange)
      var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'Cordova Notifikasi Login',
        'Cordova Mobile Login',
      );
      logger.i('Berhasil membuat instance androidPlatformChannelSpecifics dengan channelId : ${androidPlatformChannelSpecifics.channelId}');
      logger.i('Berhasil membuat instance androidPlatformChannelSpecifics dengan channelName : ${androidPlatformChannelSpecifics.channelName}');

      var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
      logger.i('Berhasil membuat instance iOSPlatformChannelSpecifics');

      var platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: iOSPlatformChannelSpecifics
      );
      logger.i('Berhasil membuat instance platformChannelSpecifics dengan Android : ${platformChannelSpecifics.android}');
      logger.i('Berhasil membuat instance platformChannelSpecifics dengan IOS : ${platformChannelSpecifics.iOS}');

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
      logger.i('Berhasil menjalankan mock notifications');

      // tegaskan (assert)
      verify(mockNotifications.show(
              0,
              'PERHATIAN !!!',
              'PASSWORD ANDA DI GANTI !!, PADA JAM 20.00 DAN TANGGAL 20-2-2024',
              platformChannelSpecifics))
          .called(1);
      logger.i('Berhasil memverifikasi bahwa notifikasi di panggil 1 kali');

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
      logger.i('Menjalankan userGantiPassword response berhasil');

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
      logger.i('Berhasil menjalanakan mock getApiKey');

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
      logger.i('Berhasil menjalankan mock userLogin');

      // atur (arrange) userLogout
      when(mockClient.put(
        Uri.parse('$baseUrl/users/password/irvan'),
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
      logger.i('Berhasil menjalankan mock userGantiPassword');

      // aksi (act)
      final data = await apiMock.userGantiPassword('irvan123', 'irvan1234', 'irvan');
      logger.i('Berhasil menyimpan kembalian userGantiPassword ke dalam data');
      logger.i(data);

      // tegaskan (assert)
      expect(data['timestamp'], '2024-08-09T06:32:48.701Z');
      expect(data['status'], 1);
      expect(data['message'], 'Berhasil mengganti kata sandi !!!');
      expect(data['token'], "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY");
      logger.i('Berhasil memverifikasi data ');
    });

    test('userGantiPassword response gagal', () async {
      logger.i('Menjalankan userGantiPassword response gagal');

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
        body: jsonEncode({'username': 'irvan', 'password': 'irvan123'}),
      )).thenAnswer((_) async => http.Response(
          '{"timestamp": "2024-08-09T06:32:48.701Z", "status": 1, "message": "Login berhasil", "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbkxvZ2luIjoiYVhKMllXND0iLCJpYXQiOjE3MjMxOTA4MDEsImV4cCI6MTcyMzc5NTYwMX0.cOOAq8Wuw2l7iFsfLcoGpM5uDqjQVnK-NPR7Mn2lNxY"}',
          200));
      logger.i('Berhasil menjalankan mock userLogin');

      // atur (arrange) userLogout
      when(mockClient.put(
        Uri.parse('$baseUrl/users/password/irvan'),
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
      logger.i('Berhasil menjalankan mock userGantiPassword');

      // aksi (act)
      final data = await apiMock.userGantiPassword('irvan1235', 'irvan1234', 'irvan');
      logger.i('Berhasil mendapatkan kembalian userGantiPassword ke variabel data');

      expect(data['timestamp'], '2024-08-09T06:32:48.701Z');
      expect(data['status'], 0);
      expect(data['message'], 'Username dan Password salah !!!');
      logger.i('Berhasil memverifikasi data');

    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mockito/mockito.dart';

// Define the Mock class with overridden methods
class MockLocalAuth extends Mock implements LocalAuthentication {
  @override
  Future<bool> get canCheckBiometrics => super.noSuchMethod(
    Invocation.getter(#canCheckBiometrics),
    returnValue: Future.value(true),
  );

  @override
  Future<List<BiometricType>> getAvailableBiometrics() => super.noSuchMethod(
    Invocation.method(#getAvailableBiometrics, []),
    returnValue: Future.value([
      BiometricType.fingerprint,
      BiometricType.face,
    ]),
  );

  @override
  Future<bool> isDeviceSupported() => super.noSuchMethod(
    Invocation.method(#isDeviceSupported, []),
    returnValue: Future.value(true),
  );

  @override
  Future<bool> stopAuthentication() => super.noSuchMethod(
    Invocation.method(#stopAuthentication, []),
    returnValue: Future.value(true),
  );
}

void main() {
  group('LocalAuthentication', () {
    late MockLocalAuth mockLocalAuth;

    setUp(() {
      mockLocalAuth = MockLocalAuth();
    });

    test('canCheckBiometrics mengembalikan nilai true', () async {
      // Arrange
      when(mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => true);

      // Act
      final result = await mockLocalAuth.canCheckBiometrics;

      // Assert
      expect(result, isTrue);
    });

    test('getAvailableBiometrics mengembalikan biometrik yang tersedia', () async {
      // Arrange
      when(mockLocalAuth.getAvailableBiometrics()).thenAnswer((_) async => [
        BiometricType.fingerprint,
        BiometricType.face,
      ]);

      // Act
      final result = await mockLocalAuth.getAvailableBiometrics();

      // Assert
      expect(result, contains(BiometricType.fingerprint));
      expect(result, contains(BiometricType.face));
    });

    test('isDeviceSupported mengembalikan nilai true', () async {
      // Arrange
      when(mockLocalAuth.isDeviceSupported()).thenAnswer((_) async => true);

      // Act
      final result = await mockLocalAuth.isDeviceSupported();

      // Assert
      expect(result, isTrue);
    });

    test('stopAuthentication mengembalikan nilai true', () async {
      // Arrange
      when(mockLocalAuth.stopAuthentication()).thenAnswer((_) async => true);

      // Act
      final result = await mockLocalAuth.stopAuthentication();

      // Assert
      expect(result, isTrue);
    });
  });
}
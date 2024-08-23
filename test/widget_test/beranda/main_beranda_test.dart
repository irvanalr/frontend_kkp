// import 'package:febankflutter/ui/beranda/beranda.dart';
// import 'package:febankflutter/ui/beranda/card_informasi_mutasi/card_main_rekening_utama.dart';
// import 'package:febankflutter/ui/beranda/card_layanan/card_main_layanan.dart';
// import 'package:febankflutter/ui/beranda/carousel_beranda/carousel_beranda.dart';
// import 'package:febankflutter/utils/routes/route.dart';
// import 'package:febankflutter/utils/routes/route_paths.dart';
// import 'package:febankflutter/viewmodels/beranda_view_model.dart';
// import 'package:febankflutter/viewmodels/login_view_model.dart';
// import 'package:febankflutter/ui/navigation_bottom/navigation_bottom.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:logger/logger.dart';
//
// void main() async {
//   final logger = Logger();
//   TestWidgetsFlutterBinding.ensureInitialized();
//   await dotenv.load(fileName: '.env');
//
//   // Mock data for testing
//   final berandaViewModel = BerandaViewModel(
//     notifyListeners: () {},
//   );
//   final loginViewModel = LoginViewModel();
//   final navigationController = NavigationController();
//
//   testWidgets('Main beranda widget test', (WidgetTester tester) async {
//     // Build the widget
//     await tester.pumpWidget(
//       MaterialApp(
//         home: Material(
//           child: Beranda(
//             berandaViewModel: berandaViewModel,
//             loginViewModel: loginViewModel,
//             navigationController: navigationController,
//           ),
//         ),
//         initialRoute: RoutePaths.root,
//         onGenerateRoute: RouteGenerator.generateRoute,
//       ),
//     );
//
//     // Menunggu Future builder Login selesai (1500 ms)
//     await tester.pump(const Duration(milliseconds: 1500));
//     logger.w('test selesai di beranda, Silahkan lanjutkan membaca terminal !!!');
//     logger.i('Render Future Builder sudah di lakukan');
//     await tester.pumpAndSettle();
//
//     // Menemukan Beranda
//     expect(find.byType(Beranda), findsOneWidget);
//     logger.i('Menemukan Beranda');
//
//     // Menemukan String Assalamualaikum
//     expect(find.text('Assalamualaikum'), findsOneWidget);
//     logger.i('Menemukan string assalamualaikum');
//
//     // Menemukan CardInformasiMutasi
//     expect(find.byType(CardInformasiMutasi), findsOneWidget);
//     logger.i('Menemukan widget CardInformasiMutasi');
//
//     // Menemukan No.Rekening utama
//     expect(find.text('No.Rekening utama'), findsOneWidget);
//     logger.i('Menemukan String No.Rekening Utama');
//
//     // Menemukan TABUNGAN SIMPATI
//     expect(find.text('Mutasi Selengkapnya'), findsOneWidget);
//     logger.i('Mutasi Selengkapnya');
//
//     // Menekan String Mutasi Selengkapnya
//     await tester.tap(find.text('Mutasi Selengkapnya'));
//     logger.i('Berhasil menekan Text Mutasi Selengkapnya');
//
//     // Menemukan widget CarouselBeranda
//     expect(find.byType(CarouselBeranda), findsOneWidget);
//     logger.i('Menemukan widget CarouselBeranda');
//
//     // Menemukan widget CardLayanan
//     expect(find.byType(CardLayanan), findsOneWidget);
//     logger.i('Menemukan widget CardLayanan');
//
//     // Menemukan String Selengkapnya
//     expect(find.text('Selengkapnya'), findsOneWidget);
//     logger.i('Menemukan String Selengkapnya');
//
//     // Mentap String Selengkapnya
//     await tester.tap(find.text('Selengkapnya'));
//     logger.i('Mentap String Selengkapnya');
//
//     logger.w('Test selesai di beranda.');
//   });
// }

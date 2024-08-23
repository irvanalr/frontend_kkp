import 'package:febankflutter/ui/beranda/card_rekening_utama/card_main_rekening_utama.dart';
import 'package:febankflutter/viewmodels/beranda_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void main() async {
  final logger = Logger();
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  final BerandaViewModel berandaViewModel = BerandaViewModel(
    notifyListeners: (){},
  );

  testWidgets('CardInformasiMutasi widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: CardRekeningUtama(viewModel: berandaViewModel),
      ),
    ));

    // Menunggu Future builder Login selesai (1500 ms)
    await tester.pump(const Duration(milliseconds: 1500));
    logger.w('test selesai di beranda, Silahkan lanjutkan membaca terminal !!!');
    logger.i('Render Future Builder sudah di lakukan');
    await tester.pumpAndSettle();

    // Menemukan widget CardInformasiMutasi
    expect(find.byType(CardRekeningUtama), findsOneWidget);
    logger.i('Menemukan widget CardInformasiMutasi');

    // Menemukan widget Column pertama
    final firstColumnFinder = find.descendant(
      of: find.byType(CardRekeningUtama),
      matching: find.byType(Column),
    ).first;
    expect(firstColumnFinder, findsOneWidget);
    logger.i('Menemukan widget Column pertama');

    // Memeriksa kontent dalam Column pertama
    expect(find.descendant(of: firstColumnFinder, matching: find.byType(Container)), findsNWidgets(2));
    logger.i('Menemukan 2 buah Container dalam Column pertama');

    // Menemukan widget Container pertama di dalam Column

  });
}

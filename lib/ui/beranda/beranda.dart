import 'package:febankflutter/models/api_key_model.dart';
import 'package:febankflutter/models/login_model.dart';
import 'package:febankflutter/ui/beranda/card_rekening_utama/card_main_rekening_utama.dart';
import 'package:febankflutter/utils/shimmer/beranda/shimmer_beranda.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/ui/beranda/card_layanan/card_main_layanan.dart';
import 'package:febankflutter/ui/beranda/carousel_beranda/carousel_beranda.dart';
import 'package:febankflutter/ui/navigation_bottom/navigation_bottom.dart';
import 'package:febankflutter/utils/responsive/beranda/responsive_beranda.dart';
import 'package:febankflutter/viewmodels/beranda_view_model.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:febankflutter/viewmodels/rekening_card_simpanan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class Beranda extends StatefulWidget {
  final NavigationController navigationController;
  const Beranda({
    super.key,
    required this.navigationController,
  });

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  late final BerandaViewModel berandaViewModel;
  late final LoginViewModel loginViewModel;
  final logger = Logger();
  final ApiKeyModel apiKeyModel = ApiKeyModel();
  final LoginModel loginModel = LoginModel();
  final RekeningCardSimpananViewModel rekeningCardSimpananViewModel = RekeningCardSimpananViewModel(notifyListeners: (){});

  Future<void> _refreshData() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1500), () => berandaViewModel.berandaCardInformasiRekeningUtama());
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // rekeningCardSimpananViewModel.listTabungan();
    loginViewModel = LoginViewModel();
    loginViewModel.getValue('CordovaMN', 'name')
        .then((name) {
      setState(() {
        berandaViewModel.berandaModel.name = name;
      });
    });
    berandaViewModel = BerandaViewModel(notifyListeners: (){});
  }

  // Future<void> fakeApi() async {
  //   await Future.delayed(const Duration(milliseconds: 1500));
  //   logger.i('Data sudah di-load');
  // }

  @override
  Widget build(BuildContext context) {
    // Status bar dan navigation bar warna
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: LightAndDarkMode.primaryColor(context),
      systemNavigationBarColor: LightAndDarkMode.bottomNavBar(context),
    ));
    ResponsiveBeranda.init(context);

    return FutureBuilder(
      future: _refreshData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShimmerBeranda();
        } else if (snapshot.hasError) {
          return buildScaffold(context);
        } else {
          return buildScaffold(context);
        }
      },
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      key: const Key('beranda'),
      appBar: AppBar(
        backgroundColor: LightAndDarkMode.primaryColor(context),
        leading: Image.asset(
          'assets/png/bmtdigi.png',
          scale: 12,
        ),
        title: GestureDetector(
          onTap: () {
            widget.navigationController.selectedIndex.value = 3;
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.berandaAssalamualaikum,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: ResponsiveBeranda.berandaTittleFontSize,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  berandaViewModel.berandaModel.name,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ResponsiveBeranda.berandaNamaPenggunaFontSize,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CardRekeningUtama(
                    viewModel: berandaViewModel,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CarouselBeranda(viewModel: berandaViewModel),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CardLayanan(
                    berandaViewModel: berandaViewModel,
                    loginViewModel: loginViewModel,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

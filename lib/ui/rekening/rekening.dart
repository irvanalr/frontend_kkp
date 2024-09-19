import 'package:febankflutter/ui/rekening/pembiayaan/card_pembiayaan.dart';
import 'package:febankflutter/ui/rekening/simpanan_berjangka/card_simpanan_berjangka.dart';
import 'package:febankflutter/utils/shimmer/rekening/shimmer_rekenig.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/ui/rekening/simpanan/card_simpanan.dart';
import 'package:febankflutter/ui/navigation_bottom/navigation_bottom.dart';
import 'package:febankflutter/utils/responsive/rekening/responsive_rekening.dart';
import 'package:febankflutter/viewmodels/rekening_card_pembiayaan_view_model.dart';
import 'package:febankflutter/viewmodels/rekening_card_simpanan_berjangka_view_model.dart';
import 'package:febankflutter/viewmodels/rekening_card_simpanan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class Rekening extends StatefulWidget {
  final NavigationController navigationController;
  const Rekening({
    super.key,
    required this.navigationController
  });

  @override
  State<Rekening> createState() => _RekeningState();
}

class _RekeningState extends State<Rekening> {
  late final RekeningCardSimpananViewModel rekeningCardSimpananViewModel;
  late final RekeningCardSimpananBerjangkaViewModel rekeningCardSimpananBerjangkaViewModel;
  late final RekeningCardPembiayaanViewModel rekeningCardPembiayaanViewModel;
  var logger = Logger();

  @override
  void initState() {
    super.initState();
    rekeningCardSimpananViewModel = RekeningCardSimpananViewModel(notifyListeners: (){});
    rekeningCardSimpananBerjangkaViewModel = RekeningCardSimpananBerjangkaViewModel(notifyListeners: (){});
    rekeningCardPembiayaanViewModel = RekeningCardPembiayaanViewModel(notifyListeners: (){});
  }

  @override
  void dispose() {
    rekeningCardSimpananViewModel.rekeningCardSimpananModel.savings = [];
    rekeningCardSimpananBerjangkaViewModel.rekeningCardSimpananBerjangkaModel.deposits = [];
    rekeningCardPembiayaanViewModel.rekeningCardPembiayaanModel.loans = [];
    super.dispose();
  }

  Future<void> fakeApi() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    logger.i('Data sudah di-load');
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveRekening.init(context);
    /// Status bar dan navigation bar warna
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: LightAndDarkMode.primaryColor(context),
      systemNavigationBarColor: LightAndDarkMode.bottomNavBar(context),
    ));
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [LightAndDarkMode.primaryColor(context), LightAndDarkMode.cardColor6(context)],
                  stops: const [0.6, 0.4],
                ),
              ),
            ),
            title: Text(
              Strings.rekeningTitle,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: ResponsiveRekening.rekeningStringTitleFontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                  ResponsiveRekening.rekeningPreferedSizeHeight
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: ResponsiveRekening.rekeningContainerTabBarWidth,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    color: LightAndDarkMode.primaryColor(context),
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: const BoxDecoration(
                      color: Color(0xFFDBDBDB),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    labelColor: const Color(0xFF1B3E5F),
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      Text(
                        key: const Key('Simpanan'),
                        Strings.rekeningKeuanganSimpanan,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: ResponsiveRekening.rekeningStringSimpananFontSize,
                              fontWeight: FontWeight.w500,
                            )
                        ),
                      ),
                      Text(
                        key: const Key('Simpanan Berjangka'),
                        Strings.rekeningKeuanganSimpananBerjangka,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: ResponsiveRekening.rekeningStringSimpananBerjangkaFontSize,
                              fontWeight: FontWeight.w500,
                            )
                        ),
                      ),
                      Text(
                        key: const Key('Pembiayaan'),
                        Strings.rekeningKeuanganPembiayaan,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: ResponsiveRekening.rekeningStringPembayaranFontSize,
                              fontWeight: FontWeight.w500,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  try {
                    await Future.delayed(const Duration(milliseconds: 1500), () => rekeningCardSimpananViewModel.listTabunganSimpanan());
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: 'Maaf server kami sedang dalam kendala, mohon tutup applikasi anda dan coba lagi di lain waktu!!!',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.red
                    );
                  }
                },
                child: FutureBuilder(
                    future: Future.delayed(const Duration(milliseconds: 1500), () => rekeningCardSimpananViewModel.listTabunganSimpanan()),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: ShimmerRekening(),
                        );
                      } else if(snapshot.hasError) {
                        return CardSimpanan(rekeningCardSimpananViewModel:  rekeningCardSimpananViewModel);
                      } else {
                        return CardSimpanan(rekeningCardSimpananViewModel:  rekeningCardSimpananViewModel);
                      }
                    }
                ),
              ),
              RefreshIndicator(
                onRefresh: () async {
                  try {
                    await Future.delayed(const Duration(milliseconds: 1500), () => rekeningCardSimpananBerjangkaViewModel.rekeningDeposito());
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: 'Maaf server kami sedang dalam kendala, mohon tutup applikasi anda dan coba lagi di lain waktu!!!',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.red
                    );
                  }
                },
                child: FutureBuilder(
                    future: Future.delayed(const Duration(milliseconds: 1500), () => rekeningCardSimpananBerjangkaViewModel.rekeningDeposito()),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: ShimmerRekening(),
                        );
                      } else if(snapshot.hasError) {
                        return CardSimpananBerjangka(rekeningCardSimpananBerjangkaViewModel:  rekeningCardSimpananBerjangkaViewModel);
                      } else {
                        return CardSimpananBerjangka(rekeningCardSimpananBerjangkaViewModel:  rekeningCardSimpananBerjangkaViewModel);
                      }
                    }
                ),
              ),
              RefreshIndicator(
                onRefresh: () async {
                  try {
                    await Future.delayed(const Duration(milliseconds: 1500), () => rekeningCardPembiayaanViewModel.rekeningPembiayaan());
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: 'Maaf server kami sedang dalam kendala, mohon tutup applikasi anda dan coba lagi di lain waktu!!!',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.red
                    );
                  }
                },
                child: FutureBuilder(
                    future: Future.delayed(const Duration(milliseconds: 1500), () => rekeningCardPembiayaanViewModel.rekeningPembiayaan()),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: ShimmerRekening(),
                        );
                      } else if(snapshot.hasError) {
                        return CardPembiayaan(rekeningCardPembiayaanViewModel: rekeningCardPembiayaanViewModel);
                      } else {
                        return CardPembiayaan(rekeningCardPembiayaanViewModel: rekeningCardPembiayaanViewModel);
                      }
                    }
                ),
              ),
            ],
          ),
        ),
    );
  }
}

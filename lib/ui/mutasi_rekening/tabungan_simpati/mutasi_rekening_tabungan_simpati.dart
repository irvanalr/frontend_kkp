import 'package:febankflutter/ui/mutasi_rekening/tabungan_simpati/card_mutasi_rekening_tabungan_simpati/card_mutasi_transaksi_rekening_tabungan_simpati.dart';
import 'package:febankflutter/utils/responsive/mutasi_rekening/responsive_mutasi_rekening_tabungan_simpati.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/shimmer/mutasi/shimmer_mutasi.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/mutasi_rekening_tabungan_simpati_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class MutasiRekeningTabunganSimpati extends StatefulWidget {
  const MutasiRekeningTabunganSimpati({super.key});

  @override
  State<MutasiRekeningTabunganSimpati> createState() => _MutasiRekeningTabunganSimpatiState();
}

class _MutasiRekeningTabunganSimpatiState extends State<MutasiRekeningTabunganSimpati> {
  late final MutasiRekeningTabunganSimpatiViewModel mutasiRekeningTabunganSimpatiViewModel;
  var logger = Logger();

  @override
  void initState() {
    super.initState();
    mutasiRekeningTabunganSimpatiViewModel = MutasiRekeningTabunganSimpatiViewModel(
        notifyListeners: () {
          setState(() {});
        }
    );
  }

  // Future<void> fakeApi() async {
  //   await Future.delayed(const Duration(milliseconds: 1500));
  //   logger.i('Data sudah di-load');
  // }

  @override
  Widget build(BuildContext context) {
    ResponsiveMutasiRekeningTabunganSimpati.init(context);
    return PopScope<Object?>(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (!didPop) {
            Navigator.pushReplacementNamed(
              context,
              RoutePaths.navigationBarCustome,
            );
          }
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: LightAndDarkMode.primaryColor(context),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context,
                        RoutePaths.navigationBarCustome,
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 21,
                  )),
              title: Text(
                Strings.rekeningMutasiTabunganSimpatiTitle,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: ResponsiveMutasiRekeningTabunganSimpati.mutasiRekeningTabunganSimpatiTitleFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
              centerTitle: true,
            ),
            body: FutureBuilder(
                future: Future.delayed(
                    const Duration(milliseconds: 1500),() => mutasiRekeningTabunganSimpatiViewModel.getFutureForTransaksi()
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: ShimmerMutasi());
                  } else if (snapshot.hasError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Fluttertoast.showToast(
                        msg:
                        "Maaf server kami sedang dalam kendala, mohon tutup aplikasi anda dan coba lagi di lain waktu!!!",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    });
                    return RefreshIndicator(
                      onRefresh: () async {
                        await mutasiRekeningTabunganSimpatiViewModel.getFutureForTransaksi();
                        setState(() {});
                      },
                      child: Center(
                        child: SizedBox(
                          width: ResponsiveMutasiRekeningTabunganSimpati.mutasiRekeningTabunganSimpatiSizedBoxCardTransaksiWidth,
                          child: CardMutasiTransaksiRekeningTabunganSimpati(
                            mutasiRekeningTabunganSimpatiViewModel: mutasiRekeningTabunganSimpatiViewModel,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Stack(
                      children: [
                        RefreshIndicator(
                          onRefresh: () async {
                            try {
                              await mutasiRekeningTabunganSimpatiViewModel.getFutureForTransaksi();
                              setState(() {});
                            } catch(_) {
                              Fluttertoast.showToast(
                                  msg:"Maaf server sedang dalam perbaikan, silahkan coba kembali refresh di lain waktu",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                          },
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, right: 10),
                                      child: Container(
                                        width: ResponsiveMutasiRekeningTabunganSimpati.mutasiRekeningTabunganSimpatiContainerPertamaWidth,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: LightAndDarkMode.teksRead2(context)),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, RoutePaths.mutasiRekeningTabunganSimpatiRentangWaktu, arguments: mutasiRekeningTabunganSimpatiViewModel);
                                            },
                                            child: Column(
                                              children: [
                                                Text(
                                                  mutasiRekeningTabunganSimpatiViewModel.mutasiRekeningTabunganSimpatiModel.transaksi,
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w600,
                                                        color: LightAndDarkMode.teksRead2(context),
                                                      )
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            )
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        width: ResponsiveMutasiRekeningTabunganSimpati.mutasiRekeningTabunganSimpatiContainerKeduaWidth,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: LightAndDarkMode.teksRead2(context)),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, RoutePaths.mutasiRekeningTabunganSimpatiRekening, arguments: mutasiRekeningTabunganSimpatiViewModel);
                                            },
                                            child: Column(
                                              children: [
                                                Text(
                                                    Strings.rekeningMutasiTabunganSimpatiTitle.replaceFirst('Mutasi ', ''),
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,
                                                          color: LightAndDarkMode.teksRead2(context),
                                                        )
                                                    )
                                                ),
                                                Text(
                                                    mutasiRekeningTabunganSimpatiViewModel.mutasiRekeningTabunganSimpatiModel.code,
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,
                                                          color: LightAndDarkMode.teksRead2(context),
                                                        )
                                                    )
                                                ),
                                              ],
                                            )
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      CardMutasiTransaksiRekeningTabunganSimpati(
                                        mutasiRekeningTabunganSimpatiViewModel:
                                        mutasiRekeningTabunganSimpatiViewModel,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }
            )
        )
    );
  }
}
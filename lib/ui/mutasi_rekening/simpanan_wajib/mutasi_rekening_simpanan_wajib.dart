import 'package:febankflutter/ui/mutasi_rekening/simpanan_wajib/card_mutasi_rekening_simpanan_wajib/card_mutasi_transaksi_rekening_simpanan_wajib.dart';
import 'package:febankflutter/utils/responsive/mutasi_rekening/responsive_mutasi_rekening_simpanan_wajib.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/shimmer/mutasi/shimmer_mutasi.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/mutasi_rekening_simpanan_wajib_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class MutasiRekeningSimpananWajib extends StatefulWidget {
  const MutasiRekeningSimpananWajib({super.key});

  @override
  State<MutasiRekeningSimpananWajib> createState() => _MutasiRekeningSimpananWajibState();
}

class _MutasiRekeningSimpananWajibState extends State<MutasiRekeningSimpananWajib> {
  late final MutasiRekeningSimpananWajibViewModel mutasiRekeningSimpananWajibViewModel;
  var logger = Logger();

  @override
  void initState() {
    super.initState();
    mutasiRekeningSimpananWajibViewModel = MutasiRekeningSimpananWajibViewModel(
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
    ResponsiveMutasiRekeningSimpananWajib.init(context);
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
                Strings.rekeningMutasiSimpananWajibTitle,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: ResponsiveMutasiRekeningSimpananWajib.mutasiRekeningSimpananWajibTitleFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
              centerTitle: true,
            ),
            body: FutureBuilder(
                future:  Future.delayed(
                    const Duration(milliseconds: 1500),() => mutasiRekeningSimpananWajibViewModel.getFutureForTransaksi()
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
                        await mutasiRekeningSimpananWajibViewModel.getFutureForTransaksi();
                        setState(() {});
                      },
                      child: Center(
                        child: SizedBox(
                          width: ResponsiveMutasiRekeningSimpananWajib.mutasiRekeningSimpananWajibSizedBoxCardTransaksiWidth,
                          child: CardMutasiTransaksiRekeningSimpananWajib(
                            mutasiRekeningSimpananWajibViewModel: mutasiRekeningSimpananWajibViewModel,
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
                              await mutasiRekeningSimpananWajibViewModel.getFutureForTransaksi();
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
                                        width: ResponsiveMutasiRekeningSimpananWajib.mutasiRekeningSimpananWajibContainerPertamaWidth,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: LightAndDarkMode.teksRead2(context)),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, RoutePaths.mutasiRekeningSimpananWajibRentangWaktu, arguments: mutasiRekeningSimpananWajibViewModel);
                                            },
                                            child: Column(
                                              children: [
                                                Text(
                                                  mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.transaksi,
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
                                        width: ResponsiveMutasiRekeningSimpananWajib.mutasiRekeningSimpananWajibContainerKeduaWidth,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: LightAndDarkMode.teksRead2(context)),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, RoutePaths.mutasiRekeningSimpananWajibRekening, arguments: mutasiRekeningSimpananWajibViewModel);
                                            },
                                            child: Column(
                                              children: [
                                                Text(
                                                    Strings.rekeningMutasiSimpananWajibTitle.replaceFirst('Mutasi ', ''),
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,
                                                          color: LightAndDarkMode.teksRead2(context),
                                                        )
                                                    )
                                                ),
                                                Text(
                                                    mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.code,
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
                                      CardMutasiTransaksiRekeningSimpananWajib(
                                        mutasiRekeningSimpananWajibViewModel:
                                        mutasiRekeningSimpananWajibViewModel,
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
import 'package:febankflutter/utils/responsive/rekening/responsive_card_simpanan_berjangka.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/rekening_card_simpanan_berjangka_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CardSimpananBerjangka extends StatefulWidget {
  final RekeningCardSimpananBerjangkaViewModel rekeningCardSimpananBerjangkaViewModel;
  const CardSimpananBerjangka({
    super.key,
    required this.rekeningCardSimpananBerjangkaViewModel
  });

  @override
  State<CardSimpananBerjangka> createState() => _CardSimpananBerjangkaState();
}

class _CardSimpananBerjangkaState extends State<CardSimpananBerjangka> {
  @override
  Widget build(BuildContext context) {
    ResponsiveCardSimpananBerjangka.init(context);
    if(
    widget.rekeningCardSimpananBerjangkaViewModel.rekeningCardSimpananBerjangkaModel.deposits == [] ||
        widget.rekeningCardSimpananBerjangkaViewModel.rekeningCardSimpananBerjangkaModel.deposits.isEmpty ||
          widget.rekeningCardSimpananBerjangkaViewModel.rekeningCardSimpananBerjangkaModel.deposits[0].productName == 'N/A'
    ) {
      return Center(
        child: Text(
          'Data rekening kosong !!!',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: LightAndDarkMode.teksRead2(context),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Column(
                children: widget.rekeningCardSimpananBerjangkaViewModel.rekeningCardSimpananBerjangkaModel.deposits.asMap().entries.map((entry) {
                  int index = entry.key;
                  var deposit = entry.value;
                  return Card(
                    elevation: 0.0,
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    child: Column(
                      children: [
                        Container(
                          width: ResponsiveCardSimpananBerjangka.cardSimpananBerjangkaContainerNoRekeningUtamaWidth,
                          decoration: BoxDecoration(
                            color: LightAndDarkMode.cardColor2(context),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10
                                ),
                                child: Text(
                                  '${deposit.code} (${deposit.bilyet})',
                                  style: GoogleFonts.poppins(textStyle: TextStyle(
                                      fontSize: ResponsiveCardSimpananBerjangka.cardSimpananBerjangkaNoRekeningNumFontSize,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white
                                  )
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10,
                                    bottom: 10
                                ),
                                child: Text(
                                  deposit.productName,
                                  style: GoogleFonts.poppins(textStyle: TextStyle(
                                      fontSize: ResponsiveCardSimpananBerjangka.cardSimpananBerjangkaHeader1FontSize,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white
                                  )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: ResponsiveCardSimpananBerjangka.cardSimpananBerjangkaContainerNilaiWidth,
                          decoration: BoxDecoration(
                            color: LightAndDarkMode.cardColor1(context),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10,
                                      top: 10
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        child: Text(
                                          'Nilai',
                                          style: GoogleFonts.poppins(textStyle:
                                          TextStyle(
                                              fontSize: ResponsiveCardSimpananBerjangka.cardSimpananBerjangkaStringNilaiFontSize,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                          )
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.6,
                                        child: Text(
                                          ': Rp ${widget.rekeningCardSimpananBerjangkaViewModel.formatValuetoRupiah(double.parse(deposit.value))}',
                                          style: GoogleFonts.poppins(textStyle:
                                          TextStyle(
                                              fontSize: ResponsiveCardSimpananBerjangka.cardSimpananBerjangkaStringNilaiFontSize,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                          )
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10,
                                      top: 5
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        child: Text(
                                          'Tanggal',
                                          style: GoogleFonts.poppins(textStyle:
                                          TextStyle(
                                              fontSize: ResponsiveCardSimpananBerjangka.cardSimpananBerjangkaStringTanggalFontSize,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                          )
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.6,
                                        child: Text(
                                          ': ${deposit.begin} / ${deposit.end}',
                                          style: GoogleFonts.poppins(textStyle:
                                          TextStyle(
                                              fontSize: ResponsiveCardSimpananBerjangka.cardSimpananBerjangkaStringTanggalFontSize,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                          )
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10,
                                      bottom: 5,
                                      top: 5
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        child: Text(
                                          'Status',
                                          style: GoogleFonts.poppins(textStyle:
                                          TextStyle(
                                              fontSize: ResponsiveCardSimpananBerjangka.cardSimpananBerjangkaStringStatusFontSize,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                          )
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.6,
                                        child: Text(
                                          deposit.aro == 1 ? ": ARO" : ": Tanpa ARO",
                                          style: GoogleFonts.poppins(textStyle:
                                          TextStyle(
                                              fontSize: ResponsiveCardSimpananBerjangka.cardSimpananBerjangkaStringStatusFontSize,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                          )
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5,
                                    bottom: 10,
                                    top: 10
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        switch (index) {
                                          case 0:
                                            Fluttertoast.showToast(
                                                msg: "Mutasi Simpanan berjangka masih dalam pengembangan",
                                                toastLength: Toast.LENGTH_LONG,
                                                gravity: ToastGravity.BOTTOM,
                                                backgroundColor: Colors.red
                                            );
                                            break;
                                          default:
                                            Fluttertoast.showToast(
                                                msg: "Opsi ini masih dalam pengembangan",
                                                toastLength: Toast.LENGTH_LONG,
                                                gravity: ToastGravity.BOTTOM,
                                                backgroundColor: Colors.red
                                            );
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            Strings.berandaMutasiSelengkapnya,
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: ResponsiveCardSimpananBerjangka.cardSimpananBerjangkaStringTransaksiSelengkapnyaFontSize,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white)),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: ResponsiveCardSimpananBerjangka.cardSimpananBerjangkaIconArrowForwardWidth,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      );
    }
  }
}

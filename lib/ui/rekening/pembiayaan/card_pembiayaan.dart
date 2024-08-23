import 'package:febankflutter/utils/responsive/rekening/responsive_card_pembiayaan.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/rekening_card_pembiayaan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPembiayaan extends StatefulWidget {
  final RekeningCardPembiayaanViewModel rekeningCardPembiayaanViewModel;
  const CardPembiayaan({
    super.key,
    required this.rekeningCardPembiayaanViewModel
  });

  @override
  State<CardPembiayaan> createState() => _CardPembiayaanState();
}

class _CardPembiayaanState extends State<CardPembiayaan> {
  @override
  Widget build(BuildContext context) {
    ResponsiveCardPembiayaan.init(context);
    return widget.rekeningCardPembiayaanViewModel.rekeningCardPembiayaanModel.loans.isEmpty
        ? Center(
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
      )
        : SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: Column(
              children: widget.rekeningCardPembiayaanViewModel.rekeningCardPembiayaanModel.loans.asMap().entries.map((entry) {
                int index = entry.key;
                var loans = entry.value;
                return Card(
                  elevation: 0.0,
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                        width: ResponsiveCardPembiayaan.cardPembiayaanContainerNoRekeningUtamaWidth,
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
                                loans.code,
                                style: GoogleFonts.poppins(textStyle: TextStyle(
                                    fontSize: ResponsiveCardPembiayaan.cardPembiayaanNoRekeningNumFontSize,
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
                                loans.productName,
                                style: GoogleFonts.poppins(textStyle: TextStyle(
                                    fontSize: ResponsiveCardPembiayaan.cardPembiayaanHeader1FontSize,
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
                        width: ResponsiveCardPembiayaan.cardPembiayaanContainerNilaiWidth,
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
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Text(
                                        'Pokok',
                                        style: GoogleFonts.poppins(textStyle:
                                        TextStyle(
                                            fontSize: ResponsiveCardPembiayaan.cardPembiayaanStringNilaiFontSize,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white
                                        )
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      child: Text(
                                        ': Rp ${widget.rekeningCardPembiayaanViewModel.formatValuetoRupiah(double.parse(loans.principal))}',
                                        style: GoogleFonts.poppins(textStyle:
                                        TextStyle(
                                            fontSize: ResponsiveCardPembiayaan.cardPembiayaanStringNilaiFontSize,
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
                                    top: 10
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Text(
                                        'Marjin',
                                        style: GoogleFonts.poppins(textStyle:
                                        TextStyle(
                                            fontSize: ResponsiveCardPembiayaan.cardPembiayaanStringNilaiFontSize,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white
                                        )
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      child: Text(
                                        ': Rp ${widget.rekeningCardPembiayaanViewModel.formatValuetoRupiah(double.parse(loans.margin))}',
                                        style: GoogleFonts.poppins(textStyle:
                                        TextStyle(
                                            fontSize: ResponsiveCardPembiayaan.cardPembiayaanStringNilaiFontSize,
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
                                    top: 10
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Text(
                                        'No Akad',
                                        style: GoogleFonts.poppins(textStyle:
                                        TextStyle(
                                            fontSize: ResponsiveCardPembiayaan.cardPembiayaanStringNilaiFontSize,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white
                                        )
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      child: Text(
                                        ': ${loans.contract}',
                                        style: GoogleFonts.poppins(textStyle:
                                        TextStyle(
                                            fontSize: ResponsiveCardPembiayaan.cardPembiayaanStringNilaiFontSize,
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
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child:                                     Text(
                                        'Tanggal Akad',
                                        style: GoogleFonts.poppins(textStyle:
                                        TextStyle(
                                            fontSize: ResponsiveCardPembiayaan.cardPembiayaanStringTanggalFontSize,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white
                                        )
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      child: Text(
                                        ': ${loans.contractDate}',
                                        style: GoogleFonts.poppins(textStyle:
                                        TextStyle(
                                            fontSize: ResponsiveCardPembiayaan.cardPembiayaanStringTanggalFontSize,
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
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Text(
                                        'Lama Pembiayaan ',
                                        style: GoogleFonts.poppins(textStyle:
                                        TextStyle(
                                            fontSize: ResponsiveCardPembiayaan.cardPembiayaanStringStatusFontSize,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white
                                        )
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      child: Text(
                                        ': ${loans.tenor} ${loans.tenorName}',
                                        style: GoogleFonts.poppins(textStyle:
                                        TextStyle(
                                            fontSize: ResponsiveCardPembiayaan.cardPembiayaanStringStatusFontSize,
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
                                              msg: "Mutasi Pembiayaan masih dalam pengembangan",
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.BOTTOM,
                                              backgroundColor: Colors.red
                                          );
                                          break;
                                        case 1:
                                          Fluttertoast.showToast(
                                              msg: "Mutasi Pembiayaan masih dalam pengembangan",
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
                                                  fontSize: ResponsiveCardPembiayaan.cardPembiayaanStringTransaksiSelengkapnyaFontSize,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white)),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: ResponsiveCardPembiayaan.cardPembiayaanIconArrowForwardWidth,
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

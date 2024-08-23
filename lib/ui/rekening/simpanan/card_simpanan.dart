import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/rekening/responsive_card_simpanan.dart';
import 'package:febankflutter/viewmodels/rekening_card_simpanan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CardSimpanan extends StatefulWidget {
  final RekeningCardSimpananViewModel rekeningCardSimpananViewModel;
  const CardSimpanan({
    super.key,
    required this.rekeningCardSimpananViewModel
  });

  @override
  State<CardSimpanan> createState() => _CardSimpananState();
}

class _CardSimpananState extends State<CardSimpanan> {
  @override
  Widget build(BuildContext context) {
    ResponsiveCardSimpanan.init(context);
    return  widget.rekeningCardSimpananViewModel.rekeningCardSimpananModel.savings.isEmpty
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
              children: widget.rekeningCardSimpananViewModel.rekeningCardSimpananModel.savings.asMap().entries.map((entry) {
                int index = entry.key;
                var saving = entry.value;
                return Card(
                  elevation: 0.0,
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                        width: ResponsiveCardSimpanan.cardSimpananContainerNoRekeningUtamaWidth,
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
                                saving.code,
                                style: GoogleFonts.poppins(textStyle: TextStyle(
                                    fontSize: ResponsiveCardSimpanan.cardSimpananNoRekeningNumFontSize,
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
                                saving.productName,
                                style: GoogleFonts.poppins(textStyle: TextStyle(
                                    fontSize: ResponsiveCardSimpanan.cardSimpananHeader1FontSize,
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
                        width: ResponsiveCardSimpanan.cardSimpananContainerSaldoWidth,
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
                              child: Text(
                                Strings.berandaSaldo,
                                style: GoogleFonts.poppins(textStyle: TextStyle(
                                    fontSize: ResponsiveCardSimpanan.cardSimpananStringSaldoFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10,
                                  bottom: 5,
                                  top: 10
                              ),
                              child: Text(
                                'Rp ${widget.rekeningCardSimpananViewModel.formatValuetoRupiah(double.parse(saving.balance))}',
                                style: GoogleFonts.poppins(textStyle:
                                TextStyle(
                                    fontSize: ResponsiveCardSimpanan.cardSimpananStringSaldoTotalFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 5,
                                  bottom: 10
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      switch (index) {
                                        case 0:
                                          Navigator.pushReplacementNamed(context, RoutePaths.mutasiRekeningTabunganSimpati);
                                          break;
                                        case 1:
                                          Navigator.pushReplacementNamed(context, RoutePaths.mutasiRekeningSimpananPokok);
                                          break;
                                        case 2:
                                          Navigator.pushReplacementNamed(context, RoutePaths.mutasiRekeningSimpananWajib);
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
                                                  fontSize: ResponsiveCardSimpanan.cardSimpananStringTransaksiSelengkapnyaFontSize,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white)),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: ResponsiveCardSimpanan.cardSimpananIconArrowForwardWidth,
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
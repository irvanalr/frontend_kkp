import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/beranda/responsive_beranda.dart';
import 'package:febankflutter/viewmodels/beranda_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardRekeningUtama extends StatefulWidget {
  final BerandaViewModel viewModel;
  const CardRekeningUtama({super.key,required this.viewModel});

  @override
  State<CardRekeningUtama> createState() => _CardRekeningUtamaState();
}

class _CardRekeningUtamaState extends State<CardRekeningUtama> {
  @override
  Widget build(BuildContext context) {
    ResponsiveBeranda.init(context);
    return Column(
      children: [
        Container(
          width: ResponsiveBeranda.cardInformasiContainerNoRekeningUtamaWidth,
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
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      Strings.berandaNoRekeningUtama,
                      style: GoogleFonts.poppins(textStyle: TextStyle(
                          fontSize: ResponsiveBeranda.cardInformasiNoRekeningUtamaFontSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        )
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10,
                    top: 10
                ),
                child: Text(
                    widget.viewModel.berandaModel.productName,
                    style: GoogleFonts.poppins(textStyle: TextStyle(
                        fontSize: ResponsiveBeranda.cardInformasiHeader1FontSize,
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
                    widget.viewModel.berandaModel.code,
                    style: GoogleFonts.poppins(textStyle: TextStyle(
                        fontSize: ResponsiveBeranda.cardInformasiTextRekeningUtamaFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    )
                  ),
                ),
              )
            ],
          ),
        ),

        Container(
          width: ResponsiveBeranda.cardInformasiContainerSaldoWidth,
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
                      fontSize: ResponsiveBeranda.cardInformasiStringSaldoFontSize,
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
                    top: 2
                ),
                child: Text(
                  'Rp ${widget.viewModel.formatValuetoRupiah(double.parse(widget.viewModel.berandaModel.balance))}',
                  style: GoogleFonts.poppins(textStyle:
                  TextStyle(
                      fontSize: ResponsiveBeranda.cardInformasiStringSaldoTotalFontSize,
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
                        Navigator.pushReplacementNamed(context, RoutePaths.mutasiBeranda);
                      },
                      child: Row(
                        children: [
                          Text(
                            Strings.berandaMutasiSelengkapnya,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: ResponsiveBeranda.cardInformasiStringTransaksiSelengkapnyaFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: ResponsiveBeranda.cardInformasiIconArrowForwardWidth,
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
        )
      ],
    );
  }

  // String _getFormattedBalance() {
  //   final balanceString = widget.viewModel.berandaModel.balance;
  //   final balance = double.tryParse(balanceString);
  //   if (balance != null) {
  //     return widget.viewModel.formatValuetoRupiah(balance);
  //   } else {
  //     // Handle the case where the balance cannot be parsed, possibly return "0" or an error message
  //     return "0"; // or you can return an error string
  //   }
  // }
}

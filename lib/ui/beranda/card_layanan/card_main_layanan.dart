import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/beranda/responsive_beranda.dart';
import 'package:febankflutter/viewmodels/beranda_view_model.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardLayanan extends StatefulWidget {
  final BerandaViewModel berandaViewModel;
  final LoginViewModel loginViewModel;

  const CardLayanan({super.key, required this.berandaViewModel, required this.loginViewModel});

  @override
  State<CardLayanan> createState() => _CardLayananState();
}

class _CardLayananState extends State<CardLayanan> {

  String getMessageForIndex(int index) {
    switch (index) {
      case 0:
        return 'Antar Rekening masih dalam pengembangan';
      case 1:
        return 'Antar Koperasi masih dalam pengembangan';
      case 2:
        return 'Paket data masih dalam pengembangan';
      case 3:
        return 'Tagihan PLN masih dalam pengembangan';
      default:
        return 'Icon $index masih dalam pengembangan';
    }
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveBeranda.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Card(
            color: LightAndDarkMode.cardColor6(context),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xFF2B7ECA), width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              width: ResponsiveBeranda.cardLayananSizedBoxWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: widget.berandaViewModel.berandaModel.berandaSvgList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              /// debugging alert
                              return AlertDialog(
                                title: const Text('Informasi'),
                                content: Text(
                                    getMessageForIndex(index),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                widget.berandaViewModel.berandaModel.berandaSvgList[index],
                                scale: ResponsiveBeranda.cardLayananImageSizeWidth,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(
                                  widget.berandaViewModel.berandaModel.berandaTextList[index],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: ResponsiveBeranda.cardLayananTextListFontSize,
                                          fontWeight: FontWeight.normal,
                                          color: LightAndDarkMode.teksRead2(context)
                                      )
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      );
                    },
                  ),
                  GestureDetector(
                    key: const Key('Selengkapnya'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RoutePaths.layanan);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10,
                          bottom: 10 ,
                          top: 20
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              Strings.berandaSelengkapnya,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: ResponsiveBeranda.cardLayananTextStringSelengkapnyaFontSize,
                                      fontWeight: FontWeight.w600,
                                      color:
                                      LightAndDarkMode.teksRead2(context))),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: ResponsiveBeranda.cardLayananIconArrowForwardWidth,
                            color: LightAndDarkMode.teksRead2(context),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/lupa_nama_penguna_dan_kata_sandi/responsive_lupa_nama_pengguna_dan_kata_sandi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRadioButton extends StatefulWidget {
  final Key radioButtonNamaPengguna;
  final Key radioButtonInkWellNamaPengguna;
  final Key radioButtonKataSandi;
  final Key radioButtonInkWellKataSandi;
  final Key buttonLanjutkan;

  const CustomRadioButton({
    super.key,
    required this.radioButtonNamaPengguna,
    required this.radioButtonInkWellNamaPengguna,
    required this.radioButtonKataSandi,
    required this.radioButtonInkWellKataSandi,
    required this.buttonLanjutkan
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  int _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    ResponsiveLupaNamaPenggunaDanKataSandi.init(context);
    return Column(
      children: [

        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: LightAndDarkMode.teksRead(context), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            key: widget.radioButtonInkWellNamaPengguna,
            onTap: () {
              setState(() {
                _groupValue = 0;
              });
            },
            child: SizedBox(
              width: ResponsiveLupaNamaPenggunaDanKataSandi.costumeRadioButtonCardNamaPenggunaDanKataSandiWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioListTile<int>(
                    key: widget.radioButtonNamaPengguna,
                    activeColor: LightAndDarkMode.teksRead(context),
                    title: Text(
                      Strings.loginNamaPenggunaString,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: ResponsiveLupaNamaPenggunaDanKataSandi.costumeRadioButtonNamaPenggunaDanKataSandiHeadFontSize,
                          fontWeight: FontWeight.normal,
                          color: LightAndDarkMode.teksRead(context),
                        ),
                      ),
                    ),
                    value: 0,
                    groupValue: _groupValue,
                    onChanged: (int? value) {
                      setState(() {
                        _groupValue = value!;
                      });
                    },
                  ),
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        Strings.lupaNamaPenggunaAtauKataSandiNamaPenggunaBody,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: ResponsiveLupaNamaPenggunaDanKataSandi.costumRadioButtonNamaPenggunaDanKataSandiBodyFontSize,
                            fontWeight: FontWeight.normal,
                            color: LightAndDarkMode.teksRead(context),
                          ),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const Padding(padding: EdgeInsets.only(top: 10)),

        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: LightAndDarkMode.teksRead(context), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            key: widget.radioButtonInkWellKataSandi,
            onTap: () {
              setState(() {
                _groupValue = 1;
              });
            },
            child: SizedBox(
              width: ResponsiveLupaNamaPenggunaDanKataSandi.costumeRadioButtonCardNamaPenggunaDanKataSandiWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioListTile<int>(
                    key: widget.radioButtonKataSandi,
                    activeColor: LightAndDarkMode.teksRead(context),
                    title: Text(
                      Strings.loginKataSandiString,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: ResponsiveLupaNamaPenggunaDanKataSandi.costumeRadioButtonNamaPenggunaDanKataSandiHeadFontSize,
                          fontWeight: FontWeight.normal,
                          color: LightAndDarkMode.teksRead(context),
                        ),
                      ),
                    ),
                    value: 1,
                    groupValue: _groupValue,
                    onChanged: (int? value) {
                      setState(() {
                        _groupValue = value!;
                      });
                    },
                  ),
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        Strings.lupaNamaPenggunaAtauKataSandiKataSandiBody,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: ResponsiveLupaNamaPenggunaDanKataSandi.costumRadioButtonNamaPenggunaDanKataSandiBodyFontSize,
                            fontWeight: FontWeight.normal,
                            color: LightAndDarkMode.teksRead(context),
                          ),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: ResponsiveLupaNamaPenggunaDanKataSandi.costumeRadioButtonCardNamaPenggunaDanKataSandiWidth,
            child: TextButton(
              key: widget.buttonLanjutkan,
              style: TextButton.styleFrom(
                backgroundColor: LightAndDarkMode.primaryColor(context),
                shape:const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              onPressed: () {
                if (_groupValue == 0) {
                  Navigator.pushNamed(context, RoutePaths.namaPengguna);
                } else if (_groupValue == 1) {
                  Navigator.pushNamed(context,RoutePaths.kataSandi);
                }
              },
              child: Text(
                Strings.lupaNamaPenggunaAtauKataSandiLanjutkan,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: ResponsiveLupaNamaPenggunaDanKataSandi.costumeRadioButtonNamaPenggunaDanKataSandiTextButtonLanjutkanFontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  )
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

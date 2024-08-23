import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/alert/responsive_alert.dart';
import 'package:febankflutter/utils/responsive/lupa_nama_penguna_dan_kata_sandi/responsive_lupa_nama_pengguna.dart';
import 'package:febankflutter/viewmodels/lupa_nama_pengguna_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldNamaPengguna extends StatefulWidget {
  final LupaNamaPenggunaViewModel viewModel;
  final TextEditingController nomorKtpController;
  final TextEditingController namaIbuKandungController;
  final TextEditingController nomorRekeningController;
  final FocusNode nomorKtpFocus;
  final FocusNode namaIbuKandungFocus;
  final FocusNode nomorRekeningFocus;
  final Key keyNomorKtp;
  final Key keyNamaIbuKandung;
  final Key keyNomorRekeningBank;
  final Key keyButtonLupaNamaPenggunaLanjutkan;
  final Key keyAlertOk;

  const CustomTextFieldNamaPengguna ({
      super.key,
      required this.viewModel,
      required this.nomorKtpController,
      required this.namaIbuKandungController,
      required this.nomorRekeningController,
      required this.nomorKtpFocus,
      required this.namaIbuKandungFocus,
      required this.nomorRekeningFocus,
      required this.keyNomorKtp,
      required this.keyNamaIbuKandung,
      required this.keyNomorRekeningBank,
      required this.keyButtonLupaNamaPenggunaLanjutkan,
      required this.keyAlertOk
  });

  @override
  State<CustomTextFieldNamaPengguna> createState() => _CustomTextFieldNamaPenggunaState();
}

class _CustomTextFieldNamaPenggunaState extends State<CustomTextFieldNamaPengguna> {
  void validateInput() {
    setState(() {
      if (widget.nomorKtpController.text !=
              widget.viewModel.lupaNamaPenggunaModel.nomorKtpState ||
          widget.namaIbuKandungController.text !=
              widget.viewModel.lupaNamaPenggunaModel.namaIbuKandungState ||
          widget.nomorRekeningController.text !=
              widget.viewModel.lupaNamaPenggunaModel.nomorRekeningState) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return
              AlertDialog(
              title: Text(
                Strings.loginInformasiString,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                     fontSize: ResponsiveAlert.alertTitleInformasiFontSize,
                     fontWeight: FontWeight.bold
                    )
                  ),
                textAlign: TextAlign.center,
              ),
              content: Text(
                Strings.lupaNamaPenggunaDataYangAndaMasukanSalah,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: ResponsiveAlert.alertContentFontSize,
                    fontWeight: FontWeight.normal
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  key: widget.keyAlertOk,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ok',
                    style: GoogleFonts.poppins (
                      textStyle: TextStyle(
                        fontSize: ResponsiveAlert.alertActionOkFontSize,
                        fontWeight: FontWeight.w600,
                        color: LightAndDarkMode.teksRead2(context)
                      )
                    ),
                  ),
                ),
              ],
            );
          },
        );
      } else {
        /// debugging alert
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                Strings.loginInformasiString,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold
                    )
                  ),
                textAlign: TextAlign.center,
              ),
              content: Text(
                'validasi nama Pengguna masih dalam tahap pengembangan',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 12, 
                      fontWeight: FontWeight.normal
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextButton(
                  key: widget.keyAlertOk,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveLupaNamaPengguna.init(context);
    ResponsiveAlert.init(context);
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaSizedBoxWidth,
              child: TextField(
                key: widget.keyNomorKtp,
                style: GoogleFonts.poppins(
                  color: widget.nomorKtpFocus.hasFocus
                      ? LightAndDarkMode.teksRead2(context)
                      : LightAndDarkMode.teksRead2(context),
                  textStyle: TextStyle(
                    fontSize: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaInputFontSize,
                    fontWeight: FontWeight.w600
                  )
                ),
                inputFormatters: [
                  // Deny input of specific characters such as $ and `
                  FilteringTextInputFormatter.deny(RegExp(r'[$`]')),
                  // Allow only digits (0-9)
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                controller: widget.nomorKtpController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onEditingComplete: () => FocusScope.of(context).requestFocus(widget.namaIbuKandungFocus),
                focusNode: widget.nomorKtpFocus,
                onChanged: (value) {
                  setState(() {
                    if (value.length > 16) {
                      value = value.substring(0, 16);
                      widget.nomorKtpController.text = value;
                      widget.nomorKtpController.selection =
                          TextSelection.fromPosition(
                              TextPosition(offset: value.length));
                    }
                    widget.viewModel.lupaNamaPenggunaModel.nomorKtp = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: Strings.lupaNamaPenggunaNomorKtp,
                  labelStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaInputLabelFontSize,
                      fontWeight: FontWeight.normal
                    )
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      'assets/svg/ktp.svg',
                      colorFilter: ColorFilter.mode(
                        LightAndDarkMode.teksRead2(context), BlendMode.srcIn
                      ),
                      width: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaSvgPictureWidth,
                    ),
                  ),
                ),
                cursorColor: LightAndDarkMode.teksRead(context),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaSizedBoxWidth,
              child: TextField(
                key: widget.keyNamaIbuKandung,
                style: GoogleFonts.poppins(
                  color: widget.nomorRekeningFocus.hasFocus
                      ? LightAndDarkMode.teksRead2(context)
                      : LightAndDarkMode.teksRead2(context),
                  textStyle: TextStyle(
                    fontSize: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaInputFontSize,
                    fontWeight: FontWeight.w600
                  )
                ),
                inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[$`]'))],
                controller: widget.namaIbuKandungController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(widget.nomorRekeningFocus),
                focusNode: widget.namaIbuKandungFocus,
                onChanged: (value) {
                  setState(() {
                    if (value.length > 23) {
                      value = value.substring(0, 23);
                      widget.namaIbuKandungController.text = value;
                      widget.namaIbuKandungController.selection =
                          TextSelection.fromPosition(
                              TextPosition(offset: value.length));
                    }
                    widget.viewModel.lupaNamaPenggunaModel.namaIbuKandung =
                        value;
                  });
                },
                decoration: InputDecoration(
                  labelText: Strings.lupaNamaPenggunaNamaIbuKandung,
                  labelStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaInputLabelFontSize,
                      fontWeight: FontWeight.normal
                    )
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      'assets/svg/ibukandung.svg',
                      colorFilter: ColorFilter.mode(
                        LightAndDarkMode.teksRead2(context),
                        BlendMode.srcIn
                      ),
                      width: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaSvgPictureWidth,
                    ),
                  ),
                ),
                cursorColor: LightAndDarkMode.teksRead(context),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaSizedBoxWidth,
              child: TextField(
                key: widget.keyNomorRekeningBank,
                style: GoogleFonts.poppins(
                  color: widget.nomorRekeningFocus.hasFocus
                      ? LightAndDarkMode.teksRead2(context)
                      : LightAndDarkMode.teksRead2(context),
                  textStyle: TextStyle(
                    fontSize: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaInputFontSize,
                    fontWeight: FontWeight.w600
                  )
                ),
                inputFormatters: [
                  // Deny input of specific characters such as $ and `
                  FilteringTextInputFormatter.deny(RegExp(r'[$`]')),
                  // Allow only digits (0-9)
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                controller: widget.nomorRekeningController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                focusNode: widget.nomorRekeningFocus,
                onChanged: (value) {
                  setState(() {
                    if (value.length > 16) {
                      value = value.substring(0, 16);
                      widget.nomorRekeningController.text = value;
                      widget.nomorRekeningController.selection =
                          TextSelection.fromPosition(
                            TextPosition(offset: value.length)
                          );
                    }
                    widget.viewModel.lupaNamaPenggunaModel.nomorRekening = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: Strings.lupaNamaPenggunaNomorRekening,
                  labelStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaInputLabelFontSize,
                      fontWeight: FontWeight.normal
                    )
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      'assets/svg/debitcard.svg',
                      colorFilter: ColorFilter.mode(
                        LightAndDarkMode.teksRead2(context),
                        BlendMode.srcIn
                      ),
                      width: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaSvgPictureWidth,
                    ),
                  ),
                ),
                cursorColor: LightAndDarkMode.teksRead(context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaSizedBoxWidth,
              child: TextButton(
                key: widget.keyButtonLupaNamaPenggunaLanjutkan,
                style: TextButton.styleFrom(
                    backgroundColor:
                        widget.viewModel.lupaNamaPenggunaModel.isButtonEnabled
                            ? LightAndDarkMode.primaryColor(context)
                            : Colors.grey,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide.none)),
                onPressed:
                    widget.viewModel.lupaNamaPenggunaModel.isButtonEnabled
                        ? validateInput
                        : null,
                child: Text(
                  Strings.lupaNamaPenggunaAtauKataSandiLanjutkan,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: ResponsiveLupaNamaPengguna.costumeTextFieldLupaNamaPenggunaTextButtonLanjutkanFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    )
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

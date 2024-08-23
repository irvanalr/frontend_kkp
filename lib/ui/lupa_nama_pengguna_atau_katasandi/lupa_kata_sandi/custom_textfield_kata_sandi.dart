import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/alert/responsive_alert.dart';
import 'package:febankflutter/utils/responsive/lupa_nama_penguna_dan_kata_sandi/responsive_lupa_kata_sandi.dart';
import 'package:febankflutter/viewmodels/lupa_kata_sandi_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldKataSandi extends StatefulWidget {
  final LupaKataSandiViewModel viewModel;
  final TextEditingController namaPenggunaController;
  final TextEditingController tanggalLahirController;
  final FocusNode namaPenggunaFocus;
  final FocusNode tanggalLahirFocus;
  final Key keyNamaPengguna;
  final Key keyTanggalLahir;
  final Key keyButtonLanjutkanLupaKataSandi;
  final Key keyAlertOk;

  const CustomTextFieldKataSandi({
    super.key,
    required this.viewModel,
    required this.namaPenggunaController,
    required this.tanggalLahirController,
    required this.namaPenggunaFocus,
    required this.tanggalLahirFocus,
    required this.keyNamaPengguna,
    required this.keyTanggalLahir,
    required this.keyButtonLanjutkanLupaKataSandi,
    required this.keyAlertOk
  });

  @override
  State<CustomTextFieldKataSandi> createState() =>
      _CustomTextFieldKataSandiState();
}

class _CustomTextFieldKataSandiState extends State<CustomTextFieldKataSandi> {

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      // initialDate: DateTime.now(),
      firstDate: widget.viewModel.firstDate,
      lastDate: widget.viewModel.lastDate,
    );
    if (picked != null) {
      setState(() {
        widget.tanggalLahirController.text =
            '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      });
    }
  }

  void validateInput() {
    setState(() {
      if(widget.namaPenggunaController.text != widget.viewModel.lupaKataSandiModel.namaPenggunaState &&
          widget.tanggalLahirController.text != widget.viewModel.lupaKataSandiModel.tanggalLahirState) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
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
              actions: <Widget>[
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
      }else {
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
                'validasi Email masih dalam tahap pengembangan',
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
    ResponsiveLupaKataSandi.init(context);
    ResponsiveAlert.init(context);
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: ResponsiveLupaKataSandi.costumeTextFieldLupaKataSandiSizedBoxWidth,
              child: TextField(
                key: widget.keyNamaPengguna,
                style: GoogleFonts.poppins(
                  color: widget.namaPenggunaFocus.hasFocus
                      ? LightAndDarkMode.teksRead2(context)
                      : LightAndDarkMode.teksRead2(context),
                  textStyle: TextStyle(
                    fontSize: ResponsiveLupaKataSandi.costumeTextFieldLupaKataSandiInputNamaPenggunaDanTanggalLahirFontSize,
                    fontWeight: FontWeight.w600
                  )
                ),
                inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[$`]'))],
                controller: widget.namaPenggunaController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onEditingComplete: () => FocusScope.of(context)
                    .requestFocus(widget.tanggalLahirFocus),
                focusNode: widget.namaPenggunaFocus,
                onChanged: (value) {
                  setState(() {
                    if (value.length > 23) {
                      value = value.substring(0, 23);
                      widget.namaPenggunaController.text = value;
                      widget.namaPenggunaController.selection =
                          TextSelection.fromPosition(
                              TextPosition(offset: value.length));
                    }
                    widget.viewModel.lupaKataSandiModel.namaPengguna = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: Strings.loginNamaPenggunaString,
                  labelStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ResponsiveLupaKataSandi.costumeTextFieldLupaKataSandiInputLabelNamaPenggunaDanTanggalLahirFontSize,
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
                      width: ResponsiveLupaKataSandi.costumeTextFieldLupaKataSandiSvgPictureWidth,
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
              width: ResponsiveLupaKataSandi.costumeTextFieldLupaKataSandiSizedBoxWidth,
              child: TextField(
                key: widget.keyTanggalLahir,
                style: GoogleFonts.poppins(
                  color: widget.tanggalLahirFocus.hasFocus
                      ? LightAndDarkMode.teksRead2(context)
                      : LightAndDarkMode.teksRead2(context),
                  textStyle: TextStyle(
                    fontSize: ResponsiveLupaKataSandi.costumeTextFieldLupaKataSandiInputNamaPenggunaDanTanggalLahirFontSize,
                    fontWeight: FontWeight.w600
                  )
                ),
                controller: widget.tanggalLahirController,
                onTap: () {
                  selectDate(context);
                },
                readOnly: true,
                inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[$`]'))],
                focusNode: widget.tanggalLahirFocus,
                onChanged: (value) {
                  setState(() {
                    if (value.length > 10) {
                      value = value.substring(0, 10);
                      widget.tanggalLahirController.text = value;
                      widget.tanggalLahirController.selection =
                          TextSelection.fromPosition(
                              TextPosition(offset: value.length));
                    }
                    widget.viewModel.lupaKataSandiModel.tanggalLahir = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: Strings.lupaKataSandiTanggalLahir,
                  labelStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ResponsiveLupaKataSandi.costumeTextFieldLupaKataSandiInputLabelNamaPenggunaDanTanggalLahirFontSize,
                      fontWeight: FontWeight.normal
                    )
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10,bottom: 10),
                     child: SvgPicture.asset(
                      'assets/svg/icondate.svg',
                      colorFilter: ColorFilter.mode(
                       LightAndDarkMode.teksRead2(context),
                       BlendMode.srcIn
                      ),
                      width: ResponsiveLupaKataSandi.costumeTextFieldLupaKataSandiSvgPictureWidth,
                    ),
                  ),
                  suffixIcon: const Icon(
                      Icons.arrow_drop_down), // Ikon panah ke bawah di akhir
                ),
                cursorColor: LightAndDarkMode.teksRead(context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 41),
            child: SizedBox(
              width: ResponsiveLupaKataSandi.costumeTextFieldLupaKataSandiSizedBoxWidth,
              child: TextButton(
                key: widget.keyButtonLanjutkanLupaKataSandi,
                style: TextButton.styleFrom(
                    backgroundColor:
                        widget.viewModel.lupaKataSandiModel.isButtonEnabled
                            ? LightAndDarkMode.primaryColor(context)
                            : Colors.grey,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide.none)),
                onPressed:
                    widget.viewModel.lupaKataSandiModel.isButtonEnabled
                        ? validateInput
                        : null,
                child: Text(
                  Strings.lupaNamaPenggunaAtauKataSandiLanjutkan,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ResponsiveLupaKataSandi.costumeTextFieldLupaKataSandiTextButtonLanjutkanFontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    )
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

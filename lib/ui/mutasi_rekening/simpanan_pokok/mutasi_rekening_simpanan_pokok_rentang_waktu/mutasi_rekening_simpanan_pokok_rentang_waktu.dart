import 'dart:async';

import 'package:febankflutter/utils/responsive/mutasi_rekening/responsive_mutasi_rekening_simpanan_pokok.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/mutasi_rekening_simpanan_pokok_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class MutasiRekeningSimpananPokokRentangWaktu extends StatefulWidget {
  final MutasiRekeningSimpananPokokViewModel mutasiRekeningSimpananPokokViewModel;
  const MutasiRekeningSimpananPokokRentangWaktu({
    super.key,
    required this.mutasiRekeningSimpananPokokViewModel,
  });

  @override
  State<MutasiRekeningSimpananPokokRentangWaktu> createState() => _MutasiRekeningSimpananPokokRentangWaktuState();
}

class _MutasiRekeningSimpananPokokRentangWaktuState extends State<MutasiRekeningSimpananPokokRentangWaktu> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedTransaksi =
        widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.transaksi;
    if(widget.mutasiRekeningSimpananPokokViewModel.containsDate(widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedTransaksi)) {
      widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedRadio = 'Pilih keinginan';
    }else {
      widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedRadio =
          widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedTransaksi;
    }
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedDate;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void applySelection() {
    if (widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedRadio == 'Pilih keinginan') {
      if (widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedDropdownItem == null) {
        Fluttertoast.showToast(
            msg: "Silahkan pilih TRANSAKSI terlebih dahulu !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        return;
      }
      if (widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedDate == null) {
        Fluttertoast.showToast(
            msg: "Silahkan pilih TANGGAL terlebih dahulu !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        return;
      }
    }
    widget.mutasiRekeningSimpananPokokViewModel.updateTransaksi(
        widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedTransaksi
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveMutasiRekeningSimpananPokok.init(context);
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: LightAndDarkMode.primaryColor(context),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 21,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Rentang Waktu',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: ResponsiveMutasiRekeningSimpananPokok.mutasiRekeningSimpananPokokTitleFontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Pilih rentang waktu anda :',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: LightAndDarkMode.teksRead(context)
                    )
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RadioListTile<String>(
                  title: Text(
                    '5 Transaksi terakhir',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: LightAndDarkMode.teksRead2(context)
                      )
                    ),
                  ),
                  value: '5 Transaksi terakhir',
                  groupValue: widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      widget.mutasiRekeningSimpananPokokViewModel.updateRadioButton(value!);
                      widget.mutasiRekeningSimpananPokokViewModel.updateSelectedTransaksi(value);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RadioListTile<String>(
                  title: Text(
                    '10 Transaksi terakhir',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: LightAndDarkMode.teksRead2(context)
                      )
                    ),
                  ),
                  value: '10 Transaksi terakhir',
                  groupValue: widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      widget.mutasiRekeningSimpananPokokViewModel.updateRadioButton(value!);
                      widget.mutasiRekeningSimpananPokokViewModel.updateSelectedTransaksi(value);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RadioListTile<String>(
                  title: Text(
                    '20 Transaksi terakhir',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: LightAndDarkMode.teksRead2(context)
                      )
                    ),
                  ),
                  value: '20 Transaksi terakhir',
                  groupValue: widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      widget.mutasiRekeningSimpananPokokViewModel.updateRadioButton(value!);
                      widget.mutasiRekeningSimpananPokokViewModel.updateSelectedTransaksi(value);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RadioListTile<String>(
                  title: Text(
                    'Pilih keinginan',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: LightAndDarkMode.teksRead2(context),
                      ),
                    ),
                  ),
                  value: 'Pilih keinginan',
                  groupValue: widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      widget.mutasiRekeningSimpananPokokViewModel.updateRadioButton(value!);
                      widget.mutasiRekeningSimpananPokokViewModel.updateSelectedTransaksiWithDate();
                    });
                  },
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
              if (widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedRadio == 'Pilih keinginan')
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<String>(
                        value: widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedDropdownItem,
                        hint: Text(
                          'Pilih Transaksi',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: LightAndDarkMode.teksRead2(context),
                            ),
                          ),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedDropdownItem = newValue!;
                            widget.mutasiRekeningSimpananPokokViewModel.updateSelectedTransaksiWithDate();
                          });
                        },
                        items: widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.dropdownItems
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: LightAndDarkMode.teksRead2(context),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () => widget.mutasiRekeningSimpananPokokViewModel.selectDate(context),
                        child: Text(
                          widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedDate != null
                              ? "${widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedDate!.day}-${widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedDate!.month}-${widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.selectedDate!.year}"
                              : "Pilih tanggal",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.055,
                color: LightAndDarkMode.primaryColor(context),
                child: TextButton(
                  onPressed: applySelection,
                  child: Text(
                    'Terapkan',
                    style: GoogleFonts.poppins(textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
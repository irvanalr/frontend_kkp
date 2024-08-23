import 'dart:async';

import 'package:febankflutter/utils/responsive/mutasi_rekening/responsive_mutasi_rekening_simpanan_wajib.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/mutasi_rekening_simpanan_wajib_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class MutasiRekeningSimpananWajibRentangWaktu extends StatefulWidget {
  final MutasiRekeningSimpananWajibViewModel mutasiRekeningSimpananWajibViewModel;
  const MutasiRekeningSimpananWajibRentangWaktu({
    super.key,
    required this.mutasiRekeningSimpananWajibViewModel,
  });

  @override
  State<MutasiRekeningSimpananWajibRentangWaktu> createState() => _MutasiRekeningSimpananWajibRentangWaktuState();
}

class _MutasiRekeningSimpananWajibRentangWaktuState extends State<MutasiRekeningSimpananWajibRentangWaktu> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedTransaksi =
        widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.transaksi;
    if(widget.mutasiRekeningSimpananWajibViewModel.containsDate(widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedTransaksi)) {
      widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedRadio = 'Pilih keinginan';
    }else {
      widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedRadio =
          widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedTransaksi;
    }
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedDate;
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
    if (widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedRadio == 'Pilih keinginan') {
      if (widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedDropdownItem == null) {
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
      if (widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedDate == null) {
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
    widget.mutasiRekeningSimpananWajibViewModel.updateTransaksi(
        widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedTransaksi
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveMutasiRekeningSimpananWajib.init(context);
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
                fontSize: ResponsiveMutasiRekeningSimpananWajib.mutasiRekeningSimpananWajibTitleFontSize,
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
                      color: LightAndDarkMode.teksRead(context),
                    ),
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
                        color: LightAndDarkMode.teksRead2(context),
                      ),
                    ),
                  ),
                  value: '5 Transaksi terakhir',
                  groupValue: widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      widget.mutasiRekeningSimpananWajibViewModel.updateRadioButton(value!);
                      widget.mutasiRekeningSimpananWajibViewModel.updateSelectedTransaksi(value);
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
                        color: LightAndDarkMode.teksRead2(context),
                      ),
                    ),
                  ),
                  value: '10 Transaksi terakhir',
                  groupValue: widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      widget.mutasiRekeningSimpananWajibViewModel.updateRadioButton(value!);
                      widget.mutasiRekeningSimpananWajibViewModel.updateSelectedTransaksi(value);
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
                        color: LightAndDarkMode.teksRead2(context),
                      ),
                    ),
                  ),
                  value: '20 Transaksi terakhir',
                  groupValue: widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      widget.mutasiRekeningSimpananWajibViewModel.updateRadioButton(value!);
                      widget.mutasiRekeningSimpananWajibViewModel.updateSelectedTransaksi(value);
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
                  groupValue: widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      widget.mutasiRekeningSimpananWajibViewModel.updateRadioButton(value!);
                      widget.mutasiRekeningSimpananWajibViewModel.updateSelectedTransaksiWithDate();
                    });
                  },
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
              if (widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedRadio == 'Pilih keinginan')
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
                        value: widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedDropdownItem,
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
                            widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedDropdownItem = newValue!;
                            widget.mutasiRekeningSimpananWajibViewModel.updateSelectedTransaksiWithDate();
                          });
                        },
                        items: widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.dropdownItems
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
                        onPressed: () => widget.mutasiRekeningSimpananWajibViewModel.selectDate(context),
                        child: Text(
                          widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedDate != null
                              ? "${widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedDate!.day}-${widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedDate!.month}-${widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.selectedDate!.year}"
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
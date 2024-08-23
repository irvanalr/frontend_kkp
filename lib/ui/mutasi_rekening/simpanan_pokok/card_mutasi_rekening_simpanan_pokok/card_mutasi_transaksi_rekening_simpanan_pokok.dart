import 'package:febankflutter/models/mutasi_rekening_simpanan_pokok_model.dart';
import 'package:febankflutter/utils/responsive/mutasi_rekening/responsive_mutasi_rekening_simpanan_pokok.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/mutasi_rekening_simpanan_pokok_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardMutasiTransaksiRekeningSimpananPokok extends StatefulWidget {
  final MutasiRekeningSimpananPokokViewModel mutasiRekeningSimpananPokokViewModel;
  const CardMutasiTransaksiRekeningSimpananPokok({super.key, required this.mutasiRekeningSimpananPokokViewModel});

  @override
  State<CardMutasiTransaksiRekeningSimpananPokok> createState() => _CardMutasiTransaksiRekeningSimpananPokokState();
}

class _CardMutasiTransaksiRekeningSimpananPokokState extends State<CardMutasiTransaksiRekeningSimpananPokok> {

  @override
  Widget build(BuildContext context) {
    ResponsiveMutasiRekeningSimpananPokok.init(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.transactions.isEmpty
            ? Center(
          child: Text(
            "Data transaksi kosong !!!",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: ResponsiveMutasiRekeningSimpananPokok.cardMutasiRekeningSimpananPokokStringHeadKeyFontSize,
                fontWeight: FontWeight.w600,
                color: LightAndDarkMode.teksRead2(context),
              ),
            ),
          ),
        )
            : ListView.builder(
          itemCount: widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.transactions.length,
          itemBuilder: (context, index) {
            Transactions transaction = widget.mutasiRekeningSimpananPokokViewModel.mutasiRekeningSimpananPokokModel.transactions[index];
            return Container(
              width: ResponsiveMutasiRekeningSimpananPokok.cardMutasiRekeningSimpananPokokContainerWidth,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFF2B7ECA), width: 1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            transaction.date,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: ResponsiveMutasiRekeningSimpananPokok.cardMutasiRekeningSimpananPokokStringHeadKeyFontSize,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1B3E5F),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Rp ${widget.mutasiRekeningSimpananPokokViewModel.formatValuetoRupiah(double.parse(transaction.endValue1))}',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: ResponsiveMutasiRekeningSimpananPokok.cardMutasiRekeningSimpananPokokStringHeadTotalSaldoFontSize,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1B3E5F),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          transaction.code,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: ResponsiveMutasiRekeningSimpananPokok.cardMutasiRekeningSimpananPokokStringJenisTransferDanNomerTransferFontSize,
                              fontWeight: FontWeight.normal,
                              color: LightAndDarkMode.teksRead(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            'Rp ${widget.mutasiRekeningSimpananPokokViewModel.formatValuetoRupiah(double.parse(transaction.value1))}',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: ResponsiveMutasiRekeningSimpananPokok.cardMutasiRekeningSimpananPokokStringPengeluaranAtauPemasukanFontSize,
                                fontWeight: FontWeight.normal,
                                color: transaction.direction == "1" ? Colors.green : Colors.red,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: Text(
                              transaction.description,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: ResponsiveMutasiRekeningSimpananPokok.cardMutasiRekeningSimpananPokokStringJenisTransferDanNomerTransferFontSize,
                                  fontWeight: FontWeight.normal,
                                  color: LightAndDarkMode.teksRead(context),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

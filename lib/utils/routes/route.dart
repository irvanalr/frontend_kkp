import 'package:febankflutter/ui/akun/akun_profile/profile.dart';
import 'package:febankflutter/ui/akun/ganti/ganti_kata_sandi/ganti_password.dart';
import 'package:febankflutter/ui/layanan/layanan.dart';
import 'package:febankflutter/ui/lupa_nama_pengguna_atau_katasandi/lupa_kata_sandi/kata_sandi.dart';
import 'package:febankflutter/ui/lupa_nama_pengguna_atau_katasandi/lupa_nama_pengguna/nama_pengguna.dart';
import 'package:febankflutter/ui/lupa_nama_pengguna_atau_katasandi/lupa_nama_pengguna_atau_kata_sandi.dart';
import 'package:febankflutter/ui/mutasi_beranda/mutasi_beranda_rekening/mutasi_beranda_rekening.dart';
import 'package:febankflutter/ui/mutasi_beranda/mutasi_beranda.dart';
import 'package:febankflutter/ui/mutasi_beranda/mutasi_beranda_rentang_waktu/mutasi_beranda_rentang_waktu.dart';
import 'package:febankflutter/ui/mutasi_rekening/simpanan_pokok/mutasi_rekening_simpanan_pokok_rekening/mutasi_rekening_simpanan_pokok_rekening.dart';
import 'package:febankflutter/ui/mutasi_rekening/simpanan_pokok/mutasi_rekening_simpanan_pokok.dart';
import 'package:febankflutter/ui/mutasi_rekening/simpanan_pokok/mutasi_rekening_simpanan_pokok_rentang_waktu/mutasi_rekening_simpanan_pokok_rentang_waktu.dart';
import 'package:febankflutter/ui/mutasi_rekening/simpanan_wajib/mutasi_rekening_simpanan_wajib.dart';
import 'package:febankflutter/ui/mutasi_rekening/simpanan_wajib/mutasi_rekening_simpanan_wajib_rekening/mutasi_rekening_simpanan_wajib_rekening.dart';
import 'package:febankflutter/ui/mutasi_rekening/simpanan_wajib/mutasi_rekening_simpanan_wajib_rentang_waktu/mutasi_rekening_simpanan_wajib_rentang_waktu.dart';
import 'package:febankflutter/ui/mutasi_rekening/tabungan_simpati/mutasi_rekening_tabungan_simpati.dart';
import 'package:febankflutter/ui/mutasi_rekening/tabungan_simpati/mutasi_rekening_tabungan_simpati_rekening/mutasi_rekening_tabungan_simpati_rekening.dart';
import 'package:febankflutter/ui/mutasi_rekening/tabungan_simpati/mutasi_rekening_tabungan_simpati_rentang_waktu/mutasi_rekening_tabungan_simpati_rentang_waktu.dart';
import 'package:febankflutter/ui/navigation_bottom/navigation_bottom.dart';
import 'package:febankflutter/viewmodels/mutasi_beranda_view_model.dart';
import 'package:febankflutter/viewmodels/mutasi_rekening_simpanan_pokok_view_model.dart';
import 'package:febankflutter/viewmodels/mutasi_rekening_simpanan_wajib_view_model.dart';
import 'package:febankflutter/viewmodels/mutasi_rekening_tabungan_simpati_view_model.dart';
import 'package:flutter/material.dart';
import 'package:febankflutter/ui/login/login.dart';
import 'package:febankflutter/ui/splash_screen/splash_screen.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RoutePaths.root:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => const Login());
      case RoutePaths.lupaNamaPenggunaAtauKataSandi:
        return MaterialPageRoute(builder: (_) => const LupaNamaPenggunaAtauKataSandi());
      case RoutePaths.namaPengguna:
        return MaterialPageRoute(builder: (_) => const NamaPengguna());
      case RoutePaths.kataSandi:
        return MaterialPageRoute(builder: (_) => const KataSandi());
      case RoutePaths.navigationBarCustome:
        return MaterialPageRoute(builder: (_) => const NavigationBarCustome());
      case RoutePaths.mutasiBeranda:
        return MaterialPageRoute(builder: (_) => const MutasiBeranda());
      case RoutePaths.mutasiBerandaRentangWaktu:
        if(args is MutasiBerandaViewModel) {
          return MaterialPageRoute(builder: (_) => MutasiBerandaRentangWaktu(mutasiBerandaViewModel: args));
        }
        return _errorRoute();
      case RoutePaths.mutasiBerandaRekening:
        if(args is MutasiBerandaViewModel) {
          return MaterialPageRoute(builder: (_) => MutasiBerandaRekening(mutasiBerandaViewModel: args));
        }
        return _errorRoute();
      case RoutePaths.layanan:
        return MaterialPageRoute(builder: (_) => const Layanan());
      case RoutePaths.akunProfile:
        return MaterialPageRoute(builder: (_) => const AkunProfile());
      case RoutePaths.akunGantiPassword:
        return MaterialPageRoute(builder: (_) => const GantiKataSandi());
      case RoutePaths.mutasiRekeningTabunganSimpati:
        return MaterialPageRoute(builder: (_) => const MutasiRekeningTabunganSimpati());
      case RoutePaths.mutasiRekeningTabunganSimpatiRentangWaktu:
        if(args is MutasiRekeningTabunganSimpatiViewModel) {
          return MaterialPageRoute(builder: (_) => MutasiRekeningTabunganSimpatiRentangWaktu(mutasiRekeningTabunganSimpatiViewModel: args));
        }
        return _errorRoute();
      case RoutePaths.mutasiRekeningTabunganSimpatiRekening:
        if(args is MutasiRekeningTabunganSimpatiViewModel) {
          return MaterialPageRoute(builder: (_) => MutasiRekeningTabunganSimpatiRekening(mutasiRekeningTabunganSimpatiViewModel: args));
        }
        return _errorRoute();
      case RoutePaths.mutasiRekeningSimpananPokok:
        return MaterialPageRoute(builder: (_) => const MutasiRekeningSimpananPokok());
      case RoutePaths.mutasiRekeningSimpananPokokRentangWaktu :
        if(args is MutasiRekeningSimpananPokokViewModel) {
          return MaterialPageRoute(builder: (_) => MutasiRekeningSimpananPokokRentangWaktu(mutasiRekeningSimpananPokokViewModel: args));
        }
        return _errorRoute();
      case RoutePaths.mutasiRekeningSimpananPokokRekening :
        if(args is MutasiRekeningSimpananPokokViewModel) {
          return MaterialPageRoute(builder: (_) => MutasiRekeningSimpananPokokRekening(mutasiRekeningSimpananPokokViewModel: args));
        }
        return _errorRoute();
      case RoutePaths.mutasiRekeningSimpananWajib:
        return MaterialPageRoute(builder: (_) => const MutasiRekeningSimpananWajib());
      case RoutePaths.mutasiRekeningSimpananWajibRentangWaktu:
        if(args is MutasiRekeningSimpananWajibViewModel) {
          return MaterialPageRoute(builder: (_) => MutasiRekeningSimpananWajibRentangWaktu(mutasiRekeningSimpananWajibViewModel: args));
        }
        return _errorRoute();
      case RoutePaths.mutasiRekeningSimpananWajibRekening :
        if(args is MutasiRekeningSimpananWajibViewModel) {
          return MaterialPageRoute(builder: (_) => MutasiRekeningSimpananWajibRekening(mutasiRekeningSimpananWajibViewModel: args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
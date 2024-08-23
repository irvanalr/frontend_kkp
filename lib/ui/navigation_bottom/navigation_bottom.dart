import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/ui/akun/akun.dart';
import 'package:febankflutter/ui/beranda/beranda.dart';
import 'package:febankflutter/ui/rekening/rekening.dart';
import 'package:febankflutter/ui/notifikasi/notifikasi.dart';
import 'package:febankflutter/utils/responsive/navigation_bottom_bar/responsive_navigation_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class NavigationBarCustome extends StatefulWidget {
  const NavigationBarCustome({super.key});

  @override
  State<NavigationBarCustome> createState() => _NavigationBarCustomeState();
}

class _NavigationBarCustomeState extends State<NavigationBarCustome> {
  late final NavigationController controller;
  final logger = Logger();
  DateTime? lastPressed;

  @override
  void initState() {
    super.initState();
    controller = Get.put(NavigationController());

    // HardwareKeyboard.instance.addHandler(_handleKeyEvent);
  }

  // @override
  // void dispose() {
  //   // Hapus listener saat widget dihapus
  //   HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
  //   super.dispose();
  // }

  // cek validasi tombol
  // bool _handleKeyEvent(KeyEvent event) {
  //   if (event is KeyDownEvent) {
  //     if (event.logicalKey == LogicalKeyboardKey.goBack) {
  //       // Lakukan sesuatu ketika tombol kembali ditekan
  //       logger.i('Tombol kembali ditekan');
  //       return true; // Kembalikan true jika event berhasil ditangani
  //     }
  //   }
  //   return false; // Kembalikan false jika event tidak ditangani
  // }

  // cek tombol android
  // bool _handleKeyEvent(KeyEvent event) {
  //   if (event is KeyDownEvent) {
  //     // Lakukan sesuatu ketika key event terjadi
  //     logger.i('Key event: ${event.logicalKey.debugName}');
  //     return true; // Kembalikan true jika event berhasil ditangani
  //   }
  //   return false; // Kembalikan false jika event tidak ditangani
  // }

  @override
  Widget build(BuildContext context) {
    /// Status bar dan navigation bar warna
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: LightAndDarkMode.primaryColor(context),
      systemNavigationBarColor: LightAndDarkMode.bottomNavBar(context),
    ));
    ResponsiveNavigationBottomBar.init(context);
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        await ExitApp.handlePop(context);
      },
      child: Scaffold(
        bottomNavigationBar: Obx(
              () => CustomBottomNavigationBar(
            selectedIndex: controller.selectedIndex.value,
            onItemSelected: (index) => controller.selectedIndex.value = index,
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      ),
    );
  }
}

class ExitApp {
  static DateTime? currentBackPressTime;

  static Future<void> handlePop(BuildContext context) async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds:
        2))
    {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Tekan sekali lagi untuk keluar aplikasi !!!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      Navigator.pushReplacementNamed(context, RoutePaths.login);
    }
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  NavigationController();

  List<Widget> get screens {
    return [
      Beranda(
        navigationController: this,
      ),
      Rekening(
        navigationController: this,
      ),
      const Notifikasi(),
      const Akun(),
    ];
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: LightAndDarkMode.navbarBackground(context),
      child: Row(
        children: <Widget>[
          buildTabItem(
            index: 0,
            icon: Icons.home_outlined,
            label: Strings.navigationBarBeranda,
          ),
          buildTabItem(
            index: 1,
            icon: Icons.account_balance_wallet_outlined,
            label: Strings.navigationBarRekening,
          ),
          buildTabItem(
            index: 2,
            icon: Icons.notifications_outlined,
            label: Strings.navigationBarNotifikasi,
          ),
          buildTabItem(
            index: 3,
            icon: Icons.person_outline,
            label: Strings.navigationBarAkun,
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final isSelected = index == selectedIndex;
    final color = isSelected ? const Color(0xFF1B3E5F) : const Color(0xFF5D5C58);

    return
      Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onItemSelected(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: color,
                  size: ResponsiveNavigationBottomBar.navigationBottomBarIconSize,
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontSize: isSelected ?
                    ResponsiveNavigationBottomBar.navigationBottomBarTextFocusFontSize :
                    ResponsiveNavigationBottomBar.navigationBottomBarTextUnFocusFontSize,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

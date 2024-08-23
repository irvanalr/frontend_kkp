import 'package:http/http.dart' as http;

abstract class ApiServices {
  Future<http.Response> getTokenApiKey();
  Future<http.Response> userLogin(String getApiKey, String namaPengguna, String kataSandi);
  Future<http.Response> userLogout(String getApiKey, String loginKey, String namaPengguna);
  Future<http.Response> userGantiPassword(String getApiKey, String loginKey, String passwordLama, String passwordBaru, String namaPengguna);
  Future<http.Response> rekeningUtama(String getApiKey, String loginKey, String namaPengguna);
  Future<http.Response> listTabunganSimpanan(String getApiKey, String loginKey, String namaPengguna);
  Future<http.Response> listRekeningDepositSimpananBerjangka(String getApiKey, String loginKey, String namaPengguna);
  Future<http.Response> listRekeningPembiayaan(String getApiKey, String loginKey, String namaPengguna);
  Future<http.Response> list5transaksiTabungan(String getApiKey, String loginKey, String listTabunganCode, String namaPengguna);
  Future<http.Response> list10transaksiTabungan(String getApiKey, String loginKey, String listTabunganCode, String namaPengguna);
  Future<http.Response> list20transaksiTabungan(String getApiKey, String loginKey, String listTabunganCode, String namaPengguna);
  Future<http.Response> list5transaksiTabunganWithDate(String getApiKey, String loginKey, String listTabunganCode, String date, String namaPengguna);
  Future<http.Response> list10transaksiTabunganWithDate(String getApiKey, String loginKey, String listTabunganCode, String date, String namaPengguna);
  Future<http.Response> list20transaksiTabunganWithDate(String getApiKey, String loginKey, String listTabunganCode, String date, String namaPengguna);
  Future<http.Response> informasiRekeningSimpanan(String getApiKey, String loginKey, String code, String namaPengguna);
  Future<http.Response> informasiUsers(String getApiKey, String loginKey, String namaPengguna);
}
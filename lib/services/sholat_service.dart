import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SholatService {
  String get _baseUrl => dotenv.env['API_JADWAL_SHOLAT'] ?? '';

  Future<Map<String, dynamic>?> fetchJadwalSholat(
      String idLokasi, String datePath) async {
    final url = Uri.parse('$_baseUrl/jadwal/$idLokasi/$datePath');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        return body['data'];
      }
    } catch (e) {
      print('Exception: $e');
    }
    return null;
  }

  // ! Cari Kota berdasarkan nama
  Future<List<dynamic>> cariKota(String namaKota) async {
    final url = Uri.parse('$_baseUrl/kota/cari/$namaKota');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        return body['data'] ?? [];
      }
    } catch (e) {
      print('Exception Cari Kota: $e');
    }
    return [];
  }
}

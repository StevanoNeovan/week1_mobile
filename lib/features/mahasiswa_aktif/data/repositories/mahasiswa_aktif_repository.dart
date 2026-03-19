import 'dart:convert';
import 'package:week1_mobile/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

// =============================================
// VERSI HTTP
// =============================================
class MahasiswaAktifRepository {
  /// Mendapatkan daftar mahasiswa aktif dari API /posts menggunakan HTTP
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(data); // Debug: Tampilkan data yang sudah di-decode
      return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      throw Exception(
        'Gagal memuat data mahasiswa aktif: ${response.statusCode}',
      );
    }
  }
}

// =============================================
// VERSI DIO
// =============================================
class MahasiswaAktifRepositoryDio {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Accept': 'application/json'},
    ),
  );

  /// Mendapatkan daftar mahasiswa aktif menggunakan Dio
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    try {
      final response = await _dio.get('/posts');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
      } else {
        throw Exception(
          'Gagal memuat data mahasiswa aktif: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
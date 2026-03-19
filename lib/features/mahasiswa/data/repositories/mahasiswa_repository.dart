import 'dart:convert';
import 'package:week1_mobile/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

// =============================================
// VERSI HTTP
// =============================================
class MahasiswaRepository {
  /// Mendapatkan daftar mahasiswa dari API /comments menggunakan HTTP
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(data); // Debug: Tampilkan data yang sudah di-decode
      return data.map((json) => MahasiswaModel.fromJson(json)).toList();
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Gagal memuat data mahasiswa: ${response.statusCode}');
    }
  }
}

// =============================================
// VERSI DIO
// =============================================
class MahasiswaRepositoryDio {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Accept': 'application/json'},
    ),
  );

  /// Mendapatkan daftar mahasiswa menggunakan Dio
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final response = await _dio.get('/comments');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => MahasiswaModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data mahasiswa: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
import 'package:week1_mobile/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      MahasiswaModel(nama: 'Andi Firmansyah', nim: '2024001', email: 'andi.f@student.example.com', jurusan: 'Teknik Informatika', semester: 6),
      MahasiswaModel(nama: 'Bela Safitri', nim: '2024002', email: 'bela.s@student.example.com', jurusan: 'Teknik Informatika', semester: 4),
      MahasiswaModel(nama: 'Cahyo Nugroho', nim: '2024003', email: 'cahyo.n@student.example.com', jurusan: 'Sistem Informasi', semester: 2),
      MahasiswaModel(nama: 'Dewi Puspita', nim: '2024004', email: 'dewi.p@student.example.com', jurusan: 'Teknik Informatika', semester: 8),
      MahasiswaModel(nama: 'Eko Prasetyo', nim: '2024005', email: 'eko.p@student.example.com', jurusan: 'Sistem Informasi', semester: 6),
      MahasiswaModel(nama: 'Fitri Handayani', nim: '2024006', email: 'fitri.h@student.example.com', jurusan: 'Teknik Informatika', semester: 4),
    ];
  }
}
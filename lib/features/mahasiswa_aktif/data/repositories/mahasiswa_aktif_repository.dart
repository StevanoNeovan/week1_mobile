import 'package:week1_mobile/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      MahasiswaAktifModel(nama: 'Andi Firmansyah', nim: '2024001', email: 'andi.f@student.example.com', jurusan: 'Teknik Informatika', semester: 6, ipk: 3.75),
      MahasiswaAktifModel(nama: 'Bela Safitri', nim: '2024002', email: 'bela.s@student.example.com', jurusan: 'Teknik Informatika', semester: 4, ipk: 3.60),
      MahasiswaAktifModel(nama: 'Cahyo Nugroho', nim: '2024003', email: 'cahyo.n@student.example.com', jurusan: 'Sistem Informasi', semester: 2, ipk: 3.45),
      MahasiswaAktifModel(nama: 'Dewi Puspita', nim: '2024004', email: 'dewi.p@student.example.com', jurusan: 'Teknik Informatika', semester: 4, ipk: 3.80),
    ];
  }
}
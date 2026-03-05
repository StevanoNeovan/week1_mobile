import 'dart:io';

// ========================
// a. CLASS
// ========================
class Mahasiswa {
  String nama = "Anang";
  int? nim;
  String? jurusan;

  void tampilkanData() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
}

// ========================
// c. EXTENDS
// ========================
class MahasiswaAktif extends Mahasiswa {
  String statusAktif = "Aktif";
  int semester;

  MahasiswaAktif({required this.semester});

  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Status: $statusAktif");
    print("Semester: $semester");
  }
}

class MahasiswaAlumni extends Mahasiswa {
  int tahunLulus;
  String statusAlumni = "Alumni";

  MahasiswaAlumni({required this.tahunLulus});

  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Status: $statusAlumni");
    print("Tahun Lulus: $tahunLulus");
  }
}

// ========================
// d. MIXIN
// ========================
mixin KemampuanMengajar {
  void mengajar(String mataKuliah) {
    print("Mengajar mata kuliah: $mataKuliah");
  }
}

mixin KemampuanPenelitian {
  void melakukanPenelitian(String topik) {
    print("Melakukan penelitian tentang: $topik");
  }
}

mixin KemampuanPublikasi {
  void mempublikasikan(String judul) {
    print("Mempublikasikan karya: $judul");
  }
}

// Class Dosen extends Mahasiswa + mixin
class Dosen extends Mahasiswa
    with KemampuanMengajar, KemampuanPenelitian, KemampuanPublikasi {
  String nip;
  String jabatan;

  Dosen({required this.nip, required this.jabatan});

  @override
  void tampilkanData() {
    super.tampilkanData();
    print("NIP: $nip");
    print("Jabatan: $jabatan");
  }
}

// Class Fakultas extends Mahasiswa + mixin
class Fakultas extends Mahasiswa
    with KemampuanPenelitian, KemampuanPublikasi {
  String namaFakultas;
  String dekan;

  Fakultas({required this.namaFakultas, required this.dekan});

  @override
  void tampilkanData() {
    print("Nama Fakultas: $namaFakultas");
    print("Dekan: $dekan");
  }
}

void main() {
  // ========================
  // a. CLASS - ubah nama
  // ========================
  print("=== CLASS ===");
  var mahasiswa1 = Mahasiswa();
  mahasiswa1.tampilkanData();

  stdout.write("Masukkan nama baru: ");
  String? namaBaru = stdin.readLineSync();
  if (namaBaru != null && namaBaru.isNotEmpty) {
    mahasiswa1.nama = namaBaru;
    print("Nama berhasil diubah.");
    mahasiswa1.tampilkanData();
  } else {
    print("Nama tidak boleh kosong.");
  }

  // ========================
  // b. OBJECT - input data
  // ========================
  print("\n=== OBJECT ===");
  Mahasiswa mahasiswa = Mahasiswa();
  stdout.write("Masukkan Nama Mahasiswa: ");
  mahasiswa.nama = stdin.readLineSync() ?? '';
  stdout.write("Masukkan NIM Mahasiswa: ");
  mahasiswa.nim = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  stdout.write("Masukkan Jurusan Mahasiswa: ");
  mahasiswa.jurusan = stdin.readLineSync();
  mahasiswa.tampilkanData();

  // ========================
  // c. EXTENDS
  // ========================
  print("\n=== EXTENDS: MahasiswaAktif ===");
  MahasiswaAktif aktif = MahasiswaAktif(semester: 4);
  aktif.nama = "Budi";
  aktif.nim = 2024001;
  aktif.jurusan = "Teknik Informatika";
  aktif.tampilkanData();

  print("\n=== EXTENDS: MahasiswaAlumni ===");
  MahasiswaAlumni alumni = MahasiswaAlumni(tahunLulus: 2022);
  alumni.nama = "Citra";
  alumni.nim = 2019001;
  alumni.jurusan = "Sistem Informasi";
  alumni.tampilkanData();

  // ========================
  // d. MIXIN
  // ========================
  print("\n=== MIXIN: Dosen ===");
  Dosen dosen = Dosen(nip: "198501012010011001", jabatan: "Lektor");
  dosen.nama = "Dr. Ananks";
  dosen.jurusan = "Teknik Informatika";
  dosen.tampilkanData();
  dosen.mengajar("Pemrograman Mobile");
  dosen.melakukanPenelitian("Kecerdasan Buatan");
  dosen.mempublikasikan("Jurnal AI terapan");

  print("\n=== MIXIN: Fakultas ===");
  Fakultas fak = Fakultas(
    namaFakultas: "Fakultas Teknik",
    dekan: "Prof. Dr. Suyanto",
  );
  fak.tampilkanData();
  fak.melakukanPenelitian("Energi Terbarukan");
  fak.mempublikasikan("Prosiding Internasional");
}
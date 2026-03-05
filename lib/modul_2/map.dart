import 'dart:io';

void main() {
  // ===============================
  // INPUT SINGLE DATA MAHASISWA
  // ===============================
  print("=== INPUT DATA MAHASISWA ===");

  stdout.write("Masukkan NIM: ");
  String nim = stdin.readLineSync()!;

  stdout.write("Masukkan Nama: ");
  String nama = stdin.readLineSync()!;

  stdout.write("Masukkan Jurusan: ");
  String jurusan = stdin.readLineSync()!;

  stdout.write("Masukkan IPK: ");
  String ipk = stdin.readLineSync()!;

  Map<String, String> mahasiswa = {
    'nim': nim,
    'nama': nama,
    'jurusan': jurusan,
    'ipk': ipk
  };

  print("\nData Mahasiswa: $mahasiswa");

  // ===============================
  // OPERASI MAP
  // ===============================

  // cek data berdasarkan key
  stdout.write("\nMasukkan key yang ingin dicek: ");
  String key = stdin.readLineSync()!;

  if (mahasiswa.containsKey(key)) {
    print("Value dari '$key' adalah: ${mahasiswa[key]}");
  } else {
    print("Key tidak ditemukan");
  }

  // ubah data
  stdout.write("\nMasukkan key yang ingin diubah: ");
  String ubahKey = stdin.readLineSync()!;

  if (mahasiswa.containsKey(ubahKey)) {
    stdout.write("Masukkan value baru: ");
    String valueBaru = stdin.readLineSync()!;
    mahasiswa[ubahKey] = valueBaru;
    print("Data berhasil diubah");
  } else {
    print("Key tidak ditemukan");
  }

  // hapus data
  stdout.write("\nMasukkan key yang ingin dihapus: ");
  String hapusKey = stdin.readLineSync()!;

  mahasiswa.remove(hapusKey);
  print("Data berhasil dihapus");

  // jumlah data
  print("\nJumlah data dalam map: ${mahasiswa.length}");

  // tampilkan semua key
  print("\nSemua Key:");
  mahasiswa.keys.forEach((k) {
    print(k);
  });

  // tampilkan semua value
  print("\nSemua Value:");
  mahasiswa.values.forEach((v) {
    print(v);
  });

  // ===============================
  // INPUT MULTIPLE MAHASISWA
  // ===============================

  print("\n=== INPUT MULTIPLE MAHASISWA ===");

  stdout.write("Masukkan jumlah mahasiswa: ");
  int jumlah = int.parse(stdin.readLineSync()!);

  List<Map<String, String>> daftarMahasiswa = [];

  for (int i = 0; i < jumlah; i++) {
    print("\n--- Mahasiswa ke-${i + 1} ---");

    stdout.write("Masukkan NIM: ");
    String nim = stdin.readLineSync()!;

    stdout.write("Masukkan Nama: ");
    String nama = stdin.readLineSync()!;

    stdout.write("Masukkan Jurusan: ");
    String jurusan = stdin.readLineSync()!;

    stdout.write("Masukkan IPK: ");
    String ipk = stdin.readLineSync()!;

    Map<String, String> data = {
      'nim': nim,
      'nama': nama,
      'jurusan': jurusan,
      'ipk': ipk
    };

    daftarMahasiswa.add(data);
  }

  // tampilkan semua mahasiswa
  print("\n=== DATA SEMUA MAHASISWA ===");

  for (int i = 0; i < daftarMahasiswa.length; i++) {
    print("Mahasiswa ke-${i + 1}: ${daftarMahasiswa[i]}");
  }
}
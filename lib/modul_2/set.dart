import 'dart:io';

// void main() {
//   Set<String> hewan= {'Elang', 'Kucing', 'Harimau'};
//   print('Hewan: $hewan');
// }

// // tambah data, tambah data duplicate, hapus data, cek data, jumlah data, looping data set
// hewan.add('Singa');
// print('Setelah menambahkan Singa: $hewan');
// hewan.add('Kucing');
// print('Setelah menambahkan Kucing lagi: $hewan');
// hewan.remove('Elang');
// print('Setelah menghapus Elang: $hewan');
// print('Apakah Harimau ada di set? ${hewan.contains('Harimau')}');
// print('Jumlah data dalam set: ${hewan.length}');

//mengambil jumlah data dari pengguna
void main() {
  Set<String> dataSet = {};
int count = 0;

while (count <= 0) {
  stdout.write('Masukkan jumlah data set: ');
  String? input = stdin.readLineSync();
  try {
    count = int.parse(input!);
    if (count <= 0) {
      print('Angka harus lebih dari 0. Silakan coba lagi.');
    }
  } catch (e) {
    print('Input tidak valid. Silakan masukkan angka yang benar.');
  }
}

for (int i = 0; i < count; i++) {
  stdout.write('${i + 1}. ');
  String data = stdin.readLineSync()!;
  dataSet.add(data);
}

// menampilkan semua data

print('\n=== SEMUA DATA ===');

int no = 1;
for (var item in dataSet) {
  print('$no. $item');
  no++;
}

print('Total data: ${dataSet.length}');

// tambah data baru ke set
stdout.write('Masukkan data baru: ');
String dataBaru = stdin.readLineSync()!;

if (dataSet.contains(dataBaru)) {
  print('Data "$dataBaru" sudah ada di Set.');
} else {
  dataSet.add(dataBaru);
  print('Data "$dataBaru" berhasil ditambahkan!');
}

// hapus data dari set
stdout.write('Masukkan data yang ingin dihapus: ');
String hapus = stdin.readLineSync()!;

dataSet.remove(hapus);
print('Data "$hapus" berhasil dihapus!');

// cek data dari set
stdout.write('Masukkan data yang ingin dicek: ');
String cek = stdin.readLineSync()!;

if (dataSet.contains(cek)) {
  print('Data "$cek" ada di Set');
} else {
  print('Data "$cek" tidak ada di Set');
}

}


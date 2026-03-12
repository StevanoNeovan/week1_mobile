import 'dart:io';

void main() {
  List<String> names = ['Stevano', 'Neovan', 'Eka'];
  print('Names: $names');

  // add data to list

names.add('Firdaus');
print('After adding: $names');

  // mengambil data index tertentu
print('Data index 1: ${names[1]}');

  // mengubah data index tertentu
names[0] = 'Vano';
print('After updating index 0: $names');

  // menghapus data index tertentu
names.remove('Eka');
print('After Remove : $names');

  // calculate jumlah data 
print('Jumlah data: ${names.length}');

  // looping data list
print('Menampilkan setiap elemen : ');
for (String name in names) {
  print (name);
}


List<String> dataList = [];
print ('Data List sebelum diisi: $dataList');

// mengambil jumlah data dari pengguna
int count = 0;
while (count <=0) {
  stdout.write('Masukkan jumlah list: ');
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

// memasukkan data dalam list menggunakan loop
for (int i = 0; i < count; i++) {
  stdout.write('Index ke-${i + 1}: ');
  String x = stdin.readLineSync()!;
  dataList.add(x);
}

// menampilkan data list
print('Data List: ');
print(dataList);

// tampil berdasar index tertentu 
print('Data pada index 1: ${dataList[1]}');

// ubah berdasar index tertentu
dataList[0] = 'Vano';
print('Data List setelah diubah: $dataList');

// hapus berdasar index tertentu
dataList.removeAt(1);
print('Data List setelah dihapus: $dataList');

// tampilkan hasil akhir semua data menggunakan loop
print('=== Semua Data ===');
for (int i = 0; i < dataList.length; i++) {
  print('Index ke-$i: ${dataList[i]}');
}
}




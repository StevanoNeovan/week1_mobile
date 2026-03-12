import 'package:week1_mobile/features/profile/data/models/profile_model.dart';

class ProfileRepository {
  Future<ProfileModel> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return ProfileModel(
      nama: 'Admin D4TI',
      nim: '2024000',
      email: 'admin.d4ti@example.com',
      jurusan: 'Teknik Informatika D4',
      angkatan: '2024',
      alamat: 'Surabaya, Jawa Timur',
      noHp: '081234567890',
    );
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:week1_mobile/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:week1_mobile/features/mahasiswa/data/repositories/mahasiswa_repository.dart';

// ——— Local storage khusus mahasiswa (key berbeda) ———————
const String _savedMahasiswaKey = 'saved_mahasiswa';

class MahasiswaLocalStorage {
  Future<void> addMahasiswaToSavedList({
    required String mahasiswaId,
    required String name,
    required String email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final rawList = prefs.getStringList(_savedMahasiswaKey) ?? [];

    final isDuplicate = rawList.any((item) {
      final map = jsonDecode(item) as Map<String, dynamic>;
      return map['mahasiswa_id'] == mahasiswaId;
    });

    if (isDuplicate) return;

    final newItem = jsonEncode({
      'mahasiswa_id': mahasiswaId,
      'name': name,
      'email': email,
      'saved_at': DateTime.now().toIso8601String(),
    });

    rawList.add(newItem);
    await prefs.setStringList(_savedMahasiswaKey, rawList);
  }

  Future<List<Map<String, String>>> getSavedMahasiswa() async {
    final prefs = await SharedPreferences.getInstance();
    final rawList = prefs.getStringList(_savedMahasiswaKey) ?? [];

    return rawList.map((item) {
      final map = jsonDecode(item) as Map<String, dynamic>;
      return {
        'mahasiswa_id': (map['mahasiswa_id'] ?? '').toString(),
        'name': (map['name'] ?? '').toString(),
        'email': (map['email'] ?? '').toString(),
        'saved_at': (map['saved_at'] ?? '').toString(),
      };
    }).toList();
  }

  Future<void> removeSavedMahasiswa(String mahasiswaId) async {
    final prefs = await SharedPreferences.getInstance();
    final rawList = prefs.getStringList(_savedMahasiswaKey) ?? [];

    rawList.removeWhere((item) {
      final map = jsonDecode(item) as Map<String, dynamic>;
      return map['mahasiswa_id'] == mahasiswaId;
    });

    await prefs.setStringList(_savedMahasiswaKey, rawList);
  }

  Future<void> clearSavedMahasiswa() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_savedMahasiswaKey);
  }
}

// ——— Providers ————————————————————————————————————————
final mahasiswaRepositoryProvider = Provider<MahasiswaRepository>((ref) {
  return MahasiswaRepository();
});

final mahasiswaLocalStorageProvider = Provider<MahasiswaLocalStorage>((ref) {
  return MahasiswaLocalStorage();
});

final savedMahasiswaProvider =
    FutureProvider<List<Map<String, String>>>((ref) async {
  final storage = ref.watch(mahasiswaLocalStorageProvider);
  return storage.getSavedMahasiswa();
});

// StateNotifier
class MahasiswaNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {
  final MahasiswaRepository _repository;
  final MahasiswaLocalStorage _storage;

  MahasiswaNotifier(this._repository, this._storage)
    : super(const AsyncValue.loading()) {
    loadMahasiswaList();
  }

  Future<void> loadMahasiswaList() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getMahasiswaList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async => loadMahasiswaList();

  Future<void> saveSelectedMahasiswa(MahasiswaModel mahasiswa) async {
    await _storage.addMahasiswaToSavedList(
      mahasiswaId: mahasiswa.id.toString(),
      name: mahasiswa.name,
      email: mahasiswa.email,
    );
  }

  Future<void> removeSavedMahasiswa(String mahasiswaId) async {
    await _storage.removeSavedMahasiswa(mahasiswaId);
  }

  Future<void> clearSavedMahasiswa() async {
    await _storage.clearSavedMahasiswa();
  }
}

final mahasiswaNotifierProvider = StateNotifierProvider.autoDispose<
  MahasiswaNotifier,
  AsyncValue<List<MahasiswaModel>>
>((ref) {
  final repository = ref.watch(mahasiswaRepositoryProvider);
  final storage = ref.watch(mahasiswaLocalStorageProvider);
  return MahasiswaNotifier(repository, storage);
});
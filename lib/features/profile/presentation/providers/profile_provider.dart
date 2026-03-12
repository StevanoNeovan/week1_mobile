import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week1_mobile/features/profile/data/models/profile_model.dart';
import 'package:week1_mobile/features/profile/data/repositories/profile_repository.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository();
});

final profileProvider = FutureProvider.autoDispose<ProfileModel>((ref) async {
  final repository = ref.watch(profileRepositoryProvider);
  return repository.getProfile();
});
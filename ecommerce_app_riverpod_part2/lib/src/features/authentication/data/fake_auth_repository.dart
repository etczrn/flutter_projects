import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:rxdart/rxdart.dart';

class FakeAuthRepository {
  // final _subject = BehaviorSubject<AppUser>();
  Stream<AppUser?> authStateChanges() => Stream.value(null); // TODO: Update
  AppUser? get currentUser => null; // TODO: Update

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    // TODO: Implement
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    // TODO: Implement
  }

  Future<void> signOut() async {
    // TODO: Implement
  }
}

final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  // * Return instance of FakeAuthRepository
  return FakeAuthRepository();
});

// * StreamProvider needs to be auto disposeed
final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});

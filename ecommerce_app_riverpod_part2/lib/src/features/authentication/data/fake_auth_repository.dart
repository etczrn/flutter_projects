import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// * FakeAuthRepository class will define a clear interface
// * that the rest of the app can use when it comes to authentication
// * This will include methods for signing in and signing out,
// * along with an authStateChanges() stream that we can use to observe the authentication state

// * Steps:
// * 1 - Decide what your API should look like (public interface)
// * 2 - Implement it
class FakeAuthRepository {
  // * This stream will just return a single value null that means 'user not authenticated'
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

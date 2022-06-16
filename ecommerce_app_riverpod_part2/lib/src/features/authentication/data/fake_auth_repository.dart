import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepository {
  Stream<AppUser?> authStateChanges() => Stream.value(null);
  AppUser? get currentUser => null;
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

// * In FirebaseAuthRepository, we could implement all these methods
// * using the "firebase_auth" package under the hood (cover this in course #2)
class FirebaseAuthRepository implements AuthRepository {
  @override
  Stream<AppUser?> authStateChanges() => Stream.value(null); // TODO: Update
  @override
  AppUser? get currentUser => null; // TODO: Update

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    // TODO: Implement
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    // TODO: Implement
  }

  @override
  Future<void> signOut() async {
    // TODO: Implement
  }
}

// * FakeAuthRepository class will define a clear interface
// * that the rest of the app can use when it comes to authentication
// * This will include methods for signing in and signing out,
// * along with an authStateChanges() stream that we can use to observe the authentication state

// * Steps:
// * 1 - Decide what your API should look like (public interface)
// * 2 - Implement it
class FakeAuthRepository implements AuthRepository {
  // * This stream will just return a single value null that means 'user not authenticated'
  @override
  Stream<AppUser?> authStateChanges() => Stream.value(null); // TODO: Update
  @override
  AppUser? get currentUser => null; // TODO: Update

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    // TODO: Implement
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    // TODO: Implement
  }

  @override
  Future<void> signOut() async {
    // TODO: Implement
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // * Return instance of FakeAuthRepository
  // * Now that we have defined abstract class AuthRepository
  // * we could choose to return what instance we want to use
  const isFake = String.fromEnvironment('useFakeRepos') == 'true';
  return isFake ? FakeAuthRepository() : FirebaseAuthRepository();
});

// * StreamProvider needs to be auto disposeed
final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});

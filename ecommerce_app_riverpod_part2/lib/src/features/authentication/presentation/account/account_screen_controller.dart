import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// * StateNotifier is a very important class for state management in Riverpod.
// * It is an observable class that stores a single immutable state
// * (unlike ChangeNotifier which is mutable and can store multiple state variables).
// * Things to notice:
// * - Always declare StateNotifier with a type (in this case, AsyncValue<void>)
// * - Always pass an initial value in the constructor
// * - The state should be set with the assigment operator (=).
// * This will cause any listener widgets to rebuild
// * - Always use StateNotifierProvider to declare the corresponding provider:
class AccountScreenController extends StateNotifier<AsyncValue<void>> {
  AccountScreenController({required this.authRepository})
      : super(const AsyncValue<void>.data(null));

  final FakeAuthRepository authRepository;

  Future<void> signOut() async {
    // set state to loading
    // sign out (using auth repository)
    // if success, set state to data
    // if error, set state to eeror
    try {
      state = const AsyncValue<void>.loading();
      await authRepository.signOut();
      state = const AsyncValue<void>.data(null);
    } catch (e) {
      state = AsyncValue<void>.error(e);
    }
  }
}

final accountScreenControllerProvider = StateNotifierProvider.autoDispose<
    AccountScreenController, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AccountScreenController(authRepository: authRepository);
});

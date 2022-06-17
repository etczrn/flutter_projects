import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/email_password_sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailPasswordSignInController
    extends StateNotifier<EmailPasswordSignInState> {
  // * When you extend StateNofitier, you always need to provide an initial value:
  // * - use default value
  // * - add it as an explicit constructor argument
  EmailPasswordSignInController({
    required EmailPasswordSignInFormType formType,
    required this.authRepository,
  }) : super(EmailPasswordSignInState(formType: formType));

  final FakeAuthRepository authRepository;

  Future<bool> submit(String email, String password) async {
    // * State object is immutable!
    // * we can only clone it using copyWith() and return a new state object
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(() => _authenticate(email, password));
    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _authenticate(String email, String password) {
    switch (state.formType) {
      case EmailPasswordSignInFormType.signIn:
        return authRepository.signInWithEmailAndPassword(email, password);
      case EmailPasswordSignInFormType.register:
        return authRepository.createUserWithEmailAndPassword(email, password);
    }
  }

  void updatedFormType(EmailPasswordSignInFormType formType) {
    state = state.copyWith(formType: formType);
  }
}

// * Note that since we decided to pass the EmailPasswordSignInFormType as a constructor argument,
// * we also had to use the .family modifier when declaring the StateNotifierProvider:
final emailPasswordSignInControllerProvider = StateNotifierProvider.autoDispose
    .family<EmailPasswordSignInController, EmailPasswordSignInState,
        EmailPasswordSignInFormType>((ref, formType) {
  final authRepository = ref.watch(authRepositoryProvider);
  return EmailPasswordSignInController(
      formType: formType, authRepository: authRepository);
});

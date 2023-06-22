import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_me/common/models/user_model.dart';
import 'package:whatsapp_me/feature/auth/repository/auth_repository.dart';

final authControllerProvider = Provider(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return AuthController(authRepository: authRepository, ref: ref);
  },
);

final userInfoAuthProvider = FutureProvider(
  (ref) {
    final authController = ref.watch(authControllerProvider);
    return authController.getCurrentUserInfo();
  },
);

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;

  AuthController({required this.authRepository, required this.ref});

  void sendSmsCode({required BuildContext context, required String phoneNumber}) async {
    authRepository.sendSmsCode(context: context, phoneNumber: phoneNumber);
  }

  void verifySmsCode({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) {
    authRepository.verifySmsCode(
      context: context,
      smsCodeId: smsCodeId,
      smsCode: smsCode,
      mounted: mounted,
    );
  }

  Future<UserModel?> getCurrentUserInfo() async {
    UserModel? user = await authRepository.getCurrentUserInfo();
  }

  void saveUserInfoToFireStore({
    required String username,
    required var profileImage,
    required BuildContext context,
    required bool mounted,
  }) async {
    authRepository.saveUserInfoToFireStore(username: username, profileImage: profileImage, ref: ref, context: context, mounted: mounted);
  }
}

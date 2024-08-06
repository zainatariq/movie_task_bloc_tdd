part of 'on_boarding_controller_cubit.dart';

abstract class SplashState {}

class InitialState extends SplashState {}

class LoadingState extends SplashState {}

class SuccessState extends SplashState {
  final bool isOpenedBefore;
  final String? token;
  final String? savedMobile;

  SuccessState({
    required this.isOpenedBefore,
    required this.token,
    required this.savedMobile,
  });
}

class ErrorState extends SplashState {
 }

class SetIsOpenedBeforeState extends SplashState {}

class AuthenticatedState extends SplashState {}

class UnAuthenticatedState extends SplashState {}
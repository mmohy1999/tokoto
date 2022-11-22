part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class ChangeIndex extends SplashState {
  final int index;
  ChangeIndex(this.index);
}

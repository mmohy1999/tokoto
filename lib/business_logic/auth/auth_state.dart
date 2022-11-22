part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class ChangeRemember extends AuthState {}
class SignInValidation extends AuthState {}
class RemoveError extends AuthState {}
class AddError extends AuthState {}

class NavigationBack  extends AuthState {}





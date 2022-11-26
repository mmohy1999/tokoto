part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ChangeFav extends ProductState {}

class ChangeImage extends ProductState {}

class ChangeColor extends ProductState {}

class ChangeCount extends ProductState {}

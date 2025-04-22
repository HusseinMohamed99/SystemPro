import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<T?> push<T>(Widget page) {
    return Navigator.push(this, MaterialPageRoute(builder: (context) => page));
  }

  Future<T?> pushReplacementNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop<T>([T? result]) => Navigator.pop(this, result);

  // ***Access the scaffold messenger for showing snack bars **
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == '';
}

extension BoolExtension on bool? {
  bool isNullOrEmpty() => this == null || this == false;
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension MapExtension<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

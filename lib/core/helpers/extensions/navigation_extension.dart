import 'package:flutter/material.dart';

/// Extension on [BuildContext] to simplify and standardize navigation.
///
/// Reduces boilerplate when navigating between routes and showing SnackBars.
extension Navigation on BuildContext {
  /// Pushes a named route onto the navigator stack.
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  /// Pushes a new [Widget] onto the stack using a [MaterialPageRoute].
  Future<T?> push<T>(Widget page) {
    return Navigator.push(this, MaterialPageRoute(builder: (context) => page));
  }

  /// Replaces the current route with a named route.
  Future<T?> pushReplacementNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Pushes a named route and removes all previous routes until [predicate]
  /// returns true.
  Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  /// Pops the current route from the navigator stack.
  void pop<T>([T? result]) => Navigator.pop(this, result);

  /// Provides access to [ScaffoldMessengerState] for showing SnackBars.
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

/// Extension on nullable [String] to check if it's null or empty.
extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == '';
}

/// Extension on nullable [bool] to treat `null` as `false`.
extension BoolExtension on bool? {
  bool isNullOrEmpty() => this == null || this == false;
}

/// Extension on nullable [List] to check if it's null or empty.
extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

/// Extension on nullable [Map] to check if it's null or empty.
extension MapExtension<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

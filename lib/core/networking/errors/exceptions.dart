class CustomException implements Exception {
  CustomException({required this.message});
  final String message;
  @override
  String toString() => message;
}

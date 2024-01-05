abstract class ErrorContract implements Exception {
  ErrorContract({required this.message});
  final String message;
}

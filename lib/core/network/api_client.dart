/// Lightweight API client abstraction for production use.
///
/// Add your preferred HTTP implementation (`dio`, `http`) behind this
/// interface without changing feature code.
abstract class ApiClient {
  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? headers,
  });
}

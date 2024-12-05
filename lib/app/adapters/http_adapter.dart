import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<http.Response> get(String url);
}

class HttpAdapter implements IHttpClient {
  final http.Client client;

  HttpAdapter(this.client);

  @override
  Future<http.Response> get(String url) async {
    return await client.get(Uri.parse(url));
  }
}

import 'package:http/http.dart' as http;

class SearchService {
  static Future<String> searchDjangoApi(String query) async {
    final String url = 'http:10.0.2.2:8000/apis/v1/?format=json';
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }
}

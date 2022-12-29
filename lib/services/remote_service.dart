import 'package:breakergame/domain/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://type.fit/api/quotes');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      String json = response.body;
      return postFromJson(json);
    }
  }
}

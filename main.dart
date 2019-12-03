// Due to private keys and huze in size only main.dart file as a sample and Screenshot of finish product.

import 'dart:async';
import 'dart:convert' show json,utf8;
import 'dart:io';
import "package:http/http.dart" as http;
import "package:googleapis_auth/auth_io.dart";
var secretCred; //make it safe

main () {

  ///installed app For Privacy iI have replaced sesitive date by LetsDing

  var accountCredentials = new ServiceAccountCredentials.fromJson({
    "private_key_id": "LetsDing",
    "private_key": "LetDIng",
    "client_email": "LetsDing",
    "client_id": "LetsDing",
    "type": "LetsDing"
  });
  var scopes = [
    'https://www.googleapis.com/auth/cloud-platform',
    'https://www.googleapis.com/auth/dialogflow'
  ];

  var client = new http.Client();
  obtainAccessCredentialsViaServiceAccount(accountCredentials, scopes, client)
      .then((AccessCredentials credentials) {
    // Access credentials are available in [credentials].
    // ...
    secretCred = credentials.accessToken.data;
    print(credentials.accessToken.data);
    client.close();
    print(fetchPost());
  });
  print("accesToken => LetsDing");
  print("DF_V2 => ");

}
  ///for dialougFlow V2 API

  Future<Post> fetchPost() async {
  var jsonData = json.encode(
  {"queryInput": {"text": {"text": "Hello", "languageCode": "en"}}});

  final response = await http.post(
  "https://dialogflow.googleapis.com/v2/projects/cxo-esyxgm/agent/sessions/758314:detectIntent",
  headers: {
  HttpHeaders
  },
  body: jsonData,

  );

  final responseJson = json.decode(response.body);
  print(responseJson);
  }

  class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
  return Post(
  userId: json['userId'],
  id: json['id'],
  title: json['title'],
  body: json['body'],
  );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class MyFireBase {
  final CollectionReference apiReference =
      FirebaseFirestore.instance.collection("apiKeys");
  String document;
  MyFireBase(this.document);

  Future<List<String>> emailJSgetApiKey() async {
    List<String> tokens = List.generate(4, (index) => 'null');
    try {
      await apiReference.doc(document).get().then((value) {
        // tokens[0] = value["private_key"]; //accessToken
        tokens[1] = value["service_id"];
        tokens[2] = value["template_id"];
        tokens[3] = value["public_key"]; //user_Id
      });
    } on Exception catch (e) {
      // TODO
      print(e);
    }
    //print(tokens);
    return tokens;
  }
}

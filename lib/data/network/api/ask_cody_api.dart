import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants/endpoint.dart';

class AskCodyApi {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getQuestions() async {
    try {
      final response=  await _fireStore
          .collection(Endpoints.questions)
          .get();
      return response.docs;
    } catch (e) {
      rethrow;
    }
  }
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getSubject(String id) async {
    try {
      final response=  await _fireStore
          .collection(Endpoints.subject)
      .where("id",isEqualTo: int.parse(id))
          .get();
      return response.docs;
    } catch (e) {
      rethrow;
    }
  }
}

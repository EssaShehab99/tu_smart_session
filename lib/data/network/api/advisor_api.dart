import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants/endpoint.dart';

class AdvisorApi {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<QueryDocumentSnapshot<Map<String, dynamic>>> getAdvisor(String userName) async {
    try {
      final response=  await _fireStore
          .collection(Endpoints.advisor)
      .where("user-name",isEqualTo: userName)
          .get();
      return response.docs.first;
    } catch (e) {
      rethrow;
    }
  }
}

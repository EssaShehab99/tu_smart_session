import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants/endpoint.dart';

class AuthApi {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Future<String> setUser(Map<String, dynamic> body) async {
    try {
      DocumentReference documentRef =
          await _fireStore.collection(Endpoints.users).add(body);
      return documentRef.id;
    } catch (e) {
      rethrow;
    }
  }

  Future<QueryDocumentSnapshot<Map<String, dynamic>>> getUser(int studentNumber, String password) async {
    try {
      final response=  await _fireStore
          .collection(Endpoints.users)
          .where("student-number", isEqualTo: studentNumber)
          .where("password", isEqualTo: password)
          .get();
      return response.docs.first;
    } catch (e) {
      rethrow;
    }
  }

  Future<QueryDocumentSnapshot<Map<String, dynamic>>> getUniversityCard(int id) async {
    try {
      final response=  await _fireStore
          .collection(Endpoints.universityCard)
          .where("id", isEqualTo: id)
          .get();
      return response.docs.first;
    } catch (e) {
      rethrow;
    }
  }

  Future<QueryDocumentSnapshot<Map<String, dynamic>>> getGymCard(int id) async {
    try {
      final response=  await _fireStore
          .collection(Endpoints.gymCard)
          .where("id", isEqualTo: id)
          .get();
      return response.docs.first;
    } catch (e) {
      rethrow;
    }
  }

  Future<QueryDocumentSnapshot<Map<String, dynamic>>> getHealthCard(int id) async {
    try {
      final response=  await _fireStore
          .collection(Endpoints.healthCard)
          .where("id", isEqualTo: id)
          .get();
      return response.docs.first;
    } catch (e) {
      rethrow;
    }
  }
}

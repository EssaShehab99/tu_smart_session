import 'package:cloud_firestore/cloud_firestore.dart';
import '/data/utils/extension.dart';
import 'constants/endpoint.dart';

class AuthApi {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Future<String?> setUser(Map<String, dynamic> body) async {
    try {
      if((await checkUser(body["student-number"]))?.data()==null) {
        DocumentReference documentRef =
          await _fireStore.collection(Endpoints.users).add(body);
        return documentRef.id;
      }else{
        return null;
      }
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
  Future<QueryDocumentSnapshot<Map<String, dynamic>>?> checkUser(int id) async {
    try {
      final response=  await _fireStore
          .collection(Endpoints.users)
          .where("student-number", isEqualTo: id)
          .get();
      return response.docs.firstOrNull;
    } catch (e) {
      rethrow;
    }
  }
  Future<bool> updateUser(String id,Map<String, dynamic> body) async {
    try {
      final response=  await _fireStore
          .collection(Endpoints.users)
          .where("id", isEqualTo: int.parse(id))
          .get();
      await _fireStore
          .collection(Endpoints.users).doc(response.docs.firstOrNull?.id).update(body);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '/data/network/http_exception.dart';
import '/data/local/sharedpref_helper/preference_variable.dart';
import '/data/local/sharedpref_helper/preferences.dart';
import '/data/models/gym_card.dart';
import '/data/models/health_card.dart';
import '/data/models/university_card.dart';
import '/data/models/user.dart';
import '/data/network/data_response.dart';
import '/data/network/api/auth_api.dart';

class AuthRepository {
  final AuthApi _authApi;
  final _preferences = Preferences.instance;
  AuthRepository(this._authApi);

  Future<Result> signUp(User user) async {
    try {
      debugPrint(
          "==========AuthRepository->signUp->user:${user.toJson()} ==========");
      final resultUniversity =
          await _authApi.getUniversityCard(user.studentNumber);
      final resultGymCard = await _authApi.getGymCard(user.studentNumber);
      final resultHealthCard = await _authApi.getHealthCard(user.studentNumber);
      user.universityCard = UniversityCard.fromJson(resultUniversity.data(),
          reference: resultUniversity.reference);
      user.gymCard = GymCard.fromJson(resultGymCard.data(),
          reference: resultGymCard.reference);
      user.healthCard = HealthCard.fromJson(resultHealthCard.data(),
          reference: resultHealthCard.reference);
      String? id=await _authApi.setUser(user.toFirebase());
      if(id==null){
        return Error(ExistUserException());
      }
      await _preferences.delete(PreferenceVariable.user);
      await _preferences.insert(
          PreferenceVariable.user, jsonEncode(user.toJson()));
      return Success(user);
    } catch (e) {
      return Error(e);
    }
  }

  Future<Result> signIn(int studentNumber, String password) async {
    try {
      debugPrint(
          "==========AuthRepository->signIn->studentNumber/password:$studentNumber / $password ==========");
      final response = await _authApi.getUser(studentNumber, password);
      final data = {
        ...response.data(),
        "university-card": (await (response.data()["university-card"]
                    as DocumentReference<Map<String, dynamic>>?)
                ?.get())
            ?.data(),
        "health-card": (await (response.data()["health-card"]
                    as DocumentReference<Map<String, dynamic>>?)
                ?.get())
            ?.data(),
        "gym-card": (await (response.data()["gym-card"]
                    as DocumentReference<Map<String, dynamic>>?)
                ?.get())
            ?.data(),
      };
      final user = User.fromJson(data);
      await _preferences.delete(PreferenceVariable.user);
      await _preferences.insert(
          PreferenceVariable.user, jsonEncode(user.toJson()));
      return Success(user);
    } catch (e) {
      return Error(e);
    }
  }

  Future<Result> getUniversityCard(int id) async {
    debugPrint(
        "==========AuthRepository->getUniversityCard->id:$id ==========");
    try {
      final response = await _authApi.getUniversityCard(id);
      return Success(UniversityCard.fromJson(response.data()));
    } catch (e) {
      return Error(e);
    }
  }

  Future<Result> getGymCard(int id) async {
    debugPrint("==========AuthRepository->getGymCard->id:$id ==========");
    try {
      final response = await _authApi.getGymCard(id);
      return Success(GymCard.fromJson(response.data()));
    } catch (e) {
      return Error(e);
    }
  }

  Future<Result> getHealthCard(int id) async {
    debugPrint("==========AuthRepository->getHealthCard->id:$id ==========");
    try {
      final response = await _authApi.getHealthCard(id);
      return Success(HealthCard.fromJson(response.data()));
    } catch (e) {
      return Error(e);
    }
  }

  Future<Result> getUserData(int studentNumber, String password) async {
    try{
      return await signIn(studentNumber, password);

    }catch (e){
      return Error(e);
    }
  }
  Future<Result> updateUser(User user) async {
    try{
       return Success(await _authApi.updateUser(user.id.toString(),user.toFirebase()));

    }catch (e){
      return Error(e);
    }
  }
  Future<Result> signOut() async {
    try{
      bool status = await _preferences.delete(PreferenceVariable.user);
      return Success(status);
    }catch (e){
      return Error(e);
    }
  }
}

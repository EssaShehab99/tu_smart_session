import 'package:flutter/material.dart';
import '/data/network/http_exception.dart';
import '/data/network/data_response.dart';
import '/data/models/user.dart';
import '/data/di/service_locator.dart';
import '/data/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final _authRepository = getIt.get<AuthRepository>();
  User? _user;
  User?  get user=>_user;
  Future<Result> signUp(User user) async{
    Result result=await _authRepository.signUp(user);
    if(result is Success){
      _user=result.value;
    }
    return result;
    }
  Future<Result> signIn(int studentNumber, String password) async{
    Result result=await _authRepository.signIn(studentNumber,password);
    if(result is Success){
      _user=result.value;
    }
    return result;
    }
    void setUser(User? user){
    _user=user;
    }
    Future<void> signOut() async {
      Result result=await _authRepository.signOut();
      if(result is Success) {
        _user=null;
      }
    }
}

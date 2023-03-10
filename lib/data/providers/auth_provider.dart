import 'package:flutter/material.dart';
import '/data/network/http_exception.dart';
import '/data/network/data_response.dart';
import '/data/models/user.dart';
import '/data/di/service_locator.dart';
import '/data/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final _authRepository = getIt.get<AuthRepository>();
  User? _user;
  User? get user => _user;
  Future<Result> signUp(User user) async {
    Result result = await _authRepository.signUp(user);
    if (result is Success) {
      _user = result.value;
    }
    return result;
  }

  Future<Result> signIn(int studentNumber, String password) async {
    Result result = await _authRepository.signIn(studentNumber, password);
    if (result is Success) {
      _user = result.value;
    }
    return result;
  }

  void setUser(User? user) {
    _user = user;
  }

  Future<void> getUserData() async {
    Result result = await _authRepository.getUserData(
        _user?.studentNumber ?? 0, _user?.password ?? "");
    if (result is Success) {
      _user = result.value;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    Result result = await _authRepository.signOut();
    if (result is Success) {
      _user = null;
    }
  }

  Future<bool> sendCode() async {
    return await _authRepository.sendCode(_user!.email);
  }

  bool verifyCode(String code) {
    return _authRepository.verifyCode(code);
  }

  Future<bool> changePassword() async {
    return await _authRepository.changePassword(
        _user!.studentNumber,_user!.email, _user!.password!);
  }

}

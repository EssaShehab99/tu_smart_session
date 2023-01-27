import 'package:flutter/foundation.dart';
import '/data/models/advisor.dart';
import '/data/network/api/advisor_api.dart';
import '/data/local/sharedpref_helper/preferences.dart';
import '/data/network/data_response.dart';

class AdvisorRepository {
  final AdvisorApi _advisorApi;
  final _preferences = Preferences.instance;
  AdvisorRepository(this._advisorApi);

  Future<Result> getAdvisor(String userName) async {
    try {
      final response = await _advisorApi.getAdvisor(userName);
      return Success(Advisor.fromJson(response.data()));
    } catch (e) {
      return Error(e);
    }
  }
}

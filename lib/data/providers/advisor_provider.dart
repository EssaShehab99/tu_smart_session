import 'package:flutter/material.dart';
import '/data/models/advisor.dart';
import '/data/network/data_response.dart';
import '/data/repositories/advisor_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import '/data/di/service_locator.dart';

class AdvisorProvider extends ChangeNotifier {
  final _advisorRepository = getIt.get<AdvisorRepository>();
  Advisor? advisor;
  Future<Result> getAdvisor(String userName) async {
    Result result = await _advisorRepository.getAdvisor(userName);
    if (result is Success) {
      advisor = result.value;
      await launchTelegram();
    }
    return result;
  }

  Future<void> launchTelegram() async {
    try {
      final url = Uri.parse("http://t.me/${advisor?.userName}");
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } catch (_) {}
  }
}

class Endpoints {
  Endpoints._privateConstructor();
  static final Endpoints _instance = Endpoints._privateConstructor();
  static Endpoints get instance => _instance;

  static const int connectionTimeout = 300;
  static const String baseUrl = "https://mentorapp-c09cf-default-rtdb.asia-southeast1.firebasedatabase.app/";
  static const users = 'users';
  static String signIn(String studentNumber) => '';
  static const universityCard='university-card';
  static const gymCard='gym-card';
  static const healthCard='health-card';
  static const questions='questions';
  static const subject='subjects';
  static const section='sections';
  static const advisor='advisor';
  static const forms='forms';
  static const places='places';

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/views/shared/button_widget.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future setData() async {
    final gymCard = [
      {
        "expire": "2023-12-08 00:00:00.000",
        "id": 43905767,
        "joining": "2023-13-06 00:00:00.000",
        "name": "Atheer Dhaifallah alharthi"
      },
      {
        "expire": "2022-02-07 00:00:00.000",
        "id": 43900002,
        "joining": "2022-02-05 00:00:00.000",
        "name": "Rana Ahmad Alkhamash"
      },
      {"id": 43900005, "name": "Raghad Manwer Algethami"},
      {"id": 43900893, "name": "Atheer Abdulaziz Alsufyani "},
      {
        "expire": "2023-12-08 00:00:00.000",
        "id": 43900889,
        "joining": "2023-13-06 00:00:00.000",
        "name": "Shahad Salih Alazwari "
      },
      {"id": 43900000, "name": "Rawan Dhaifallah Alsuwat"}
    ];
    for (var item in gymCard) {
      await _fireStore.collection("gym-card").add(item);
    }

    final healthCard = [
      {
        "blood-type": "A+",
        "date-of-birth": "2000-12-21 00:00:00.000",
        "emergency-contact-1": "+9660549314631",
        "emergency-contact-2": "+9660573739119",
        "id": 43905767,
        "name": "Atheer Dhaifallah alharthi"
      },
      {
        "blood-type": "O+",
        "date-of-birth": "2000-15-05 00:00:00.000",
        "emergency-contact-1": "+966509972361",
        "emergency-contact-2": "+966507266819",
        "id": 43900002,
        "name": "Rana Ahmad Alkhamash"
      },
      {
        "blood-type": "A+",
        "date-of-birth": "2000-01-01 00:00:00.000",
        "emergency-contact-1": "+966500000000",
        "emergency-contact-2": "+966500000001",
        "id": 43900893,
        "name": "Atheer Abdulaziz Alsufyani "
      },
      {
        "blood-type": "AB+",
        "date-of-birth": "2000-11-06 00:00:00.000",
        "emergency-contact-1": "+966556959515",
        "emergency-contact-2": "+966556959515",
        "id": 43900889,
        "name": "Shahad Salih Alazwari "
      },
      {
        "blood-type": "O+",
        "date-of-birth": "2000-01-01 00:00:00.000",
        "emergency-contact-1": "+966500000030",
        "emergency-contact-2": "+966500000004",
        "id": 43900002,
        "name": "Rana Ahmad Alkhamash "
      },
      {
        "blood-type": "O+",
        "date-of-birth": "2000-20-08 00:00:00.000",
        "emergency-contact-1": "+9665025500067",
        "emergency-contact-2": "+9665000897432",
        "id": 43900000,
        "name": "Rawan Dhiafallah Alsuwat"
      }
    ];
    for (var item in healthCard) {
      await _fireStore.collection("health-card").add(item);
    }

    final universityCard = [
      {
        "department": "Computer science",
        "id": 43900893,
        "name": "Atheer Abdulaziz Alsufyani"
      },
      {
        "department": "Computer science",
        "id": 43900889,
        "name": "Shahad Salih Alazwari"
      },
      {
        "department": "Computer science",
        "id": 43905767,
        "name": "Atheer Dhaifallah alharthi"
      },
      {
        "department": "Computer science",
        "id": 43900002,
        "name": "Rana Ahmad Alkhamash"
      },
      {
        "department": "Computer science",
        "id": 43900005,
        "name": "Raghad Manwer Algethami"
      },
      {
        "department": "Computer science",
        "id": 43900000,
        "name": "Rawan Dhaifallah Alsuwat"
      }
    ];
    for (var item in universityCard) {
      await _fireStore.collection("university-card").add(item);
    }

    final questions = [
      {"type": "none", "group": 1, "id": 1, "question": "Hi name, I'm Cody"},
      {
        "type": "none",
        "group": 1,
        "id": 2,
        "question":
            "I will help you, choose the question you want and I will answer you."
      },
      {
      "question": "1. Adding/withdrawing courses",
      "answer":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "type": "clickable",
        "group": 2,
        "id": 3,
      },
      {
        "answer":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "type": "clickable",
        "group": 2,
        "id": 4,
        "question": "2. Issuing a university card"
      },
      {
        "answer":
            "Medical care:\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "type": "clickable",
        "group": 2,
        "id": 5,
        "question": "3. Approving cooperative training intuitions"
      },
      {
        "answer":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "type": "clickable",
        "group": 2,
        "id": 6,
        "question": "4. Communicating with academic staff"
      },
      {
        "answer":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "type": "clickable",
        "group": 2,
        "id": 7,
        "question": "5. Medical care"
      },
      {
        "answer":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "type": "clickable",
        "group": 2,
        "id": 8,
        "question": "6. Official documents issuance"
      },
      {
        "id": 9,
        "question": "7. Add subject",
        "answer": "Add section",
        "type": "interactive:Please enter subject ID,Please enter section ID",
        "group": 2,
      },
      {
        "answer":
            "Arabic Language Day 3-1-2022 the place Activities building,Programing Day 7-1-2022 the place Computer and IT building, sport workshop 11-1-2022 the place Activities building",
        "type": "clickable",
        "group": 2,
        "id": 10,
        "question": "Extra curricular activities"
      },
      {
        "answer":
            "Armed Forces Hospital, King Fahad Air Base, King Abdulaziz Hospital, King Faisal Hospital, Children's Hospital",
        "type": "clickable",
        "group": 2,
        "id": 11,
        "question": "Approving cooperative training intuition"
      },
    ];
    for (var item in questions) {
      await _fireStore.collection("questions").add(item);
    }

    final advisors = [
      {
        "id": 1,
        "name": "Bara Abdullah",
        "user-name": "essashehab99",
      },
      {
        "id": 2,
        "name": "Ahmed Ali Abdullah",
        "user-name": "test11",
      },
    ];
    for (var item in advisors) {
      await _fireStore.collection("advisor").add(item);
    }

    final levels = [
      {
        "id": 1,
        "subjects": [
          2004111,
          202126,
          501112,
          999805,
        ],
      },
      {
        "id": 2,
        "subjects": [
          2011211,
          501110,
          990311,
          999806,
        ],
      },
      {
        "id": 3,
        "subjects": [
          105115,
          204124,
          501125,
          503121,
          990211,
        ],
      },
      {
        "id": 4,
        "subjects": [
          202261,
          501220,
          990113,
          990114,
          990312,
          999808,
        ],
      },
      {
        "id": 5,
        "subjects": [
          202263,
          203200,
          501222,
          999808,
        ],
      },
      {
        "id": 6,
        "subjects": [
          2004112,
          203207,
          503221,
        ],
      },
      {
        "id": 7,
        "subjects": [
          202262,
          501324,
          501326,
          501352,
        ],
      },
      {
        "id": 8,
        "subjects": [
          2004313,
          202364,
          501323,
          502372,
        ],
      },
      {
        "id": 9,
        "subjects": [
          202368,
          501343,
          503323,
          990314,
          990315,
          990412,
          999809,
          999814,
          999815,
          999821,
        ],
      },
      {
        "id": 10,
        "subjects": [
          2004414,
          501435,
          501446,
          503410,
        ],
      },
      {
        "id": 11,
        "subjects": [
          500321,
          501453,
          501472,
          501481,
        ],
      },
      {
        "id": 12,
        "subjects": [
          501427,
          501461,
          501471,
          501573,
          501585,
          502478,
          502536,
        ],
      },
      {
        "id": 13,
        "subjects": [
          202463,
          501554,
          501598,
        ],
      },
      {
        "id": 14,
        "subjects": [
          501454,
          501496,
          501528,
          501536,
          501599,
          502459,
          503509,
          503547,
        ],
      },
      {
        "id": 15,
        "subjects": [
          501424,
          501513,
          501562,
          501570,
          501575,
          501582,
          501583,
          501588,
          501592,
          501593,
          501595,
          502571,
          503527,
          503538,
          503578,
        ],
      },
    ];
    for (var item in levels) {
      await _fireStore.collection("levels").add(item);
    }

    final subjects = [
      {
        "name": "MicroProcessors & Assembly Language",
        "id": 501326,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [503221],
      },
      {
        "id": 2004111,
        "sections": [1, 2, 3, 4],
        "name": "Fundamentals of Islamic Culture",
        "hours": 2,
      },
      {
        "id": 202126,
        "sections": [1, 2, 3, 4],
        "name": "Fundamentals of Mathematics",
        "hours": 3,
      },
      {
        "id": 501112,
        "sections": [1, 2, 3, 4],
        "name": "Computer Skills",
        "hours": 2,
      },
      {
        "id": 999805,
        "sections": [1, 2, 3, 4],
        "name": "Intensive English Intensive (1)",
        "hours": 2,
      },
      {
        "id": 2011211,
        "sections": [1, 2, 3, 4],
        "name": "General Biology",
        "hours": 3,
      },
      {
        "id": 501110,
        "sections": [1, 2, 3, 4],
        "name": "General Biology",
        "hours": 2,
      },
      {
        "id": 990311,
        "sections": [1, 2, 3, 4],
        "name": "University Study Skills ",
        "hours": 2,
      },
      {
        "id": 999806,
        "sections": [1, 2, 3, 4],
        "name": "Intensive English Intensive (2)",
        "hours": 2,
        "requirement": [999805],
      },
      {
        "id": 105115,
        "sections": [1, 2, 3, 4],
        "name": "History of the Kingdom",
        "hours": 2,
      },
      {
        "id": 204124,
        "sections": [1, 2, 3, 4],
        "name": "General Chemistry",
        "hours": 2,
      },
      {
        "id": 501125,
        "sections": [1, 2, 3, 4],
        "name": "Scientific Computing",
        "hours": 2,
      },
      {
        "id": 503121,
        "sections": [1, 2, 3, 4],
        "name": "Computer Aided Drawing",
        "sections": [1, 2, 3, 4],
        "hours": 1,
      },
      {
        "id": 990211,
        "sections": [1, 2, 3, 4],
        "name": "990211",
        "hours": 2,
      },
      {
        "id": 202261,
        "sections": [1, 2, 3, 4],
        "name": "Calculus (1)",
        "hours": 3,
      },
      {
        "id": 501215,
        "sections": [1, 2, 3, 4],
        "name": "Computer Programming (1)",
        "hours": 3,
      },
      {
        "id": 501220,
        "sections": [1, 2, 3, 4],
        "name": "Computer Programming (1)",
        "hours": 3,
      },
      {
        "id": 990113,
        "sections": [1, 2, 3, 4],
        "name": "Health Education",
        "hours": 3,
      },
      {
        "id": 990114,
        "sections": [1, 2, 3, 4],
        "name": "Saudi women Empowerment",
        "hours": 2,
      },
      {
        "id": 999811,
        "sections": [1, 2, 3, 4],
        "name": "English for Specific Purpose (1)",
        "hours": 2,
      },
      {
        "id": 999808,
        "sections": [1, 2, 3, 4],
        "name": "English for Specific Purpose (2)",
        "hours": 2,
        "requirement": [999811],
      },
      {
        "id": 202263,
        "sections": [1, 2, 3, 4],
        "name": "Calculus (2)",
        "hours": 3,
        "requirement": [202261],
      },
      {
        "id": 203206,
        "sections": [1, 2, 3, 4],
        "name": "Physics (1)",
        "hours": 4,
      },
      {
        "id": 501222,
        "sections": [1, 2, 3, 4],
        "name": "Computer Programming (2)",
        "hours": 3,
        "requirement": [501220],
      },
      {
        "id": 999808,
        "sections": [1, 2, 3, 4],
        "name": "English for Specific Purpose (2)",
        "hours": 2,
      },
      {
        "name": "Islamic Culture (Morals & Values)",
        "id": 2004112,
        "sections": [1, 2, 3, 4],
        "hours": 2,
        "requirement": [2004111],
      },
      {
        "name": "Physics (2)",
        "id": 203207,
        "sections": [1, 2, 3, 4],
        "hours": 4,
        "requirement": [203200],
      },
      {
        "name": "Digital Logic Design",
        "id": 503221,
        "sections": [1, 2, 3, 4],
        "hours": 4,
        "requirement": [501215],
      },
      {
        "name": "Linear Algebra",
        "id": 202262,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Data Structures",
        "id": 501324,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [501222],
      },
      {
        "name": "MicroProcessors &Assembly Language",
        "id": 501326,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Introduction to Operating gSystems",
        "id": 501352,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [501220],
      },
      {
        "name": "Islamic culture (Social System in Islam)",
        "id": 2004313,
        "sections": [1, 2, 3, 4],
        "hours": 2,
        "requirement": [2004112],
      },
      {
        "name": "Probability and Statistics",
        "id": 202364,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [202261],
      },
      {
        "name": "Objected-oriented Programming",
        "id": 501323,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [501222],
      },
      {
        "name": "Fundamentals of Database",
        "id": 502372,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [501220],
      },
      {
        "name": "Operations Research",
        "id": 202368,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [202364],
      },
      {
        "name": "Software Engineering",
        "id": 501343,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Computer Architecture",
        "id": 503323,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [503221],
      },
      {
        "name": "French Language",
        "id": 990314,
        "sections": [1, 2, 3, 4],
        "hours": 2,
      },
      {
        "name": "Chinese Language",
        "id": 990315,
        "sections": [1, 2, 3, 4],
        "hours": 2,
      },
      {
        "name": "Digital Citizenship",
        "id": 990412,
        "sections": [1, 2, 3, 4],
        "hours": 2,
      },
      {
        "name": "Presentation Skills",
        "id": 999809,
        "sections": [1, 2, 3, 4],
        "hours": 2,
      },
      {
        "name": "IELTS Preparation",
        "id": 999814,
        "sections": [1, 2, 3, 4],
        "hours": 2,
      },
      {
        "name": "Academic Writing",
        "id": 999815,
        "sections": [1, 2, 3, 4],
        "hours": 2,
      },
      {
        "name": "English and the 21st century skills",
        "id": 999821,
        "sections": [1, 2, 3, 4],
        "hours": 2,
      },
      {
        "name": "Islamic Culture (Human Rights)",
        "id": 2004414,
        "sections": [1, 2, 3, 4],
        "hours": 2,
        "requirement": [2004313],
      },
      {
        "name": "Analysis and Design of Algorithms",
        "id": 501435,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [501324],
      },
      {
        "name": "Advanced Software Engineering",
        "id": 501446,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [501343, 501324],
      },
      {
        "name": "Data Communication",
        "id": 503410,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [503221],
      },
      {
        "name": "Professional Ethics",
        "id": 500321,
        "sections": [1, 2, 3, 4],
        "hours": 2,
        "requirement": [2004414],
      },
      {
        "name": "Professional Ethics",
        "id": 500321,
        "sections": [1, 2, 3, 4],
        "hours": 2,
      },
      {
        "name": "Operating Systems",
        "id": 501453,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [503323],
      },
      {
        "name": "Computer Graphics",
        "id": 501472,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [501324],
      },
      {
        "name": "Artificial Intelligence",
        "id": 501481,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [501324],
      },
      {
        "name": "Programming Paradigms",
        "id": 501427,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [501324, 501323],
      },
      {
        "name": "Internet Technologies",
        "id": 501461,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [2004111],
      },
      {
        "name": "Modeling and Simulation",
        "id": 501471,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Image Processing",
        "id": 501573,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Expert Systems",
        "id": 501585,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Data Warehouse",
        "id": 502478,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Human Computer Interaction",
        "id": 502536,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Advanced Mathematics",
        "id": 202463,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [202364],
      },
      {
        "name": "Distributed Systems",
        "id": 501554,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [501435],
      },
      {
        "name": "Capstone Project (1)",
        "id": 501598,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [501461],
      },
      {
        "name": "Compiler Design",
        "id": 501454,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Special Topics in Computer Systems",
        "id": 501496,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Game Design and Programming",
        "id": 501528,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Parallel and Distributed Algorithms",
        "id": 501536,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Capstone Project (2)",
        "id": 501599,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [501598, 501435],
      },
      {
        "name": "Computer Systems Security",
        "id": 502459,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [503442],
      },
      {
        "name": "Computer Networks",
        "id": 503442,
        "sections": [1, 2, 3, 4],
        "hours": 3,
        "requirement": [503410],
      },
      {
        "name": "Embedded Systems",
        "id": 503509,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Network Programming",
        "id": 503547,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Computer Vision",
        "id": 501424,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Cryptology",
        "id": 501513,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Pervasive Computing",
        "id": 501562,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Selected Topics in Artificial lntelligence",
        "id": 501570,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Multimedia Systems",
        "id": 501575,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Neural Networks",
        "id": 501582,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Pattern Recognition",
        "id": 501583,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Field Experience",
        "id": 501588,
        "sections": [1, 2, 3, 4],
        "hours": 2,
      },
      {
        "name": "Special Topics in Programming Languages",
        "id": 501592,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Special Topics in Algorithms",
        "id": 501593,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Special Topics in Database Systems",
        "id": 501595,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Data Mining",
        "id": 502571,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Mobile Computing",
        "id": 503527,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Analysis of Computer Systems Performance",
        "id": 503538,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      },
      {
        "name": "Robotics",
        "id": 503578,
        "sections": [1, 2, 3, 4],
        "hours": 3,
      }
    ];
    for (var item in subjects) {
      await _fireStore.collection("subjects").add(item);
    }

    final library = [
      {
        "id": 1,
        "name": "Digital library training course request form",
        "url":
            "https://www.tu.edu.sa/Attachments/7615aec0-d470-400f-801e-a374e8a59cce_.pdf"
      },
      {
        "id": 2,
        "name": "Audio book equipment borrowing form",
        "url":
            "https://www.tu.edu.sa/Attachments/125d134d-9418-45ae-acd1-affe8e6ac2cb_.pdf"
      },
      {
        "id": 3,
        "name": "Book proposal template",
        "url":
            "https://www.tu.edu.sa/Attachments/42417ee0-39eb-4ccd-bc67-49a03e674762_.pdf"
      },
      {
        "id": 4,
        "name": "Induction program evaluation form",
        "url":
            "https://www.tu.edu.sa/Attachments/420e14ce-3c1a-4705-921e-a949ceb344b4_.pdf"
      },
      {
        "id": 5,
        "name": "Course evaluation form",
        "url":
            "https://www.tu.edu.sa/Attachments/69cba306-ee44-4197-89cd-74b9f46d4d28_.pdf"
      },
      {
        "id": 6,
        "name": "Form of booking a hall or study vacancy",
        "url":
            "https://www.tu.edu.sa/Attachments/45c3c02e-b3d2-4006-8076-81c344af03fc_.pdf"
      },
      {
        "id": 7,
        "name":
            "Hall reservation form in the central library in the male students' section",
        "url":
            "https://www.tu.edu.sa/Attachments/971642f2-e4db-4041-a3a2-6b8d1a723ed1_.pdf"
      },
      {
        "id": 8,
        "name": "Central Library visit form",
        "url":
            "https://www.tu.edu.sa/Attachments/9f600428-e780-48b6-8402-97f747e6cc4f_.pdf"
      },
      {
        "id": 9,
        "name": "Training course request form",
        "url":
            "https://www.tu.edu.sa/Attachments/0b2db766-a203-4dde-bbbf-d91bff14aa87_.pdf"
      },
      {
        "id": 10,
        "name": "Information request form",
        "url":
            "https://www.tu.edu.sa/Attachments/558c4085-95fb-47dd-90eb-c483741dab4a_.pdf"
      }
    ];
    for (var item in library) {
      await _fireStore.collection("library").add(item);
    }

    final sections = [
      {
        "id": 1,
        "time": "0000-00-00T13:15:54.000000Z",
        "day": "sun",
        "room": 154847
      },
      {
        "id": 2,
        "time": "0000-00-00T13:15:54.000000Z",
        "day": "sun",
        "room": 154847
      },
      {
        "id": 3,
        "time": "0000-00-00T13:15:54.000000Z",
        "day": "sun",
        "room": 154847
      },
      {
        "id": 4,
        "time": "0000-00-00T13:15:54.000000Z",
        "day": "sun",
        "room": 154847
      },
    ];
    for (var item in sections) {
      await _fireStore.collection("sections").add(item);
    }
  }

  Future deleteData() async {
    final advisor = await _fireStore.collection("advisor").get();
    for (var element in advisor.docs) {
      _fireStore.collection("advisor").doc(element.id).delete();
    }
    final gymCard = await _fireStore.collection("gym-card").get();
    for (var element in gymCard.docs) {
      _fireStore.collection("gym-card").doc(element.id).delete();
    }
    final healthCard = await _fireStore.collection("health-card").get();
    for (var element in healthCard.docs) {
      _fireStore.collection("health-card").doc(element.id).delete();
    }
    final levels = await _fireStore.collection("levels").get();
    for (var element in levels.docs) {
      _fireStore.collection("levels").doc(element.id).delete();
    }
    final library = await _fireStore.collection("library").get();
    for (var element in library.docs) {
      _fireStore.collection("library").doc(element.id).delete();
    }
    final questions = await _fireStore.collection("questions").get();
    for (var element in questions.docs) {
      _fireStore.collection("questions").doc(element.id).delete();
    }
    final sections = await _fireStore.collection("sections").get();
    for (var element in sections.docs) {
      _fireStore.collection("sections").doc(element.id).delete();
    }
    final subjects = await _fireStore.collection("subjects").get();
    for (var element in subjects.docs) {
      _fireStore.collection("subjects").doc(element.id).delete();
    }
    final universityCard = await _fireStore.collection("university-card").get();
    for (var element in universityCard.docs) {
      _fireStore.collection("university-card").doc(element.id).delete();
    }
    final users = await _fireStore.collection("users").get();
    for (var element in users.docs) {
      _fireStore.collection("users").doc(element.id).delete();
    }
  }

  Future fetchData() async {
    final first = await _fireStore.collection("test-doc").get();
    DocumentReference<Map<String, dynamic>> data =
        first.docs.map((e) => e.data()).first["test"];
    final docRef = await data.get();
    final xxx = docRef.data();
    debugPrint("===========TestScreen->fetchData->data:$data ==========");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonWidget(
            onPressed: () async {
              await setData();
            },
            child: const Text("Click")),
      ),
    );
  }
}

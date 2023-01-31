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
    // final gymCard = [
    //   {
    //     "id": 43900893,
    //     "name": "Atheer Abdulaziz Alsufyani ",
    //   },
    //   {
    //     "expire": "2023-12-08 00:00:00.000",
    //     "id": 43900889,
    //     "joining": "2023-13-06 00:00:00.000",
    //     "name": "Shahad Salih Alazwari "
    //   },
    //   {
    //     "expire": "2023-12-08 00:00:00.000",
    //     "id": 43905767,
    //     "joining": "2023-13-06 00:00:00.000",
    //     "name": "Atheer Dhaifallah alharthi"
    //   },
    //   {
    //     "expire": "2022-02-07 00:00:00.000",
    //     "id": 43901447,
    //     "joining": "2022-02-05 00:00:00.000",
    //     "name": "Rana Ahmad Alkhamash"
    //   },
    //   {
    //     "id": 43902129,
    //     "name": "Raghad Manwer Algethami",
    //   },
    //   {
    //     "id": 43901231,
    //     "name": "Rawan Dhaifallah Alsuwat",
    //   }
    // ];
    // for (var item in gymCard) {
    //   await _fireStore.collection("gym-card").add(item);
    // }
    //
    // final healthCard = [
    //   {
    //     "department": "Computer science",
    //     "id": 43900893,
    //     "email": "atheer3zizz@gmail.com",
    //     "academic degree": "Bachelor",
    //     "college": "Computers and information technology",
    //     "name": "Atheer Abdulaziz Alsufyani"
    //   },
    //   {
    //     "department": "Computer science",
    //     "id": 43900889,
    //     "email": "ShooOoosh159753@gmail.com",
    //     "academic degree": "Bachelor",
    //     "college": "Computers and information technology",
    //     "name": "Shahad Salih Alazwari"
    //   },
    //   {
    //     "department": "Computer science",
    //     "id": 43905767,
    //     "email": "atheeerart@gmail.com",
    //     "academic degree": "Bachelor",
    //     "college": "Computers and information technology",
    //     "name": "Atheer Dhaifallah alharthi"
    //   },
    //   {
    //     "department": "Computer science",
    //     "id": 43901447,
    //     "email": "rnaalkhmash4@gmail.com",
    //     "academic degree": "Bachelor",
    //     "college": "Computers and information technology",
    //     "name": "Rana Ahmad Alkhamash"
    //   },
    //   {
    //     "department": "Computer science",
    //     "id": 43902129,
    //     "email": "ragh93310@gmail.com",
    //     "academic degree": "Bachelor",
    //     "college": "Computers and information technology",
    //     "name": "Raghad Manwer Algethami"
    //   },
    //   {
    //     "department": "Computer science",
    //     "id": 43901231,
    //     "email": "rawanalsuwat12@gmail.com",
    //     "academic degree": "Bachelor",
    //     "college": "Computers and information technology",
    //     "name": "Rawan Dhiafallah Alsuwat",
    //   }
    // ];
    // for (var item in healthCard) {
    //   await _fireStore.collection("health-card").add(item);
    // }
    //
    // final universityCard = [
    //   {
    //     "department": "Computer science",
    //     "id": 43900893,
    //     "email": "atheer3zizz@gmail.com",
    //     "academic-degree": "Bachelor",
    //     "college": "Computers and information technology",
    //     "name": "Atheer Abdulaziz Alsufyani"
    //   },
    //   {
    //     "department": "Computer science",
    //     "id": 43900889,
    //     "email": "ShooOoosh159753@gmail.com",
    //     "academic-degree": "Bachelor",
    //     "college": "Computers and information technology",
    //     "name": "Shahad Salih Alazwari"
    //   },
    //   {
    //     "department": "Computer science",
    //     "id": 43905767,
    //     "email": "atheeerart@gmail.com",
    //     "academic-degree": "Bachelor",
    //     "college": "Computers and information technology",
    //     "name": "Atheer Dhaifallah alharthi"
    //   },
    //   {
    //     "department": "Computer science",
    //     "id": 43901447,
    //     "email": "rnaalkhmash4@gmail.com",
    //     "academic-degree": "Bachelor",
    //     "college": "Computers and information technology",
    //     "name": "Rana Ahmad Alkhamash"
    //   },
    //   {
    //     "department": "Computer science",
    //     "id": 43902129,
    //     "email": "ragh93310@gmail.com",
    //     "academic-degree": "Bachelor",
    //     "college": "Computers and information technology",
    //     "name": "Raghad Manwer Algethami"
    //   },
    //   {
    //     "department": "Computer science",
    //     "id": 43901231,
    //     "email": "rawanalsuwat12@gmail.com",
    //     "academic-degree": "Bachelor",
    //     "college": "Computers and information technology",
    //     "name": "Rawan Dhiafallah Alsuwat",
    //   }
    // ];
    // for (var item in universityCard) {
    //   await _fireStore.collection("university-card").add(item);
    // }
    //
    final questions = [
      {
        "type": "none",
        "group": 1,
        "order": 1,
        "id": 1,
        "question": "Hi name, I'm Cody",
      },
      {
        "type": "none",
        "group": 1,
        "id": 2,
        "order": 2,
        "question":
            "I will help you, choose the question you want and I will answer you."
      },
      {
        "order": 3,
        "question": "1. Adding/withdrawing courses",
        "id": 3,
        "answer": "Add section",
        "type": "interactive:10,12",
        "group": 2,
      },
      {
        "answer": "The card has been issued in the digital wallet",
        "type": "clickable",
        "group": 2,
        "id": 4,
        "order": 4,
        "question": "2. Issuing a university card"
      },
      {
        "answer":
            "Armed Forces Hospital, King Fahad Air Base, King Abdulaziz Hospital, King Faisal Hospital, Children's Hospital",
        "type": "clickable",
        "group": 2,
        "id": 5,
        "order": 5,
        "question": "3. Approving cooperative training intuitions"
      },
      {
        "answer":
            "Dr. Wael Yousef Alghamdi:\nEmail: w.alghamdi@tu.edu.sa\nOffice hours: Tuesday : 11:00 - 12:00 , Thursday : 10:00 - 11:00\nOffice number: 12207\n\nDr. Rajwa abduallh Alharthi:\nEmail: raharthi@tu.edu.sa\nOffice hours: Wednesday : 11:00 - 12:00 , Friday : 10:00 - 11:00\nOffice number: 7111\n\nDr. Abdulmajeed Alsufyani:\nEmail: a.s.alsufyani@tu.edu.sa\nOffice hours: Friday : 8:00 - 9:00 , Thursday : 1:00 - 2:00\nOffice number: 12207",
        "type": "clickable",
        "group": 2,
        "id": 6,
        "order": 6,
        "question": "4. Communicating with academic staff"
      },
      {
        "answer": "https://his.tu.edu.sa/",
        "type": "interactive:25",
        "group": 2,
        "id": 7,
        "order": 7,
        "question": "5. Medical care"
      },
      {
        "answer":
            "The documents can be issued from the edugate",
        "type": "clickable",
        "group": 2,
        "id": 8,
        "order": 8,
        "question": "6. Notarization and Issuance of Official Documents"
      },
      {
        "id": 10,
        "order": 10,
        "question": "Add subject",
        "answer": "",
        "type": "dependent:Please enter subject ID,Please enter section ID",
        "group": 2,
      },
      {
        "id": 12,
        "order": 12,
        "question": "Delete subject",
        "type": "dependent:Please enter subject ID",
        "group": 2,
      },
      {
        "answer":
            "Arabic Language Day 3-1-2022 the place Activities building,Programing Day 7-1-2022 the place Computer and IT building, sport workshop 11-1-2022 the place Activities building",
        "type": "clickable",
        "group": 2,
        "id": 13,
        "order": 13,
        "question": "7. Extra-Curricular Activities"
      },
      {
        "answer": "",
        "type": "interactive:16,17,18,19,20,21,22,23,24",
        "group": 2,
        "id": 15,
        "order": 15,
        "question": "8. University Library"
      },
      {
        "id": 16,
        "order": 16,
        "question": "Digital library training course request form",
        "answer":
            "https://www.tu.edu.sa/Attachments/7615aec0-d470-400f-801e-a374e8a59cce_.pdf",
        "type": "url",
        "group": 2,
      },
      {
        "id": 17,
        "order": 17,
        "question": "Audio book equipment borrowing form",
        "answer":
            "https://www.tu.edu.sa/Attachments/125d134d-9418-45ae-acd1-affe8e6ac2cb_.pdf",
        "type": "url",
        "group": 2,
      },
      {
        "id": 18,
        "order": 18,
        "question": "Book proposal template",
        "answer":
            "https://www.tu.edu.sa/Attachments/42417ee0-39eb-4ccd-bc67-49a03e674762_.pdf",
        "type": "url",
        "group": 2,
      },
      {
        "id": 19,
        "order": 19,
        "question": "Induction program evaluation form",
        "answer":
            "https://www.tu.edu.sa/Attachments/420e14ce-3c1a-4705-921e-a949ceb344b4_.pdf",
        "type": "url",
        "group": 2,
      },
      {
        "id": 20,
        "order": 20,
        "question": "Course evaluation form",
        "answer":
            "https://www.tu.edu.sa/Attachments/69cba306-ee44-4197-89cd-74b9f46d4d28_.pdf",
        "type": "url",
        "group": 2,
      },
      {
        "id": 21,
        "order": 21,
        "question": "Form of booking a hall or study vacancy",
        "answer":
            "https://www.tu.edu.sa/Attachments/45c3c02e-b3d2-4006-8076-81c344af03fc_.pdf",
        "type": "url",
        "group": 2,
      },
      {
        "id": 22,
        "order": 22,
        "question":
            "Hall reservation form in the central library in the male students' section",
        "answer":
            "https://www.tu.edu.sa/Attachments/971642f2-e4db-4041-a3a2-6b8d1a723ed1_.pdf",
        "type": "url",
        "group": 2,
      },
      {
        "id": 23,
        "order": 23,
        "question": "Central Library visit form",
        "answer":
            "https://www.tu.edu.sa/Attachments/9f600428-e780-48b6-8402-97f747e6cc4f_.pdf",
        "type": "url",
        "group": 2,
      },
      {
        "id": 24,
        "order": 24,
        "question": "Training course request form",
        "answer":
            "https://www.tu.edu.sa/Attachments/0b2db766-a203-4dde-bbbf-d91bff14aa87_.pdf",
        "type": "url",
        "group": 2,
      },
      {
        "answer": "https://his.tu.edu.sa/",
        "type": "url",
        "group": 2,
        "id": 25,
        "order": 7,
        "question": "Click to open medical care."
      },
    ];
    for (var item in questions) {
      await _fireStore.collection("questions").add(item);
    }
    //
    // final advisors = [
    //   {
    //     "id": 12207,
    //     "name": "Dr. Wael Yousef Alghamdi",
    //     "user-name": "AICS2030",
    //     "email": "Communication with academic staff",
    //     "office-hours": "Tuesday : 11:00 - 12:00 , Thursday : 10:00 - 11:00",
    //   },
    //   {
    //     "id": 7111,
    //     "name": "Dr. Rajwa abduallh Alharthi",
    //     "user-name": "AlharthiRajwa",
    //     "email": "Communication with academic staff",
    //     "office-hours": "Wednesday : 11:00 - 12:00 , Friday : 10:00 - 11:00",
    //   },
    //   {
    //     "id": 12207,
    //     "name": "Dr. Abdulmajeed Alsufyani",
    //     "user-name": "a7a1717",
    //     "email": "a.s.alsufyani@tu.edu.sa",
    //     "office-hours": "Friday : 8:00 - 9:00 , Thursday : 1:00 - 2:00",
    //   },
    // ];
    // for (var item in advisors) {
    //   await _fireStore.collection("advisor").add(item);
    // }
    //
    // final levels = [
    //   {
    //     "id": 1,
    //     "subjects": [
    //       2004111,
    //       202126,
    //       501112,
    //       999805,
    //     ],
    //   },
    //   {
    //     "id": 2,
    //     "subjects": [
    //       2011211,
    //       501110,
    //       990311,
    //       999806,
    //     ],
    //   },
    //   {
    //     "id": 3,
    //     "subjects": [
    //       105115,
    //       204124,
    //       501125,
    //       503121,
    //       990211,
    //     ],
    //   },
    //   {
    //     "id": 4,
    //     "subjects": [
    //       202261,
    //       501220,
    //       990113,
    //       990114,
    //       990312,
    //       999808,
    //     ],
    //   },
    //   {
    //     "id": 5,
    //     "subjects": [
    //       202263,
    //       203200,
    //       501222,
    //       999808,
    //     ],
    //   },
    //   {
    //     "id": 6,
    //     "subjects": [
    //       2004112,
    //       203207,
    //       503221,
    //     ],
    //   },
    //   {
    //     "id": 7,
    //     "subjects": [
    //       202262,
    //       501324,
    //       501326,
    //       501352,
    //     ],
    //   },
    //   {
    //     "id": 8,
    //     "subjects": [
    //       2004313,
    //       202364,
    //       501323,
    //       502372,
    //     ],
    //   },
    //   {
    //     "id": 9,
    //     "subjects": [
    //       202368,
    //       501343,
    //       503323,
    //       990314,
    //       990315,
    //       990412,
    //       999809,
    //       999814,
    //       999815,
    //       999821,
    //     ],
    //   },
    //   {
    //     "id": 10,
    //     "subjects": [
    //       2004414,
    //       501435,
    //       501446,
    //       503410,
    //     ],
    //   },
    //   {
    //     "id": 11,
    //     "subjects": [
    //       500321,
    //       501453,
    //       501472,
    //       501481,
    //     ],
    //   },
    //   {
    //     "id": 12,
    //     "subjects": [
    //       501427,
    //       501461,
    //       501471,
    //       501573,
    //       501585,
    //       502478,
    //       502536,
    //     ],
    //   },
    //   {
    //     "id": 13,
    //     "subjects": [
    //       202463,
    //       501554,
    //       501598,
    //     ],
    //   },
    //   {
    //     "id": 14,
    //     "subjects": [
    //       501454,
    //       501496,
    //       501528,
    //       501536,
    //       501599,
    //       502459,
    //       503509,
    //       503547,
    //     ],
    //   },
    //   {
    //     "id": 15,
    //     "subjects": [
    //       501424,
    //       501513,
    //       501562,
    //       501570,
    //       501575,
    //       501582,
    //       501583,
    //       501588,
    //       501592,
    //       501593,
    //       501595,
    //       502571,
    //       503527,
    //       503538,
    //       503578,
    //     ],
    //   },
    // ];
    // for (var item in levels) {
    //   await _fireStore.collection("levels").add(item);
    // }
    //
    // final subjects = [
    //   {
    //     "name": "MicroProcessors & Assembly Language",
    //     "id": 501326,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [503221],
    //   },
    //   {
    //     "id": 2004111,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Fundamentals of Islamic Culture",
    //     "hours": 2,
    //   },
    //   {
    //     "id": 202126,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Fundamentals of Mathematics",
    //     "hours": 3,
    //   },
    //   {
    //     "id": 501112,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Computer Skills",
    //     "hours": 2,
    //   },
    //   {
    //     "id": 999805,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Intensive English Intensive (1)",
    //     "hours": 2,
    //   },
    //   {
    //     "id": 2011211,
    //     "sections": [1, 2, 3, 4],
    //     "name": "General Biology",
    //     "hours": 3,
    //   },
    //   {
    //     "id": 501110,
    //     "sections": [1, 2, 3, 4],
    //     "name": "General Biology",
    //     "hours": 2,
    //   },
    //   {
    //     "id": 990311,
    //     "sections": [1, 2, 3, 4],
    //     "name": "University Study Skills ",
    //     "hours": 2,
    //   },
    //   {
    //     "id": 999806,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Intensive English Intensive (2)",
    //     "hours": 2,
    //     "requirement": [999805],
    //   },
    //   {
    //     "id": 105115,
    //     "sections": [1, 2, 3, 4],
    //     "name": "History of the Kingdom",
    //     "hours": 2,
    //   },
    //   {
    //     "id": 204124,
    //     "sections": [1, 2, 3, 4],
    //     "name": "General Chemistry",
    //     "hours": 2,
    //   },
    //   {
    //     "id": 501125,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Scientific Computing",
    //     "hours": 2,
    //   },
    //   {
    //     "id": 503121,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Computer Aided Drawing",
    //     "sections": [1, 2, 3, 4],
    //     "hours": 1,
    //   },
    //   {
    //     "id": 990211,
    //     "sections": [1, 2, 3, 4],
    //     "name": "990211",
    //     "hours": 2,
    //   },
    //   {
    //     "id": 202261,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Calculus (1)",
    //     "hours": 3,
    //   },
    //   {
    //     "id": 501215,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Computer Programming (1)",
    //     "hours": 3,
    //   },
    //   {
    //     "id": 501220,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Computer Programming (1)",
    //     "hours": 3,
    //   },
    //   {
    //     "id": 990113,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Health Education",
    //     "hours": 3,
    //   },
    //   {
    //     "id": 990114,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Saudi women Empowerment",
    //     "hours": 2,
    //   },
    //   {
    //     "id": 999811,
    //     "sections": [1, 2, 3, 4],
    //     "name": "English for Specific Purpose (1)",
    //     "hours": 2,
    //   },
    //   {
    //     "id": 999808,
    //     "sections": [1, 2, 3, 4],
    //     "name": "English for Specific Purpose (2)",
    //     "hours": 2,
    //     "requirement": [999811],
    //   },
    //   {
    //     "id": 202263,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Calculus (2)",
    //     "hours": 3,
    //     "requirement": [202261],
    //   },
    //   {
    //     "id": 203206,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Physics (1)",
    //     "hours": 4,
    //   },
    //   {
    //     "id": 501222,
    //     "sections": [1, 2, 3, 4],
    //     "name": "Computer Programming (2)",
    //     "hours": 3,
    //     "requirement": [501220],
    //   },
    //   {
    //     "id": 999808,
    //     "sections": [1, 2, 3, 4],
    //     "name": "English for Specific Purpose (2)",
    //     "hours": 2,
    //   },
    //   {
    //     "name": "Islamic Culture (Morals & Values)",
    //     "id": 2004112,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 2,
    //     "requirement": [2004111],
    //   },
    //   {
    //     "name": "Physics (2)",
    //     "id": 203207,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 4,
    //     "requirement": [203200],
    //   },
    //   {
    //     "name": "Digital Logic Design",
    //     "id": 503221,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 4,
    //     "requirement": [501215],
    //   },
    //   {
    //     "name": "Linear Algebra",
    //     "id": 202262,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Data Structures",
    //     "id": 501324,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [501222],
    //   },
    //   {
    //     "name": "MicroProcessors &Assembly Language",
    //     "id": 501326,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Introduction to Operating gSystems",
    //     "id": 501352,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [501220],
    //   },
    //   {
    //     "name": "Islamic culture (Social System in Islam)",
    //     "id": 2004313,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 2,
    //     "requirement": [2004112],
    //   },
    //   {
    //     "name": "Probability and Statistics",
    //     "id": 202364,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [202261],
    //   },
    //   {
    //     "name": "Objected-oriented Programming",
    //     "id": 501323,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [501222],
    //   },
    //   {
    //     "name": "Fundamentals of Database",
    //     "id": 502372,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [501220],
    //   },
    //   {
    //     "name": "Operations Research",
    //     "id": 202368,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [202364],
    //   },
    //   {
    //     "name": "Software Engineering",
    //     "id": 501343,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Computer Architecture",
    //     "id": 503323,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [503221],
    //   },
    //   {
    //     "name": "French Language",
    //     "id": 990314,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 2,
    //   },
    //   {
    //     "name": "Chinese Language",
    //     "id": 990315,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 2,
    //   },
    //   {
    //     "name": "Digital Citizenship",
    //     "id": 990412,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 2,
    //   },
    //   {
    //     "name": "Presentation Skills",
    //     "id": 999809,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 2,
    //   },
    //   {
    //     "name": "IELTS Preparation",
    //     "id": 999814,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 2,
    //   },
    //   {
    //     "name": "Academic Writing",
    //     "id": 999815,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 2,
    //   },
    //   {
    //     "name": "English and the 21st century skills",
    //     "id": 999821,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 2,
    //   },
    //   {
    //     "name": "Islamic Culture (Human Rights)",
    //     "id": 2004414,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 2,
    //     "requirement": [2004313],
    //   },
    //   {
    //     "name": "Analysis and Design of Algorithms",
    //     "id": 501435,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [501324],
    //   },
    //   {
    //     "name": "Advanced Software Engineering",
    //     "id": 501446,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [501343, 501324],
    //   },
    //   {
    //     "name": "Data Communication",
    //     "id": 503410,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [503221],
    //   },
    //   {
    //     "name": "Professional Ethics",
    //     "id": 500321,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 2,
    //     "requirement": [2004414],
    //   },
    //   {
    //     "name": "Professional Ethics",
    //     "id": 500321,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 2,
    //   },
    //   {
    //     "name": "Operating Systems",
    //     "id": 501453,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [503323],
    //   },
    //   {
    //     "name": "Computer Graphics",
    //     "id": 501472,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [501324],
    //   },
    //   {
    //     "name": "Artificial Intelligence",
    //     "id": 501481,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [501324],
    //   },
    //   {
    //     "name": "Programming Paradigms",
    //     "id": 501427,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [501324, 501323],
    //   },
    //   {
    //     "name": "Internet Technologies",
    //     "id": 501461,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [2004111],
    //   },
    //   {
    //     "name": "Modeling and Simulation",
    //     "id": 501471,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Image Processing",
    //     "id": 501573,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Expert Systems",
    //     "id": 501585,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Data Warehouse",
    //     "id": 502478,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Human Computer Interaction",
    //     "id": 502536,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Advanced Mathematics",
    //     "id": 202463,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [202364],
    //   },
    //   {
    //     "name": "Distributed Systems",
    //     "id": 501554,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [501435],
    //   },
    //   {
    //     "name": "Capstone Project (1)",
    //     "id": 501598,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [501461],
    //   },
    //   {
    //     "name": "Compiler Design",
    //     "id": 501454,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Special Topics in Computer Systems",
    //     "id": 501496,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Game Design and Programming",
    //     "id": 501528,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Parallel and Distributed Algorithms",
    //     "id": 501536,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Capstone Project (2)",
    //     "id": 501599,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [501598, 501435],
    //   },
    //   {
    //     "name": "Computer Systems Security",
    //     "id": 502459,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [503442],
    //   },
    //   {
    //     "name": "Computer Networks",
    //     "id": 503442,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //     "requirement": [503410],
    //   },
    //   {
    //     "name": "Embedded Systems",
    //     "id": 503509,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Network Programming",
    //     "id": 503547,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Computer Vision",
    //     "id": 501424,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Cryptology",
    //     "id": 501513,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Pervasive Computing",
    //     "id": 501562,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Selected Topics in Artificial lntelligence",
    //     "id": 501570,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Multimedia Systems",
    //     "id": 501575,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Neural Networks",
    //     "id": 501582,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Pattern Recognition",
    //     "id": 501583,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Field Experience",
    //     "id": 501588,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 2,
    //   },
    //   {
    //     "name": "Special Topics in Programming Languages",
    //     "id": 501592,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Special Topics in Algorithms",
    //     "id": 501593,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Special Topics in Database Systems",
    //     "id": 501595,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Data Mining",
    //     "id": 502571,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Mobile Computing",
    //     "id": 503527,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Analysis of Computer Systems Performance",
    //     "id": 503538,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   },
    //   {
    //     "name": "Robotics",
    //     "id": 503578,
    //     "sections": [1, 2, 3, 4],
    //     "hours": 3,
    //   }
    // ];
    // for (var item in subjects) {
    //   await _fireStore.collection("subjects").add(item);
    // }
    //
    // final sections = [
    //   {
    //     "id": 1,
    //     "time": "0000-00-00T13:15:54.000000Z",
    //     "day": "sun",
    //     "room": 154847
    //   },
    //   {
    //     "id": 2,
    //     "time": "0000-00-00T13:15:54.000000Z",
    //     "day": "sun",
    //     "room": 154847
    //   },
    //   {
    //     "id": 3,
    //     "time": "0000-00-00T13:15:54.000000Z",
    //     "day": "sun",
    //     "room": 154847
    //   },
    //   {
    //     "id": 4,
    //     "time": "0000-00-00T13:15:54.000000Z",
    //     "day": "sun",
    //     "room": 154847
    //   },
    // ];
    // for (var item in sections) {
    //   await _fireStore.collection("sections").add(item);
    // }
    //

    // final places = [
    //
    //   {
    //     "id": 1,
    //     "name": "Educational TV",
    //     "latitude": 21.432454700960655,
    //     "longitude": 40.475104751087876,
    //     "type": "building",
    //   },
    //   {
    //     "id": 2,
    //     "name": "Departments of the Faculty of Science + Classrooms",
    //     "latitude": 21.432233765088235,
    //     "longitude": 40.47550862940269,
    //     "type": "building",
    //   },
    //   {
    //     "id": 3,
    //     "name": "Labs of the Faculty of Science",
    //     "latitude": 21.43143186881286,
    //     "longitude": 40.47544604894003,
    //     "type": "building",
    //   },
    //   {
    //     "id": 4,
    //     "name": "Classrooms",
    //     "latitude": 21.4306478474109,
    //     "longitude": 40.47566289018876,
    //     "type": "building",
    //   },
    //   {
    //     "id": 5,
    //     "name": "Classrooms + College of Computing + University Theater",
    //     "latitude": 21.43251669056089,
    //     "longitude": 40.47622437452368,
    //     "type": "building",
    //   },
    //   {
    //     "id": 6,
    //     "name": "The Central Library",
    //     "latitude": 21.432069325137434,
    //     "longitude": 40.4761486514028,
    //     "type": "building",
    //   },
    //   {
    //     "id": 7,
    //     "name": "Labs of The Faculty of Science + Physics Department",
    //     "latitude": 21.431118196500186,
    //     "longitude": 40.47645465948295,
    //     "type": "building",
    //   },
    //   {
    //     "id": 8,
    //     "name": "Faculty Offices + Deanship and Support Departments",
    //     "latitude": 21.43050387473318,
    //     "longitude": 40.476312487992104,
    //     "type": "building",
    //   },
    //   {
    //     "id": 9,
    //     "name": "Classroom + College of Business Administration",
    //     "latitude": 21.43236171651297,
    //     "longitude": 40.47711091650329,
    //     "type": "building",
    //   },
    //   {
    //     "id": 10,
    //     "name": "College of Computing and Information Technology + Computer",
    //     "latitude": 21.43151710508181,
    //     "longitude": 40.47731070061119,
    //     "type": "building",
    //   },
    //   {
    //     "id": 11,
    //     "name": "College of Design and Home Economics",
    //     "latitude": 21.43058757608067,
    //     "longitude": 40.47726987914182,
    //     "type": "building",
    //   },
    //   {
    //     "id": 12,
    //     "name": "Deanship of University Studies",
    //     "latitude": 21.43221517374071,
    //     "longitude": 40.47794498035823,
    //     "type": "building",
    //   },
    //   {
    //     "id": 13,
    //     "name": "College of Business Administration + Admission and Registration",
    //     "latitude": 21.43236171651297,
    //     "longitude": 40.47711091650329,
    //     "type": "building",
    //   },
    //   {
    //     "id": 14,
    //     "name": "Faculty of Dentistry + Classrooms.",
    //     "latitude": 21.43041483903849,
    //     "longitude": 40.477792442795376,
    //     "type": "building",
    //   },
    //   {
    //     "id": 15,
    //     "name": "Student Activities",
    //     "latitude": 21.429975025975075,
    //     "longitude": 40.47714882571869,
    //     "type": "building",
    //   },
    //   {
    //     "id": 16,
    //     "name": "The Pharmacy + Medical College Laboratory",
    //     "latitude": 21.42951045939289,
    //     "longitude": 40.47620422169244,
    //     "type": "building",
    //   },
    //   {
    //     "id": 17,
    //     "name": "Faculty of Medicine",
    //     "latitude": 21.42859262400018,
    //     "longitude": 40.47687701942194,
    //     "type": "building",
    //   },
    //   {
    //     "id": 18,
    //     "name": "English Language Center + Classrooms.",
    //     "latitude": 21.428646614476083,
    //     "longitude": 40.477124485254144,
    //     "type": "building",
    //   },
    //   {
    //     "id": 19,
    //     "name": "Faculty of Education",
    //     "latitude": 21.427576311877974,
    //     "longitude": 40.47689023410958,
    //     "type": "building",
    //   },
    //   {
    //     "id": 20,
    //     "name": "College of Literature",
    //     "latitude": 21.427763193702773,
    //     "longitude": 40.47611945948756,
    //     "type": "building",
    //   },
    //   {
    //     "id": 21,
    //     "type": "building",
    //     "name": "College of Sharia and Regulations",
    //     "latitude": 21.426871712567216,
    //     "longitude": 40.47677907867744,
    //   },
    //   {
    //     "id": 22,
    //     "type": "service",
    //     "name": "West Entrance",
    //     "latitude": 21.43193875402741,
    //     "longitude": 40.47479938218706
    //   },
    //   {
    //     "id": 23,
    //     "type": "service",
    //     "name": "Medical Administration",
    //     "latitude": 21.431466209986286,
    //     "longitude": 40.475106641513406
    //   },
    //   {
    //     "id": 24,
    //     "type": "service",
    //     "name": "University Restaurant",
    //     "latitude": 21.432873865612425,
    //     "longitude": 40.47787110884552
    //   },
    //   {
    //     "id": 25,
    //     "type": "service",
    //     "name": "Eastern Entrance + Commercial Mall + Library",
    //     "latitude": 21.431325983061186,
    //     "longitude": 40.47874117245038
    //   },
    //   {
    //     "id": 26,
    //     "type": "service",
    //     "name": "Student Activities",
    //     "latitude": 21.429975025975075,
    //     "longitude": 40.47714882571869
    //   },
    //   {
    //     "id": 27,
    //     "type": "service",
    //     "name": "Fresh shop juices",
    //     "latitude": 21.431789785671,
    //     "longitude": 40.476620149482216
    //   },
    //   {
    //     "id": 28,
    //     "type": "service",
    //     "name": "KARAZ ALBUN",
    //     "latitude": 21.430407081138885,
    //     "longitude": 40.476540733141725
    //   },
    //   {
    //     "id": 29,
    //     "type": "service",
    //     "name": "Assafi",
    //     "latitude": 21.42822056414941,
    //     "longitude": 40.47574967456396
    //   },
    //   {
    //     "id": 30,
    //     "type": "service",
    //     "name": "Noni market",
    //     "latitude": 21.43191442965206,
    //     "longitude": 40.47597847958356
    //   },
    //   {
    //     "id": 31,
    //     "type": "service",
    //     "name": "Khafayef",
    //     "latitude": 21.43171985135231,
    //     "longitude": 40.47682912660374
    //   },
    //   {
    //     "id": 32,
    //     "type": "service",
    //     "name": "Gate27",
    //     "latitude": 21.42709880505363,
    //     "longitude": 40.47615413924407
    //   },
    // ];
    // for (var item in places) {
    //   await _fireStore.collection("places").add(item);
    // }
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
    final places = await _fireStore.collection("places").get();
    for (var element in places.docs) {
      _fireStore.collection("places").doc(element.id).delete();
    }
    final forms = await _fireStore.collection("forms").get();
    for (var element in forms.docs) {
      _fireStore.collection("forms").doc(element.id).delete();
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

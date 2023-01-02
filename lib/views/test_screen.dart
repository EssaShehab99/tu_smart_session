
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
/*
    final gymCard =[
      {
        "expire": "2023-12-08 00:00:00.000",
        "id": 43907327,
        "joining": "2023-13-06 00:00:00.000",
        "name": "Atheer Dhaifallah alharthi"
      },
      {
        "expire": "2022-02-07 00:00:00.000",
        "id": 43900002,
        "joining": "2022-02-05 00:00:00.000",
        "name": "Rana Ahmad Alkhamash"
      },
      {
        "id": 43900001,
        "name": "Atheer Abdulaziz Alsufyani "
      },
      {
        "expire": "2023-12-08 00:00:00.000",
        "id": 43900889,
        "joining": "2023-13-06 00:00:00.000",
        "name": "Shahad Salih Alazwari "
      },
      {
        "id": 43900005,
        "name": "Rana Ahmad Alkhamash "
      },
      {
        "id": 43900000,
        "name": "Rawan Dhaifallah Alsuwat"
      }
    ];
    for(var item in gymCard) {
      _fireStore.collection("gym-card").add(
        item
    );
    }

    final healthCard =[
        {
          "blood-type": "A+",
          "date-of-birth": "2000-12-21 00:00:00.000",
          "emergency-contact-1": "+9660549314631",
          "emergency-contact-2": "+9660573739119",
          "id": 43907327,
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
          "id": 43900001,
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
          "id": 43900005,
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
    for(var item in healthCard) {
      _fireStore.collection("health-card").add(
        item
    );
    }

    final universityCard =[
      {
        "department": "Computer science",
        "id": 43907327,
        "name": "Atheer Dhaifallah alharthi"
      },
      {
        "department": "Computer science",
        "id": 43900002,
        "name": "Rana Ahmad Alkhamash"
      },
      {
        "department": "Computer science",
        "id": 43900001,
        "name": "Atheer Abdulaziz Alsufyani"
      },
      {
        "department": "Computer science",
        "id": 43900889,
        "name": "Shahad Salih Alazwari"
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
    for(var item in universityCard) {
      _fireStore.collection("university-card").add(
        item
    );
    }

    final questions =[
      {
        "click-able": false,
        "group": 1,
        "id": 1,
        "question": "Hi Raghad, I'm Cody"
      },
      {
        "click-able": false,
        "group": 1,
        "id": 2,
        "question": "I will help you, choose the question you want and I will answer you."
      },
      {
        "answer": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "click-able": true,
        "group": 2,
        "id": 3,
        "question": "1. Adding/withdrawing courses"
      },
      {
        "answer": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "click-able": true,
        "group": 2,
        "id": 4,
        "question": "2. Issuing a university card"
      },
      {
        "answer": "Medical care:\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "click-able": true,
        "group": 2,
        "id": 5,
        "question": "3. Approving cooperative training intuitions"
      },
      {
        "answer": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "click-able": true,
        "group": 2,
        "id": 6,
        "question": "4. Communicating with academic staff"
      },
      {
        "answer": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "click-able": true,
        "group": 2,
        "id": 7,
        "question": "5. Medical care"
      },
      {
        "answer": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "click-able": true,
        "group": 2,
        "id": 8,
        "question": "6. Official documents issuance"
      }

    ];
    for(var item in questions) {
      _fireStore.collection("questions").add(
        item
    );
    }

    */


    final advisors =[
      {
        "id":1,
        "name":"Bara Abdullah",
        "user-name": "essashehab99",
      },
      {
        "id":2,
        "name":"Ahmed Ali Abdullah",
        "user-name": "test11",
      },
    ];
    for(var item in advisors) {
      _fireStore.collection("advisor").add(
          item
      );
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

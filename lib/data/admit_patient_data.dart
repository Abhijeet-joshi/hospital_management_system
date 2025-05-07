import 'dart:math';

class AdmitPatientData{

  static List<String> allDept = [
    "Cardiology",
    "Neurology",
    "Orthopedics",
    "ENT",
    "Nephrology"
  ];

  static List<String> allType = [
    "Indoor",
    "Outdoor",
    "Emergency"
  ];

  static String getRandomDepartment() {
    if (allDept.isEmpty) {
      return "No Department Available";
    }
    final random = Random();
    final randomIndex = random.nextInt(allDept.length);
    return allDept[randomIndex];
  }

  static String getRandomType() {
    if (allType.isEmpty) {
      return "No Type Available";
    }
    final random = Random();
    final randomIndex = random.nextInt(allType.length);
    return allType[randomIndex];
  }

  static int getRandomAge() {
    final random = Random();
    final randomAge = random.nextInt(86 - 10) + 10;
    return randomAge;
  }

  static List<Map<String, String>> admittedPatientsDb = [];

  static void createSampleDatabase(){

    String admitDate = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} - ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";

    for(int i=0; i<25; i++){
      admittedPatientsDb.add(
        {
          "id" : "100${i+1}",
          "name" : "Patient - ${i+1}",
          "age" : getRandomAge().toString(),
          "department" : getRandomDepartment(),
          "type" : getRandomType(),
          "admit-date" : admitDate,
          "discharge-date" : "",
          "bill-amount" : "",
          "days-admit" : "",
        }
      );
    }
  }

}
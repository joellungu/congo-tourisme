import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:congo_tourisme/widgets/paiement.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class Taxes extends StatefulWidget {
  //
  @override
  State<StatefulWidget> createState() {
    return _Taxes();
  }
}

class _Taxes extends State<Taxes> {
  TextEditingController nom = TextEditingController();
  TextEditingController postnom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController nom_pere = TextEditingController();
  TextEditingController nom_mere = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController adresse = TextEditingController();
  TextEditingController lieu_de_naissance = TextEditingController();
  TextEditingController email = TextEditingController(); //
  TextEditingController numeroCarte = TextEditingController(); //
  List genres = ["Homme", "Femme"];
  RxBool type = true.obs;
  int genre = 0;
  List types = [
    "Diplôme d'etat",
    "Diplôme d'aptitude profesionnel",
    "Brevet professionnel",
    "Certificat d'étude primaire",
    "Note d'acquis de droit",
    "Attestation reussite (EXETAT)",
    "Attestation de N.D.D",
    "Releve de côtes"
  ];
  //
  //
  int option = 0;
  //
  List<Map<String, dynamic>> listeDistrict2 = [
    {"p": "BAS-UELE", "d": "BAS-UELE"},
    {"p": "EQUATEUR", "d": "EQUATEUR 1"},
    {"p": "EQUATEUR", "d": "EQUATEUR 2"},
    {"p": "HAUT-KATANGA", "d": "HAUT-KATANGA 1"},
    {"p": "HAUT-KATANGA", "d": "HAUT-KATANGA 2"},
    {"p": "HAUT-LOMAMI", "d": "HAUT-LOMAMI 1"},
    {"p": "HAUT-LOMAMI", "d": "HAUT-LOMAMI 2"},
    {"p": "HAUT-UELE", "d": "HAUT-UELE 1"},
    {"p": "HAUT-UELE", "d": "HAUT-UELE 2"},
    {"p": "ITURI", "d": "ITURI 1"},
    {"p": "ITURI", "d": "ITURI 2"},
    {"p": "ITURI", "d": "ITURI 3"},
    {"p": "KASAI", "d": "KASAI 1"},
    {"p": "KASAI", "d": "KASAI 2"},
    {"p": "KASAI CENTRAL", "d": "KASAI CENTRAL 1"},
    {"p": "KASAI CENTRAL", "d": "KASAI CENTRAL 2"},
    {"p": "KASAI ORIENTAL", "d": "KASAI ORIENTAL 1"},
    {"p": "KASAI ORIENTAL", "d": "KASAI ORIENTAL 2"},
    {"p": "KINSHASA", "d": "KINSHASA-FUNA"},
    {"p": "KINSHASA", "d": "KINSHASA-LUKUNGA"},
    {"p": "KINSHASA", "d": "KINSHASA-MONT AMBA"},
    {"p": "KINSHASA", "d": "KINSHASA-PLATEAU"},
    {"p": "KINSHASA", "d": "KINSHASA-TSHANGU"},
    {"p": "KONGO CENTRAL", "d": "KONGO CENTRAL 1"},
    {"p": "KONGO CENTRAL", "d": "KONGO CENTRAL 2"},
    {"p": "KONGO CENTRAL", "d": "KONGO CENTRAL 3"},
    {"p": "KWANGO", "d": "KWANGO 1"},
    {"p": "KWANGO", "d": "KWANGO 2"},
    {"p": "KWILU", "d": "KWILU 1"},
    {"p": "KWILU", "d": "KWILU 2"},
    {"p": "KWILU", "d": "KWILU 3"},
    {"p": "LOMAMI", "d": "LOMAMI"},
    {"p": "LOMAMI", "d": "LOMAMI 2"},
    {"p": "LUALABA", "d": "LUALABA 1"},
    {"p": "LUALABA", "d": "LUALABA 2"},
    {"p": "MAI-NDOMBE", "d": "MAI-NDOMBE 1"},
    {"p": "MAI-NDOMBE", "d": "MAI-NDOMBE 2"},
    {"p": "MAI-NDOMBE", "d": "MAI-NDOMBE 3"},
    {"p": "MANIEMA", "d": "MANIEMA 1"},
    {"p": "MANIEMA", "d": "MANIEMA 2"},
    {"p": "MONGALA", "d": "MONGALA 1"},
    {"p": "MONGALA", "d": "MONGALA 2"},
    {"p": "NORD-KIVU", "d": "NORD-KIVU 1"},
    {"p": "NORD-KIVU", "d": "NORD-KIVU 2"},
    {"p": "NORD-KIVU", "d": "NORD-KIVU 3"},
    {"p": "NORD-UBANGI", "d": "NORD-UBANGI 1"},
    {"p": "NORD-UBANGI", "d": "NORD-UBANGI 2"},
    {"p": "SANKURU", "d": "SANKURU 1"},
    {"p": "SANKURU", "d": "SANKURU 2"},
    {"p": "SUD KIVU", "d": "SUD KIVU 2"},
    {"p": "SUD KIVU", "d": "SUD-KIVU 1"},
    {"p": "SUD KIVU", "d": "SUD-KIVU 3"},
    {"p": "SUD-UBANGI", "d": "SUD-UBANGI 1"},
    {"p": "SUD-UBANGI", "d": "SUD-UBANGI 2"},
    {"p": "TANGANYIKA", "d": "TANGANYIKA 1"},
    {"p": "TANGANYIKA", "d": "TANGANYIKA 2"},
    {"p": "TSHOPO", "d": "TSHOPO 1"},
    {"p": "TSHOPO", "d": "TSHOPO 2"},
    {"p": "TSHUAPA", "d": "TSHUAPA 1"},
    {"p": "TSHUAPA", "d": "TSHUAPA 2"}
  ];
  //
  List<String> listeDistrict = [];
  //
  int p_o = 0;
  int p_e = 0;
  List listeProvince = [
    "Bas-Uele",
    "Équateur",
    "Haut-Katanga",
    "Haut-Lomami",
    "Haut-Uele",
    "Ituri",
    "Kasai",
    "Kasai central",
    "Kasai oriental",
    "Kinshasa",
    "Kongo Central",
    "Kwango",
    "Kwilu",
    "Lomami",
    "Lualaba",
    "Mai-Ndombe",
    "Maniema",
    "Mongala",
    "Nord-Kivu",
    "Nord-Ubangi",
    "Sankuru",
    "Sud-Kivu",
    "Sud-Ubangi",
    "Tanganyika",
    "Tshopo",
    "Tshuapa",
  ];
  int pp = 9;
  //
  String ext1 = "png";
  RxInt i = 0.obs;
  //XFile? img1;
  //
  DateTime? d;

  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //

    listeDistrict.clear();
    //
    listeDistrict2.forEach((element) {
      if ("${element['p']}".toLowerCase() ==
          ("${listeProvince[0]}".toLowerCase())) {
        listeDistrict.add("${element['d']}");
      }
    });
    //
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        centerTitle: true,
        title: const Text(
          "Taxes et redevances",
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ///////////
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  //color: Colors.teal.shade900,
                  image: DecorationImage(
                    image: ExactAssetImage("assets/logo.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(75),
                ),
              )
            ],
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Type de taxes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 0,
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey),
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("  Cotisation:"),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: p_o,
                        onChanged: (value) {
                          p_o = value as int;
                          //cotisation.value = p_e == 0;
                          //value = s;
                          //
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 0,
                            child: Text("Cotisation mensuel"),
                          ),
                          DropdownMenuItem(
                            value: 1,
                            child: Text("Cotisation annuel"),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text("Cotisation electoral"),
                          ),
                          DropdownMenuItem(
                            value: 3,
                            child: Text("Cotisation santé"),
                          ),
                          DropdownMenuItem(
                            value: 4,
                            child: Text("Cotisation ecologique annuel"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Qui etes-vous ?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 0,
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey),
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("  Type identité:"),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: p_e,
                        onChanged: (value) {
                          p_e = value as int;
                          type.value = p_e == 0;
                          //value = s;
                        },
                        items: [
                          DropdownMenuItem(
                            value: 0,
                            child: Text("Hotel"), //
                          ),
                          DropdownMenuItem(
                            value: 1,
                            child: Text("Restaurant"),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text("Agence de voyage"),
                          ),
                          DropdownMenuItem(
                            value: 3,
                            child: Text("Compagnie aerienne"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Numéro tourisme",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: phone,
                decoration: InputDecoration(
                    prefixText: "CODE ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: const Text("Numéro tourisme")
                    //prefixText: "De: "
                    ),
              ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              var connectivityResult =
                  await (Connectivity().checkConnectivity());
              //
              if (connectivityResult == ConnectivityResult.mobile ||
                  connectivityResult == ConnectivityResult.wifi) {
                //
                Get.dialog(Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CircularProgressIndicator(
                      strokeWidth: 7,
                    ),
                  ),
                ));
                //
                DateTime d2 = DateTime.now();
                //ControllerApp controllerApp = Get.find();
                //
                Map<String, dynamic> e = {};
                //
                if (false) {
                  e = {
                    "cotisation": [
                      "Cotisation mensuel",
                      "Cotisation annuel",
                      "Cotisation electoral",
                      "Cotisation santé",
                      "Cotisation ecologique annuel"
                    ][p_o],
                    "type": ["Membre", "Sympatisant"][p_e],
                    "numeroCarte": numeroCarte.text,
                    "telephone": phone.text
                  };

                  send(e);
                } else {
                  //
                  if (type.value) {
                    //Si tu membre...
                    if (phone.text.length > 9) {
                      Get.snackbar("Erreur",
                          "Le numéro de téléphone n'est pas conforme");
                    } else {
                      e = {
                        "cotisation": [
                          "Cotisation mensuel",
                          "Cotisation annuel",
                          "Cotisation electoral",
                          "Cotisation santé",
                          "Cotisation ecologique annuel"
                        ][p_o],
                        "type": ["Membre", "Sympatisant"][p_e],
                        "numeroCarte": numeroCarte.text,
                        "telephone": phone.text
                      };
                      //
                      Get.back();
                      //
                      showDialog(
                        context: context,
                        builder: (c) {
                          return Material(
                            color: Colors.transparent,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 300,
                                width: 270,
                                child: PayementMethode(
                                  e,
                                  7,
                                  send,
                                  "palmares",
                                  "palmares",
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } else {
                    if (phone.text.length > 9) {
                      Get.snackbar("Erreur",
                          "Le numéro de téléphone n'est pas conforme");
                    } else {
                      e = {
                        "cotisation": [
                          "Cotisation mensuel",
                          "Cotisation annuel",
                          "Cotisation electoral",
                          "Cotisation santé",
                          "Cotisation ecologique annuel"
                        ][p_o],
                        "type": ["Membre", "Sympatisant"][p_e],
                        "nom": nom.text,
                        "telephone": phone.text,
                        "postnom": postnom.text,
                        "prenom": prenom.text,
                      };
                      //
                      Get.back();
                      //
                      showDialog(
                        context: context,
                        builder: (c) {
                          return Material(
                            color: Colors.transparent,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 300,
                                width: 270,
                                child: PayementMethode(
                                  e,
                                  7,
                                  send,
                                  "palmares",
                                  "palmares",
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }
                }
                //
                //Uint8List l1 = await img1!.readAsBytes();
                //
                //String vd = d!.day < 9 ? "0${d!.day}" : "${d!.day}";
                //String ddd = "${d!.year}-${d!.month}-$vd";

                /*
                  */
                // Map v = await controllerApp.cotiser(e);
                // if (v['v']) {
                //   //
                //   nom = TextEditingController();
                //   postnom = TextEditingController();
                //   prenom = TextEditingController();
                //   nom_pere = TextEditingController();
                //   nom_mere = TextEditingController();
                //   telephone = TextEditingController();
                //   adresse = TextEditingController();
                //   lieu_de_naissance = TextEditingController();
                //   email = TextEditingController();
                //   //
                //   //
                //   Get.back();
                //   Get.snackbar("Succès", "${v['message']}");
                // } else {
                //   Get.back();
                //   Get.snackbar("Erreur", "code: ${v['code']}.");
                // }
                //____________________________________________________________
              } else {
                Get.snackbar("Connexion", "Vous n'etes pas connecté");
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.teal.shade900,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              child: Text("Payer"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  send(Map formulaireD) async {
    Get.back();
    //ControllerApp controllerApp = Get.find();
    //ByteArrayInputStream//formulaireD
    ////Membre//Cotisation mensuel
    var ref = getReference();
    DateTime d = DateTime.now();
    Map e = {
      "nom": formulaireD['nom'] ?? "",
      "postnom": formulaireD['postnom'] ?? "",
      "prenom": formulaireD['prenom'] ?? "",
      "genre": formulaireD['genre'] ?? "",
      "email": formulaireD['email'] ?? "",
      "adresse": formulaireD['adresse'] ?? "",
      "date": "${d.day}/${d.month}/${d.year}",
      "type": "Membre",
      "demande": "Cotisation mensuel",
      "phone": "243" + "815381693",
      "telephone": "243" + (formulaireD['telephone'] ?? ""),
      "reference": ref,
      "amount": 2,
      "currency": "USD",
    };
    //
    Timer(const Duration(seconds: 1), () {
      //controllerApp.cotiser(formulaireD);
    });
  }

  String getCode() {
    String n = "";
    var rng = Random();
    for (var i = 0; i < 17; i++) {
      n = "$n${rng.nextInt(9)}";
    }
    return n;
  }

  messageErreur(String titre, String message) {
    //GetSnackBar(title: titre, message: message);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titre),
          content: Text(message),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
              ),
            )
          ],
        );
      },
    );
  }

  String getReference() {
    var uuid = Uuid();
    return "${uuid.v4()}";
  }
}

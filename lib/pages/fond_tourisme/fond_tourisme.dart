import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:congo_tourisme/widgets/paiement.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class FondTourisme extends StatefulWidget {
  //
  @override
  State<StatefulWidget> createState() {
    return _FondTourisme();
  }
}

class _FondTourisme extends State<FondTourisme> {
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
  //
  RxList categorie = [""].obs;
  List hotel = ["1 Etoile", "2 Etoile", "3 Etoile", "4 Etoile", "5 Etoile"].obs;
  List restaurant = [
    "1 Fourchette",
    "2 Fourchette",
    "3 Fourchette",
    "4 Fourchette",
  ].obs;
  RxList autre = ["Catégorie A", "Catégorie B"].obs;
  //
  List genres = ["Homme", "Femme"];
  int genre = 0;
  List types = [
    "sur les prix de nuitées",
    "sur les prix des repas ou boissons",
    "sur les billets avion domestique",
    "sur les billets avion international",
    "sur les voyages lacustres",
    "sur les voyages fluviaux",
    "sur les voyages maritimes",
    "sur les voyages ferovières",
    "sur les voyages routiers",
    "sur les transports touristiques",
    "sur les billes activités touristiques"
  ];
  //
  //
  int option = 0;
  //
  int type = 0;
  int p_e = 0;
  int n_e = 1;
  int cat = 0;
  //
  String ext1 = "png";
  RxInt i = 0.obs;
  //XFile? img1;
  //
  DateTime? d;

  //
  @override
  void initState() {
    //
    super.initState();
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
          "Fond tourisme",
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
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("  Redevance:"),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: type,
                        isExpanded: true,
                        onChanged: (value) {
                          type = value as int;
                          //cotisation.value = p_e == 0;
                          //value = s;
                          //
                        },
                        items: List.generate(
                          types.length,
                          (index) {
                            return DropdownMenuItem(
                              value: index,
                              child: Text("${types[index]}"),
                            );
                          },
                        ),
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
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(" Type établissement:"),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: n_e,
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            n_e = value as int;
                            cat = 0;
                          });
                          // if (n_e == 0) {
                          //   categorie.value = hotel;
                          // } else if (n_e == 1) {
                          //   categorie.value = restaurant;
                          // } else {
                          //   categorie.value = autre;
                          // }
                        },
                        /*
                        */
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text("Hotel"),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text("Restaurant"),
                          ),
                          DropdownMenuItem(
                            value: 3,
                            child: Text("Service traiteur (Minièr)"),
                          ),
                          DropdownMenuItem(
                            value: 4,
                            child: Text("Agence de voyage"),
                          ),
                          DropdownMenuItem(
                            value: 5,
                            child: Text("Agence de tourisme"),
                          ),
                          DropdownMenuItem(
                            value: 6,
                            child: Text("Tour opérateur"),
                          ),
                          DropdownMenuItem(
                            value: 7,
                            child: Text("Site touristique"),
                          ),
                          DropdownMenuItem(
                            value: 8,
                            child: Text("Compagnie transport aerienne"),
                          ),
                          DropdownMenuItem(
                            value: 9,
                            child: Text("Compagnie transport maritime"),
                          ),
                          DropdownMenuItem(
                            value: 10,
                            child: Text("Compagnie transport ferovière"),
                          ),
                          DropdownMenuItem(
                            value: 11,
                            child: Text("Compagnie transport routié"),
                          ),
                          DropdownMenuItem(
                            value: 12,
                            child: Text("Compagnie transport lacustre"),
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
            height: 10,
          ),
          Card(
            elevation: 0,
            margin: const EdgeInsets.all(0),
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
                  const Text("  Catégorie:"),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: n_e == 1
                        ? DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              value: cat,
                              onChanged: (value) {
                                setState(() {
                                  cat = value as int;
                                });
                              },
                              /*
                        */
                              items: List.generate(
                                hotel.length,
                                (index) {
                                  return DropdownMenuItem(
                                    value: index,
                                    child: Text("${hotel[index]}"),
                                  );
                                },
                              ),
                            ),
                          )
                        : n_e == 2
                            ? DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  value: cat,
                                  onChanged: (value) {
                                    setState(() {
                                      cat = value as int;
                                    });
                                  },
                                  /*
                        */
                                  items: List.generate(
                                    restaurant.length,
                                    (index) {
                                      return DropdownMenuItem(
                                        value: index,
                                        child: Text("${restaurant[index]}"),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  value: cat,
                                  onChanged: (value) {
                                    setState(() {
                                      cat = value as int;
                                    });
                                  },
                                  /*
                        */
                                  items: List.generate(
                                    autre.length,
                                    (index) {
                                      return DropdownMenuItem(
                                        value: index,
                                        child: Text("${autre[index]}"),
                                      );
                                    },
                                  ),
                                ),
                              ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
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
                Map e = {};
                //
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
//
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

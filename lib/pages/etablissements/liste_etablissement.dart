import 'package:flutter/material.dart';

class ListeEtablissements extends StatelessWidget {
  String titre;

  ListeEtablissements(this.titre);
  //
  List etablissements = [
    "Grand hotel de Kinshasa",
    "Hotel Memeling",
    "Hotel du fleuve",
    "Hotel karavia",
    "Le Prestige",
  ];
  List images = [
    "hotel.jpg",
    "restaurant.jpg",
    "tourisme (4).jpg",
    "ageance_voyage.jpg",
    "compagnie_aerienne.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titre),
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.teal.shade900,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                    filled: true,
                    fillColor: Colors.teal.shade900,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: List.generate(etablissements.length, (index) {
                return Card(
                  elevation: 1,
                  child: SizedBox(
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: 150,
                          height: 150, //Get.size.height / 2.1,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(200),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            "${etablissements[index]}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: ExactAssetImage("assets/hotel.jpg"),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

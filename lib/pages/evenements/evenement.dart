import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Evenement extends StatelessWidget {
  List etablissements = [
    "Vestival de Jazz",
    "Vestival de GUNGU",
    "Miss RDC",
    "Concert Fally Ipupa",
  ];
  List images = [
    "vestival (4).jpg",
    "tourisme (20).jpg",
    "vestival (2).jpg",
    "concert.jpeg",
  ];
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
        title: const Text(
          "Evenements touristiques et culturels",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.teal.shade900,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
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
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: List.generate(etablissements.length, (index) {
                  return Card(
                    elevation: 1,
                    margin: EdgeInsets.all(2),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        //Get.to(ListeEtablissements("${etablissements[index]}"));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage("assets/${images[index]}"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: Get.size.height / 4.5,
                        width: double.infinity,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "${etablissements[index]}",
                          style: TextStyle(
                            color: Colors.grey.shade200,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

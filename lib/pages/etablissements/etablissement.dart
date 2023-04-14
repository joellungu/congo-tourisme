import 'package:carousel_slider/carousel_slider.dart';
import 'package:congo_tourisme/pages/etablissements/liste_etablissement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Etablissement extends StatelessWidget {
  List etablissements = [
    "Hotels",
    "Restaurants",
    "Sites touristiques",
    "Agences de voyages",
    "Compagnies aeriennes",
    "Transporteurs routier",
    "Transporteurs fuvial",
    "Agences touristiques",
  ];
  List images = [
    "hotel.jpg",
    "restaurant.jpg",
    "tourisme (4).jpg",
    "ageance_voyage.jpg",
    "compagnie_aerienne.jpeg",
    "bus.jpg",
    "fuvial.jpeg",
    "tourisme (2).png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
        title: const Text(
          "Etablissements touristiques",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
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
                  Get.to(ListeEtablissements("${etablissements[index]}"));
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

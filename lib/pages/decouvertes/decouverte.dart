import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Decouverte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
        title: Text(
          "Decouvrir la RDC",
          style: TextStyle(color: Colors.white, fontSize: 20),
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
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                // Padding(
                //   padding: EdgeInsets.only(
                //     left: 10,
                //   ),
                //   child: Text(
                //     "Parc de Virunga",
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                carte('Parc de Virunga'),
                carte('Parc de Virunga'),
                carte('Parc de Virunga'),
                carte('Parc de Virunga'),
                carte('Parc de Virunga'),
                carte('Parc de Virunga'),
                carte('Parc de Virunga'),
                carte('Parc de Virunga'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget carte(String text) {
    return CarouselSlider(
      options: CarouselOptions(
        height: Get.size.height / 4,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 1),
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/tourisme (9).jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              height: Get.size.height / 4,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.grey.shade200,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

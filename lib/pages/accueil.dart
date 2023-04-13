import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {
        //     //
        //   },
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Colors.white,
        //   ),
        // ),
        title: const Text(
          "Congo Tourisme",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 1,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            CarouselSlider(
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
                        "Découvire la RDC",
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
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: Colors.teal,
              ),
              title: Text("Identification acteur touristique"),
            ),
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/tourisme (20).jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 40,
                width: 40,
                alignment: Alignment.bottomCenter,
              ),
              title: Text("Posters des évenements"),
            ),
            ListTile(
              leading: Icon(
                Icons.monetization_on,
                color: Colors.teal,
              ),
              title: Text("Taxes et redevances touristiques"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              elevation: 1,
              margin: EdgeInsets.all(2),
              color: Colors.green,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/tourisme (11).jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: Get.size.height / 4,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Découvire la RDC",
                  style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 1,
              color: Colors.green,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/tourisme(18).jpeg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: Get.size.height / 4,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Etablessements touristiques",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 1,
              color: Colors.green,
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: ExactAssetImage("assets/tourisme (19).jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: Get.size.height / 4,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Evenements touristiques et culturels",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

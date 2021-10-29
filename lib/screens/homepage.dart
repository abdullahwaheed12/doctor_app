import 'dart:ui';

import 'package:doctor_app/widgets/singlecategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'detailscreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

late double height, width;

class _HomepageState extends State<Homepage> {
  double xoffset = 0;
  double yoffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  var itemCategory = [
    {
      "image": "assets/heart.svg",
      "name": "Cardiology",
      "stuff": "85 Doctors",
      "color": Colors.red,
    },
    {
      "image": "assets/Teeth.svg",
      "name": "Teeth",
      "stuff": "38 Doctors",
      "color": Colors.white,
    },
    {
      "image": "assets/Bone.svg",
      "name": "Ligaments",
      "stuff": "65 Doctors",
      "color": Colors.white
    },
  ];

  var doctorItem = [
    {
      "image": "assets/Image2.jpg",
      "name": "Dr.Mary Albright",
      "specialist": "Cardiologist"
    },
    {
      "image": "assets/Image3.jpg",
      "name": "Dr.Sara James",
      "specialist": "Dentist"
    },
    {
      "image": "assets/Image4.jpg",
      "name": "Dr.Robert Dean",
      "specialist": "Cardiologist"
    },
    {
      "image": "assets/Image5.jpg",
      "name": "Dr.Anita Silva  ",
      "specialist": "orthopedist"
    },
  ];

  Widget doctors(
      {required String image,
      required String name,
      required String specialist}) {
    var size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: Colors.yellow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: AssetImage("$image"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: size.height * 0.09,
              // color: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  name.length <= 15
                      ? Text(
                          name,
                          style: TextStyle(
                            fontFamily: "Comic Sans",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      : Text(
                          name,
                          style: TextStyle(
                            fontFamily: "Comic Sans",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                        ),
                  Text(
                    specialist,
                    style: TextStyle(
                      fontFamily: "Comic Sans",
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      transform: Matrix4.translationValues(xoffset, yoffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true, //new line

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: isDrawerOpen
                        ? BorderRadius.only(
                            topLeft: Radius.circular(40),
                          )
                        : BorderRadius.circular(0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isDrawerOpen
                              ? IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      xoffset = 0;
                                      yoffset = 0;
                                      scaleFactor = 1;
                                      isDrawerOpen = false;
                                    });
                                  },
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      xoffset = 230;
                                      yoffset = 150;
                                      scaleFactor = 0.7;
                                      isDrawerOpen = true;
                                    });
                                  },
                                  // child: Container(),
                                  child: SvgPicture.asset(
                                    "assets/menu1.svg",
                                    color: Colors.black,
                                  ),
                                ),
                          Container(
                              width: width * 0.12,
                              height: height * 0.05,
                              child:
                                  Image(image: AssetImage("assets/Image.jpg")))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: isDrawerOpen
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                        )
                      : BorderRadius.circular(0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Text(
                        "Find Your\nConsultant Easily",
                        style: TextStyle(
                          fontFamily: "Comic Sans",
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: SvgPicture.asset(
                                "assets/Search.svg",
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.black),
                            hintText: "Search",
                            fillColor: Colors.grey[200]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Text(
                        "Category",
                        style: TextStyle(
                          fontFamily: "Comic Sans",
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: height * 0.22,
                      // color: Colors.amber,
                      padding: EdgeInsets.only(left: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: itemCategory.length,
                        itemBuilder: (context, index) {
                          return SingleCategory(
                            image: itemCategory[index]["image"].toString(),
                            name: itemCategory[index]["name"].toString(),
                            doctors: itemCategory[index]["stuff"].toString(),
                            color: itemCategory[index]["color"] as Color,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Top Rated Doctor",
                              style: TextStyle(
                                fontFamily: "Comic Sans",
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              "See All",
                              style: TextStyle(
                                fontFamily: "Comic Sans",
                                fontWeight: FontWeight.w400,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.85,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(doctorItem.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => DetailScreen(),
                              ));
                            },
                            child: doctors(
                              image: doctorItem[index]["image"].toString(),
                              name: doctorItem[index]["name"].toString(),
                              specialist:
                                  doctorItem[index]["specialist"].toString(),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

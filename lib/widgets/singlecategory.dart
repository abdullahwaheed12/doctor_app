import 'package:doctor_app/screens/drawerscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SingleCategory extends StatelessWidget {
  final String image;
  final String name;
  final String doctors;
  final Color color;
  SingleCategory(
      {required this.image,
      required this.name,
      required this.doctors,
      required this.color});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        width: width * 0.4,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 25,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: height * 0.07,
                width: height * 0.07,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(13),
                ),
                child: SvgPicture.asset(
                  "$image",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            color != Colors.white
                ? Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Comic Sans",
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            doctors,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Comic Sans",
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )
                : Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Comic Sans",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            doctors,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Comic Sans",
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

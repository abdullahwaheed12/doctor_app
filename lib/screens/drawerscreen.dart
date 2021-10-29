import 'package:flutter/material.dart';

class DrawerSreen extends StatefulWidget {
  const DrawerSreen({Key? key}) : super(key: key);

  @override
  _DrawerSreenState createState() => _DrawerSreenState();
}

late double height, width;

class _DrawerSreenState extends State<DrawerSreen> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.brown,
      margin:
          EdgeInsets.only(top: height * 0.15, bottom: height * 0.01, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: width * 0.13,
            child: ClipOval(
              child: Image(
                image: AssetImage("assets/profile.jpg"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Chris Woakes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            "@Flutter Developer",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            // color: Colors.grey,
            height: height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Singleitem(
                  icons: Icon(Icons.home),
                  name: 'Home',
                ),
                Singleitem(
                  icons: Icon(Icons.search),
                  name: 'Explore',
                ),
                Singleitem(
                  icons: Icon(Icons.contact_mail_outlined),
                  name: 'Invite Friends',
                ),
                Singleitem(
                  icons: Icon(Icons.settings),
                  name: 'Settings',
                ),
                Singleitem(
                  icons: Icon(Icons.all_inbox_outlined),
                  name: 'About',
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.17,
          ),
          Singleitem(
            icons: Icon(Icons.logout),
            name: 'Log out',
          ),
        ],
      ),
    );
  }
}

class Singleitem extends StatelessWidget {
  final Icon icons;
  final String name;
  const Singleitem({
    required this.icons,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icons.icon,
          size: 25,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

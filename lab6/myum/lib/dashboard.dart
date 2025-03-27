import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network("https://news.miami.edu/_assets/images-stories/2025/03/fec-week-hero-940x529.jpg", width: 400,),
        Text("University of Miami", style: TextStyle(color: Colors.deepOrange)),
        Padding(padding: EdgeInsets.all(30), child: Text("The University of Miami is one of America's top research universities located in one of the most dynamic and multicultural cities in the world.")),
      ],

    );
  }
}
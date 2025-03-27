import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'customcard.dart';
void main() {
  runApp(const MyUM());
}

class MyUM extends StatelessWidget {
  const MyUM({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyUmApp(),
    );
  }
}

class MyUmApp extends StatefulWidget {
  const MyUmApp({super.key});

  @override
  State<MyUmApp> createState() => _MyUmAppState();
}

class _MyUmAppState extends State<MyUmApp> {

  int currentIndex = 0;
  var titles = [
    "This is the title", 
    "Outdoor Adventures SEALs Program", 
    "Outdoor Adventures",
    ];
  var imgs = [
    "https://exposure.accelerator.net/production/photos/04i951mdm0f9byd3rbsdnid0h0997ve5oypl/original.jpg", 
    "https://news.miami.edu/_assets/images-stories/2023/01/seals-oa-program-hero-365.jpg",
    "https://news.miami.edu/_assets/images-stories/2021/02/outdoor_adventure_center_365x365.jpg",
    
    ];
  var summaries = [
  "Established in 1925 during the region's famous real estate boom, the University now comprises 12 schools and colleges serving undergraduate and graduate students in nearly 350 majors and programs.", 
    "The Student Experience Adventure Leadership semester, or SEALs, is an in-depth, long-term leadership development program that helps participants develop effective life skills and confidence.", 
    "The exterior of Outdoor Adventures on campus, which is locate in Lakeside Village right next to the volleyball courts."
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyUM"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: <Widget>[
          Dashboard(),
          ListView(
            children: <Widget>[
              CustomCard(imgs[0], titles[0], summaries[0]),
              CustomCard(imgs[1], titles[1], summaries[1]),
              CustomCard(imgs[2], titles[2], summaries[2]),
            ],
          ),
          Text("Page $currentIndex"),
          Text("Page $currentIndex"),
        ][currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: <Widget>[
        NavigationDestination(
          icon: Icon(Icons.dashboard),
          label: "Dashboard"),
         NavigationDestination(
          icon: Icon(Icons.pages),
          label: "Page 1"),  
         NavigationDestination(
          icon: Icon(Icons.pages),
          label: "Page 2"),  
         NavigationDestination(
          icon: Icon(Icons.pages),
          label: "Page 3"),
      ]),
    );
  }
}

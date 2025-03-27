import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'customcard.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
// https://news.miami.edu/feeds/latest-25.xml

// network response
Future<String> fetchXML(String url) async {
  final output = await http.get(Uri.parse(url));
  return output.body;
}



void main() {
  runApp(const MyUM());
  // print(fetchXML());
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
  var urls = [
    "https://news.miami.edu/feeds/latest-25.xml",
    "https://news.miami.edu/frost/feeds/all-news-15.xml",
    "https://news.miami.edu/sonhs/feeds/student-stories-feed.xml"
  ];
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

  List<Widget> myNews = [];
  List<Widget> myNews2 = [];
  List<Widget> myNews3 = [];

  @override
  void initState() {
    super.initState();
    fetchXML(urls[0])
    .then((data) {
      // Data was received
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');
      newsitems.take(10).forEach((newsitem) {
        var img = newsitem.getElement('imageSmall')?.innerText;
        var title = newsitem.getElement('title')?.innerText;
        var summary = newsitem.getElement('abstract')?.innerText;
        myNews.add(CustomCard(img!, title!, summary!)); 
      });
    }).catchError((error) {
      print('error getting data: $error');
    });
    fetchXML(urls[1])
    .then((data) {
      // Data was received
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');
      newsitems.take(10).forEach((newsitem) {
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img);
        var title = newsitem.getElement('title')?.innerText;
        print(title);
        var summary = newsitem.getElement('abstract')?.innerText;
        print(summary);
        myNews2.add(CustomCard(img!, title!, summary!));
      });
    }).catchError((error) {
      print('error getting data: $error');
    });
    fetchXML(urls[2])
    .then((data) {
      // Data was received
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');
      newsitems.take(10).forEach((newsitem) {
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img);
        var title = newsitem.getElement('title')?.innerText;
        print(title);
        var summary = newsitem.getElement('abstract')?.innerText;
        print(summary);
        myNews3.add(CustomCard(img!, title!, summary!));
      });
    }).catchError((error) {
      print('error getting data: $error');
    });
  }


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
            children: myNews,
          ),
          ListView(children: myNews2,),
          ListView(children: myNews3,),
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

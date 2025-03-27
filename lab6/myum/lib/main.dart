import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'customcard.dart';
import 'campus_info.dart';

void main() {
  runApp(const MyUM());
}

class MyUM extends StatelessWidget {
  const MyUM({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          primary: Colors.deepOrange,
          secondary: Colors.orangeAccent,
          surface: Colors.grey[100],
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
      home: const MyUmApp(),
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
    "Faculty excellence commended", 
    "Honoring a passion for shaping future doctors through mentorship", 
    "El Niño inspires a young man's passion for science",
    "Foods to fortify",
    "A winning formula",
    "Championing sustainability",
    "Celebrating a century of achievement with music",
    "The musician she was meant to be",
    "Bringing his music back home",
    "A collision of musical worlds",
    "The soul of American song",
    "From childhood talent to industry success",
    ];
  var imgs = [
    "https://news.miami.edu/_assets/images-stories/2025/03/thomas-salerno-hero-790x527.jpg", 
    "https://news.miami.edu/_assets/images-stories/2025/03/albert-varon-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/03/ben-kirtman-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/03/foods-that-prevent-cancer-and-heart-disease-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/03/field-hockey-video-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/03/greenu-office-program-video-hero-790x527.jpg",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/centennialartists365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/raquelsofia365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/musichome365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/tf3365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/02/soulsong365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/idarose365x365.png",
    ];
  var summaries = [
  "Dedicated to his students and the University, Dr. Tomás A. Salerno, professor of surgery in the Cardiothoracic Division, is honored with the 2024–25 James W. McLamore Outstanding Service Award by the Faculty Senate.",
    "A member of the University of Miami faculty for more than 40 years, Dr. Albert J. Varon, professor of anesthesiology at the Miller School of Medicine, is this year's recipient of the Outstanding Teaching Award for his decades of mentorship and leadership.",
    "Benjamin Kirtman, professor at the Rosenstiel School of Marine, Atmospheric, and Earth Science, is this year's recipient of the Distinguished Faculty Scholar Award for his scholarly research and contributions to the natural sciences.",
    "Experts in nutrition science from across the University of Miami offer their thoughts on some of the best foods to help us ward off chronic disease.",
    "More than just a team, the University of Miami's Field Hockey Club fosters camaraderie and teamwork through travel, competition, and a shared passion.",
    "The GreenU Office Program champions a commitment to sustainability in the office—reducing waste, conserving energy, and adopting eco-friendly practices. Join the movement.",
    "A landmark concert by generations of famous Frost School alumni, hosted by celebrity TV host and Cane grad Jason Kennedy, will be the centerpiece of the University of Miami and the Frost School of Music's Centennial Celebration on April 8.",
    "Raquel Sofia's path to international success as a bi-cultural singer and songwriter led through the Frost School of Music.",
    "Multi-talented musician Justin Kinchen took the extraordinary skills he's developed at the Frost School to a concert in his hometown of Indianapolis that showcased his original jazz and classical compositions and paid tribute to his childhood mentors.",
    "The Frost School's elite Stamps Ensembles learned to take new musical risks in a residency with the famed Time For Three trio, which blends multiple popular genres for a bold new interpretation of classical music.",
    "A songwriting class that draws inspiration from the rich panoply of Black music helps students at the Frost School of Music expand their artistry, empathy, and understanding of American music.",
    "The Frost School of Music helped songwriter and producer Alexis 'Idarose' Kesselman turn her musical instincts into remarkable industry achievement.",
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MyUM",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        child: Center(
          child: <Widget>[
            const Dashboard(),
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                CustomCard(imgs[0], titles[0], summaries[0]),
                const SizedBox(height: 16),
                CustomCard(imgs[1], titles[1], summaries[1]),
                const SizedBox(height: 16),
                CustomCard(imgs[2], titles[2], summaries[2]),
                const SizedBox(height: 16),
                CustomCard(imgs[3], titles[3], summaries[3]),
                const SizedBox(height: 16),
                CustomCard(imgs[4], titles[4], summaries[4]),
                const SizedBox(height: 16),
                CustomCard(imgs[5], titles[5], summaries[5]),
              ],
            ),
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                CustomCard(imgs[6], titles[6], summaries[6]),
                const SizedBox(height: 16),
                CustomCard(imgs[7], titles[7], summaries[7]),
                const SizedBox(height: 16),
                CustomCard(imgs[8], titles[8], summaries[8]),
                const SizedBox(height: 16),
                CustomCard(imgs[9], titles[9], summaries[9]),
                const SizedBox(height: 16),
                CustomCard(imgs[10], titles[10], summaries[10]),
                const SizedBox(height: 16),
                CustomCard(imgs[11], titles[11], summaries[11]),
              ],
            ),
            const CampusInfo(),
          ][currentIndex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 65,
        elevation: 8,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.dashboard, size: 28),
            label: "Dashboard",
            selectedIcon: Icon(Icons.dashboard, size: 28, color: Colors.deepOrange),
          ),
          NavigationDestination(
            icon: Icon(Icons.pages, size: 28),
            label: "Page 1",
            selectedIcon: Icon(Icons.pages, size: 28, color: Colors.deepOrange),
          ),
          NavigationDestination(
            icon: Icon(Icons.pages, size: 28),
            label: "Page 2",
            selectedIcon: Icon(Icons.pages, size: 28, color: Colors.deepOrange),
          ),
          NavigationDestination(
            icon: Icon(Icons.pages, size: 28),
            label: "Page 3",
            selectedIcon: Icon(Icons.pages, size: 28, color: Colors.deepOrange),
          ),
        ],
      ),
    );
  }
}

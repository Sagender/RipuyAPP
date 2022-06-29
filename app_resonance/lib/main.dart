import 'package:appcarrusel/details/detail_navBar.dart';
import 'package:appcarrusel/screens/gallery_screen2.dart';
import 'package:flutter/material.dart';

import 'details/detail_screen.dart';
import 'package:flutter/services.dart';

import 'screens/screens.dart';

import 'splash/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Para dar color a la barra de hora y bateria
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      initialRoute: "Splash",
      routes: {
        "Splash": (_) => const SplashScreen(),
        "Home": (_) => const HomeScreen(),
        "Galeria": (_) => GalleryScreen(),
        "Details": (_) => const DetailsScreen(),
        "Reservas": (_) => const DetailReservasScreen(),
        "Alerta": (_) => const AlertScreen(),
        "Drawer": (_) => const DrawerScreen(),
      },
      theme: ThemeData(
        primaryIconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }
}

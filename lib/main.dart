import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/favorites.dart';
import 'package:flutter_app_testing/screens/home.dart';
import 'package:provider/provider.dart';
import 'model/favorites.dart';
void main() {
  runApp(TestingApp());
}
class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          FavoritesPage.routeName: (context) => FavoritesPage(),
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
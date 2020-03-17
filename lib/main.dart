import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/pages/main_page.dart';
import 'package:flutter_ecommerce/src/themes/theme.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Commerce App",
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme
        )
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

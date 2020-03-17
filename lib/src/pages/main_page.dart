import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/pages/home_page.dart';
import 'package:flutter_ecommerce/src/pages/shoping_cart_page.dart';
import 'package:flutter_ecommerce/src/themes/light_color.dart';
import 'package:flutter_ecommerce/src/themes/theme.dart';
import 'package:flutter_ecommerce/src/widgets/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:flutter_ecommerce/src/widgets/title_text.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isHomePageSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context) + (AppTheme.fullHeight(context) / 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _appBar(),
                    _title(),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      switchInCurve: Curves.easeInToLinear,
                      switchOutCurve: Curves.easeOutBack,
                      child: isHomePageSelected
                        ? HomePage()
                        : Align(
                        alignment: Alignment.topCenter,
                        child: ShopingCartPage(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: BottomNavigationBar(),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.sort, color: Colors.black54),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Color(0xfff8f8f8),
                    blurRadius: 10,
                    spreadRadius: 10),
                ],
              ),
              child: Image.asset(
                "assets/user.png",
                fit: BoxFit.cover,
                height: 40,
                width: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _icon(IconData iconData, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: Theme.of(context).backgroundColor,
        boxShadow: AppTheme.shadow
      ),
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }

  Widget _title() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(
                text: isHomePageSelected ? 'Our' : 'Shopping',
                fontSize: 27,
                fontWeight: FontWeight.w400,
              ),
              TitleText(
                text: isHomePageSelected ? 'Products' : 'Cart',
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          Spacer(),
          !isHomePageSelected
              ? Icon(
            Icons.delete_outline,
            color: LightColor.orange,
          )
              : SizedBox()
        ],
      ),
    );
  }
}

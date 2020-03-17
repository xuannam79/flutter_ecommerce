import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/pages/shoping_cart_page.dart';
import 'package:flutter_ecommerce/src/themes/light_color.dart';

class BottomNavigationBar extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    final height = 50.0;
    return Container(
      width: appSize.width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: (appSize.width - _getButtonContainerWidth()) / 2,
            top: 0,
            width: _getButtonContainerWidth(),
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _icon(Icons.home, _selectedIndex == 0, 0),
                _icon(Icons.search, _selectedIndex == 1, 1),
                _icon(Icons.card_travel, _selectedIndex == 2, 2),
                _icon(Icons.favorite_border, _selectedIndex == 3, 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _getButtonContainerWidth() {
    double width = MediaQuery.of(context).size.width;
    if (width > 400.0) {
      width = 400.0;
    }
    return width;
  }

  Widget _icon(IconData iconData, bool isEnable, int index) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        onTap: () {
          if (index == 2) {

            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ShopingCartPage()));
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          alignment: isEnable ? Alignment.topCenter : Alignment.center,
          child: AnimatedContainer(
            height: isEnable ? 40 : 20,
            duration: Duration(milliseconds: 300),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isEnable ? LightColor.orange : Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 0,
                  spreadRadius: 10,
                  offset: Offset(0, -5)
                )
              ],
              shape: BoxShape.circle
            ),
            child: Opacity(
              opacity: 1,
              child: Icon(iconData,
                color: isEnable
                    ? LightColor.background
                    : Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

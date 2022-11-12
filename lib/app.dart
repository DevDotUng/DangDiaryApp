import 'package:dangdiarysample/controllers/bottom_nav_controller.dart';
import 'package:dangdiarysample/pages/home.dart';
import 'package:dangdiarysample/pages/my_page.dart';
import 'package:dangdiarysample/pages/search.dart';
import 'package:dangdiarysample/pages/sticker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: BottomNavController.to.pageIndex.value,
          children: const [
            Home(),
            Search(),
            Sticker(),
            MyPage(),
          ],
        ),
        bottomNavigationBar: _bottomNavBar(),
      ),
    );
  }

  Widget _bottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey[500],
          currentIndex: BottomNavController.to.pageIndex.value,
          onTap: BottomNavController.to.changeBottomNav,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.shopping_cart_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_rounded),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

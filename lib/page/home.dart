import 'package:flutter/material.dart';

import '../obj/category.dart';
import '../pages/cart_view.dart';
import '../pages/history_view.dart';
import '../pages/home_view.dart';
import '../pages/profile_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => Home();

}
class Home extends State<MyHomePage>  with SingleTickerProviderStateMixin{
  int _selectionItem = 0;
  final List<Widget> _pages = <Widget>[
    HomeView(),
    const CartView(),
    const HistoryView(),
    ProfileView()
  ];
  final PageController _pageController = PageController();
  void onTapItem(int index){
    setState(() {
      _selectionItem = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500), // Thời gian chuyển trang
      curve: Curves.easeInOut, // Hiệu ứng chuyển động
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: PageView(
            controller: _pageController, // Gán controller cho PageView
            onPageChanged: (index) {
              setState(() {
                _selectionItem = index; // Cập nhật chỉ số trang khi trang thay đổi
              });
            },
            children: _pages,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectionItem,
          onTap: onTapItem,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectionItem == 0
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: _selectionItem == 1
                  ? const Icon(Icons.shopping_cart)
                  : const Icon(Icons.shopping_cart_outlined),
              label: 'Giỏ hàng',
            ),
            BottomNavigationBarItem(
              icon: _selectionItem == 2
                  ? const Icon(Icons.access_time_filled)
                  : const Icon(Icons.access_time_outlined),
              label: 'Lịch sử',
            ),
            BottomNavigationBarItem(
              icon: _selectionItem == 3
                  ? const Icon(Icons.person)
                  : const Icon(Icons.person_outlined),
              label: 'Bạn',
            ),

          ],
        ),
      ),
    );
  }
}
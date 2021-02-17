import 'package:flutter/material.dart';
import 'package:flutter_navigation_samples/bottom_navigation_bar/pages/bottom_navigation_page_1.dart';
import 'package:flutter_navigation_samples/bottom_navigation_bar/pages/bottom_navigation_page_2.dart';
import 'package:flutter_navigation_samples/bottom_navigation_bar/pages/bottom_navigation_page_3.dart';

class BottomNavigationBarHome extends StatefulWidget {

  @override
  _BottomNavigationBarHomeState createState() => _BottomNavigationBarHomeState();
}

class _BottomNavigationBarHomeState extends State<BottomNavigationBarHome> {
  PageController _pageController;

  int _page = 0;


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose(); // Freeing up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _page,

        onTap: (pageIndex){
          _pageController.animateToPage(
            pageIndex,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease
          );
        },

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Page 1'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: 'Page 2'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline),
              label: 'Page 3'
          ),
        ],
      ),

      // We'll use SafeArea to display the content only where the screen
      // aren't covered
      body: SafeArea(
        child: PageView(
          controller: _pageController,

          // Don't let the user change the page by sliding his finger
          physics: NeverScrollableScrollPhysics(),

          onPageChanged: (p){
            setState(() {
              _page = p;
            });
          },

          children: [
            // Sample Pages
            BottomNavigationPage1(),
            BottomNavigationPage2(),
            BottomNavigationPage3(),
          ],
        ),
      ),
    );
  }
}

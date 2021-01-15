import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData _icon;
  final int _pageIndex;
  final String _pageTitle;
  final PageController _pageController;

  DrawerTile(this._icon, this._pageTitle, this._pageIndex, this._pageController);

  @override
  Widget build(BuildContext context) {
    return Material( // Without Material, we dont have touch visual effect
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          // Jump to Other Page
          Navigator.of(context).pop();
          _pageController.jumpToPage(this._pageIndex);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: [
              Icon(
                  this._icon,
                  size: 32.0,
                  color: _pageController.page.round() == this._pageIndex ? Theme.of(context).primaryColor : Colors.grey[700]
              ),
              SizedBox(width: 32.0,),
              Text(
                this._pageTitle,
                style: TextStyle(
                    fontSize: 16.0,
                    color: _pageController.page.round() == this._pageIndex ? Theme.of(context).primaryColor : Colors.grey[700]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

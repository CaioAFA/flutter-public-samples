import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHome extends StatefulWidget {
  @override
  _ShimmerHomeState createState() => _ShimmerHomeState();
}

class _ShimmerHomeState extends State<ShimmerHome> {

  bool _isLoading = true;
  String _title = '';
  String _subtitle = '';

  void _loadData() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;

      _title = 'Título';
      _subtitle = 'Subtitulo';
    });
  }

  @override
  Widget build(BuildContext context) {

    _loadData();

    return Scaffold(
      appBar: AppBar(
        title: Text('Shimmer - Loading Effect'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ListTile(
                leading: _isLoading ? _renderCircularShimmer() : CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: _isLoading ? _renderShimmer(width: 100, height: 20) : Text(_title),
                subtitle: _isLoading ? _renderShimmer(width: 50, height: 10) : Text(_subtitle),
              )
            ],
          ),
        ]
      ),
    );
  }

  Widget _renderShimmer({@required double height}){
    return SizedBox(
      width: 9999,
      height: height,
      child: Shimmer.fromColors(
        child: Container(
          color: Colors.white.withAlpha(50),
        ),
        baseColor: Colors.white,
        highlightColor: Colors.black,
      ),
    );
  }

  Widget _renderCircularShimmer(){
    return SizedBox(
      width: 40,
      height: 35,
      child: Shimmer.fromColors(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(50),
            shape: BoxShape.circle
          ),
        ),
        baseColor: Colors.white,
        highlightColor: Colors.black,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:useful_widgets/infinite_scroll/fake_api.dart';

class InfiniteScrollSample extends StatefulWidget {
  @override
  _InfiniteScrollSampleState createState() => _InfiniteScrollSampleState();
}

class _InfiniteScrollSampleState extends State<InfiniteScrollSample> {

  FakeApi fakeApi = FakeApi();

  // Data to be rendered
  List<int> data;

  _InfiniteScrollSampleState(){
    data = fakeApi.getData(); // Load Initial data
  }

  Future _loadMoreData(){
    Future.delayed(Duration(seconds: 3)).then((_){
      setState(() {
        data += fakeApi.getNextData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scroll Sample'),
        centerTitle: true,
      ),

      // The InfiniteScroll is a ListView.builder with some special parameters.
      // Pay attention to the comments!
      body: ListView.builder(
        itemCount: data.length + 1, // List size + 1
        itemBuilder: (context, index){
          if(index < data.length){ // Situation 1/3 - Render Data
            return _buildCard(data[index].toString());
          }
          else if(index > 1){ // Situation 2/3 - Load more data Async and render the Loader
             _loadMoreData(); // Load more data
            return _buildLoader();
          }

          return Container(); // Situation 3/3 - No Data
        }
      ),
    );
  }

  Widget _buildCard(String text){
    return Container(
      height: 150,
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        elevation: 5,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoader(){
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 15.0, top: 15.0),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      ),
    );
  }
}

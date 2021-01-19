import 'package:flutter/material.dart';
import 'package:search_screen_sample/search_build_return/data_search.dart';
import 'package:search_screen_sample/search_build_return/home.dart';
import 'package:search_screen_sample/search_return/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Screen Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen Sample'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _createCard(
            title: '1º exemplo: procurar e retornar um resultado.',
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>SearchReturnHome())
              );
            }
          ),
          _createCard(
            title: '2º exemplo: procurar, desenhar uma tela e retornar um resultado.',
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>SearchBuildReturnHome())
              );
            }
          )
        ],
      ),
    );
  }

  Widget _createCard({@required String title, @required VoidCallback onTap}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        elevation: 5,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}

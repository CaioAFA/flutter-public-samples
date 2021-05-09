import 'package:flutter/material.dart';
import 'package:useful_widgets/appbar_seach/appbar_seaeach.dart';

class AppBarSearchHome extends StatefulWidget {
  @override
  _AppBarSearchHomeState createState() => _AppBarSearchHomeState();
}

class _AppBarSearchHomeState extends State<AppBarSearchHome> {

  String searchText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  // Get the text
                  final String search = await showDialog(context: context, builder: (_) => AppBarSearch());

                  setState(() {
                    searchText = search;
                  });
                },
                child: Text(
                  'Buscar'
                ),
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: (){
              setState(() {
                searchText = '';
              });
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sua busca foi: $searchText',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:search_screen_sample/search_return/data_search.dart';

class SearchReturnHome extends StatefulWidget {
  @override
  _SearchReturnHomeState createState() => _SearchReturnHomeState();
}

class _SearchReturnHomeState extends State<SearchReturnHome> {

  String _searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Procurar e Retornar'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Procure por Abacaxi, Banana ou Cereja',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0,),
            FlatButton(
              child: Text(
                'Pesquisar',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500
                ),
              ),
              color: Theme.of(context).secondaryHeaderColor,
              onPressed: () async {
                // Here, we open the Search Screen
                String search = await showSearch(context: context, delegate: SearchReturnDataSearch());

                setState(() {
                  _searchValue = search;
                });
              },
            ),
            SizedBox(height: 20.0,),
            _searchValue == null || _searchValue.isEmpty ? Container() :
            Text(
              'Valor Pesquisado: ${_searchValue}',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500
              )
            )
          ],
        ),
      ),
    );
  }
}
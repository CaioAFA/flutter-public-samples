import 'package:flutter/material.dart';
import 'package:screen_samples/search_render_return/data_search.dart';

class SearchRenderReturnHome extends StatefulWidget {
  @override
  _SearchRenderReturnHome createState() => _SearchRenderReturnHome();
}

class _SearchRenderReturnHome extends State<SearchRenderReturnHome> {

  String _searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Procurar, Desenhar e Retornar'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Procure por Abacaxi, Banana ou Cereja.',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0,),
            Text(
              'Clique nas sugestões e no botão de "Pesquisar" do teclado.',
              style: TextStyle(
                fontSize: 20.0,
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
                String search = await showSearch(context: context, delegate: SearchRenderReturnDataSearch());

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
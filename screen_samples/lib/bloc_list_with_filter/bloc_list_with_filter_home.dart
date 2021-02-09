import 'package:flutter/material.dart';
import 'package:screen_samples/bloc_list_with_filter/list_bloc.dart';

class BlocListWithFilterHome extends StatelessWidget {

  final _listBloc = ListBloc();
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('BLoC - Lista Com Filtro'),
            Text('(Plugins: Bloc_Provider e RXDart)', style: TextStyle(fontSize: 14),)
          ],
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: _textFieldController,
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue
                        )
                      )
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){
                    // Filter the results
                    final searchCriteria = _textFieldController.text;
                    _listBloc.onSearchCriteriaChange(searchCriteria);
                  }
                )
              ],
            ),
          ),
          StreamBuilder<List<String>>(
            stream: _listBloc.getList,
            builder: (context, snapshot) {
              final List<String> list = snapshot.data;

              if(list == null) return Container();

              return Column(
                children: list.map((d){
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(d[0]), // First letter of String
                    ),
                    title: Text(d),
                    onTap: (){},
                  );
                }).toList(),
              );
            }
          )
        ],
      ),
    );
  }
}

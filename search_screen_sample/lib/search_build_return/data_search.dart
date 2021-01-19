import 'package:flutter/material.dart';
import 'package:search_screen_sample/fake_data.dart';

class SearchBuildReturnDataSearch extends SearchDelegate<String>{

  // Changes the input hint text
  @override
  String get searchFieldLabel => 'Pesquisar...';

  // Widgets on the Right Side
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      // Clear the input
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = ''; // "query" references the Text Field
          }
      )
    ];
  }

  // Left side Widgets.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null); // Closes the Search Screen and Returns null
      },
    );
  }

  // Function Executed after pressing the "Search Button" on the keyboard.
  @override
  Widget buildResults(BuildContext context) {
    List searchResults = fakeDataQuery(query);

    if(searchResults.length == 0){
      return Center(
        child: Text(
          'Nenhum resultado encontrado\n\n:(',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold
          ),
        ),
      );
    }

    return ListView(
      children: searchResults.map((result){
        return Container(
          height: 100.0,
          child: Card(
            elevation: 5,
            child: Material(
              child: InkWell(
                onTap: (){
                  close(context, result['title']);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 2,
                      // child: Image.asset(result['image'], fit: BoxFit.fill,),
                      child: Ink.image(image: AssetImage(result['image']), fit: BoxFit.cover,),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          result['title'],
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Function executed when we change the text input.
  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty)
      return Container();

    List searchResults = fakeDataQuery(query);

    return ListView(
      children: searchResults.map((result){
        return ListTile(
          title: Text(result['title']),
          leading: Icon(Icons.play_arrow),
          onTap: (){
            close(context, result['title']);
          },
        );
      }).toList(),
    );
  }
}
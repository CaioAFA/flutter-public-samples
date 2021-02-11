import 'package:flutter/material.dart';
import 'package:screen_samples/search_return/fake_data.dart';

class SearchReturnDataSearch extends SearchDelegate<String>{

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
    // Dont ask why do we need it. It just works!
    Future.delayed(Duration.zero).then((_) =>
        close(context, query)
    );
    return Container();
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
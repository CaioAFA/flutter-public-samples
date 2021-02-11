List data = [
  {
    'title': 'Abacaxi',
    'image': 'images/abacaxi.jpg'
  },
  {
    'title': 'Banana',
    'image': 'images/banana.png'
  },
  {
    'title': 'Cereja',
    'image': 'images/cereja.jpg'
  }
];

List<dynamic> fakeDataQuery(String query){
  List<dynamic> resultList = data.where((d){
    return d['title'].toLowerCase().contains(query.toLowerCase());
  }).toList();
  return resultList;
}

class FakeApi{
  int _index;

  List<int> getData(){
    List<int> data = [];

    for(_index = 0; _index < 10; _index++){
      data.add(_index);
    }

    return data;
  }

  List<int> getNextData(){
    List<int> data =[];

    for(var i = _index; i < _index + 5; i++){
      data.add(i);
    }

    _index += 5;

    return data;
  }
}
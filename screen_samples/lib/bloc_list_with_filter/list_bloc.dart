import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class ListBloc extends BlocBase{
  // Creating the List Controller
  final _listController = BehaviorSubject<List<String>>();
  Stream <List<String>> get getList => _listController.stream;

  ListBloc(){
    // Load the data when BLoC is created
    _listController.sink.add(_data);
  }

  void onSearchCriteriaChange(String searchCriteria){
    if(searchCriteria.trim().isEmpty){
      _listController.sink.add(_data); // No filter
    }
    else{
      _listController.sink.add(
        _filter(searchCriteria)
      );
    }
  }

  List<String> _filter(String s){
    List<String> filteredData = _data.toList();

    // Filter the elements who have s variable
    filteredData.retainWhere((d){
      return d.toUpperCase().contains(s.toUpperCase());
    });

    return filteredData;
  }

  @override
  void dispose() {
    _listController.close();
  }

  List<String> _data = [
    'Abacaxi',
    'Berinjela',
    'Cereja',
    'Damasco',
    'Espetinho',
    'Farofa',
    'Guaraná',
    'Hamburguer',
    'Iogurte',
    'Jaca',
    'Kiwi',
    'Limão',
    'Melancia',
    'Noz',
    'Omelete',
    'Patinho',
    'Queijo',
    'Requeijão',
    'Salada',
    'Tomate',
    'Uva',
    'Vagem',
    'Xícara de Café',
    'Zé'
  ];
}
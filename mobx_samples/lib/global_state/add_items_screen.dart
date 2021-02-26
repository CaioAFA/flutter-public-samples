import 'package:flutter/material.dart';
import 'package:mobx_samples/global_state/stores/cart_store.dart';
import 'package:provider/provider.dart';

class AddItemsScreen extends StatefulWidget {
  @override
  _AddItemsScreenState createState() => _AddItemsScreenState();
}

class _AddItemsScreenState extends State<AddItemsScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CartStore cartStore;

  @override
  void initState() {
    cartStore = Provider.of<CartStore>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Adicione os Itens'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _renderListTile('abacaxi'),
          _renderListTile('banana'),
          _renderListTile('cereja')
        ],
      ),
    );
  }

  Widget _renderListTile(String title){
    double imageSize = 40.0;

    return ListTile(
      title: Text(capitalize(title), style: TextStyle(fontSize: 20),),
      leading: Image.asset(
        'images/global_state_sample/${title}-icone.png',
        height: imageSize,
        width: imageSize,
        fit: BoxFit.fill,
      ),
      trailing: Icon(Icons.plus_one_outlined),
      onTap: (){
        _scaffoldKey.currentState.hideCurrentSnackBar();
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text('"$title" adicionado com sucesso.', style: TextStyle(fontSize: 17),),
          )
        );

        cartStore.addCartItem(title);
      },
    );
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}

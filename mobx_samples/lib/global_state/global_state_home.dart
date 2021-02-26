import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_samples/global_state/add_items_screen.dart';
import 'package:mobx_samples/global_state/cart_screen.dart';
import 'package:mobx_samples/global_state/stores/cart_store.dart';
import 'package:provider/provider.dart';

class GlobalStateHome extends StatefulWidget {
  @override
  _GlobalStateHomeState createState() => _GlobalStateHomeState();
}

// Use Stateful Widgets to use Global State.
class _GlobalStateHomeState extends State<GlobalStateHome> {

  // See "main.dart" file. Pay attention to Provider configuration:
  // we need it to use Global State.
  CartStore cartStore;

  @override
  void initState() {
    // Get the Store to access global state. We need to pass false to "listen"
    // when it gives the error dependOnInheritedWidgetOfExactType<_InheritedProviderScope...
    cartStore = Provider.of<CartStore>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado Global'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(
                  size: 45,
                ),
                Text(
                  'lutter\'s Store',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0,),
            SizedBox(
              height: 45.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text('Adicionar Itens'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddItemsScreen())
                      );
                    },
                  ),
                  Observer(
                    builder: (context){
                      return RaisedButton(
                        child: Text('Ver Carrinho (${cartStore.cartItems.length})'),
                        color: Colors.black,
                        textColor: Colors.white,
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => CartScreen())
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

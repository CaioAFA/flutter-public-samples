import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_samples/global_state/stores/cart_store.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  CartStore cartStore;

  @override
  void initState() {
    cartStore = Provider.of<CartStore>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context){
          return ListView(
            children: [
              for(int index = 0; index < cartStore.cartItems.length; index++)
                Container(
                  height: 80.0,
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'images/global_state_sample/${cartStore.cartItems[index]}-icone.png',
                            width: 60.0,
                            height: 80.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            capitalize(cartStore.cartItems[index]),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        IconButton(
                            icon: Icon(Icons.remove_circle, color: Colors.red,),
                            onPressed: (){
                              cartStore.removeCartItem(index);
                            }
                        )
                      ],
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}

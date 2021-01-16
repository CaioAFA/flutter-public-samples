import 'package:flutter/material.dart';
import 'package:global_data/scoped_model/access_model_method_1.dart';
import 'package:global_data/scoped_model/model/counter_model.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScopedModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // All childrens will have access to the Models.
    // Requires the "scoped_model" plugin!

    // We need to send all models on the app root.
    // To send one model, we need only the ScopedModel.
    // To send two or more, we need to pass a ScopedModelDescendant and a new ScopedModel
    return ScopedModel<CounterModel>(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scoped Model'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            AccessModelMethod1(),
          ],
        ),
      ),
    );
  }
}

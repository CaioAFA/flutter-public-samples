import 'package:flutter/material.dart';
import 'package:global_data/provider/models/my_model.dart';
import 'package:provider/provider.dart';

import 'home_provider_screen.dart';

class MainProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Here, we add all of the providers (who have the global shared data)
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyModel>.value(value: MyModel())
      ],
      child: HomeProviderScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:useful_widgets/dropdown_button/bordered_dropdown_button/bordered_dropdown_button.dart';
import 'package:useful_widgets/dropdown_button/standard_dropdown_button/standard_dropdown_button.dart';

class DropdownButtonHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Button'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0,),
              StandardDropdownButton(),
              Divider(thickness: 2,),
              SizedBox(height: 10,),
              BorderedDropdownButton()
            ],
          ),
        ),
      ),
    );
  }
}

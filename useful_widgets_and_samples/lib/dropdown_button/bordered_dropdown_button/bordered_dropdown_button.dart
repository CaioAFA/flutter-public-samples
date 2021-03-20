import 'package:flutter/material.dart';

class BorderedDropdownButton extends StatefulWidget {
  @override
  _BorderedDropdownButtonState createState() => _BorderedDropdownButtonState();
}

class _BorderedDropdownButtonState extends State<BorderedDropdownButton> {

  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  String selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Dropdown Com Borda',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(height: 15,),

        InputDecorator(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              )
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            isDense: true,
            isExpanded: true,
            dropdownColor: Colors.white,
            hint: Text(
              "Dropdown Com Borda",
            ),
            underline: Container(
              height: 0.4,
              color: Colors.white,
            ),
            onChanged: (String value){
              setState(() {
                selectedValue = value;
              });
            },
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            selectedItemBuilder: (BuildContext context) {
              return items.map<Widget>((String item) {
                return Text(item);
              }).toList();
            },
          ),
        ),
      ],
    );
  }
}

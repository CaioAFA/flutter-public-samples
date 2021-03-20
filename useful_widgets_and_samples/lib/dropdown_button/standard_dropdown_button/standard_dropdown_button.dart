import 'package:flutter/material.dart';

class StandardDropdownButton extends StatefulWidget {
  @override
  _StandardDropdownButtonState createState() => _StandardDropdownButtonState();
}

class _StandardDropdownButtonState extends State<StandardDropdownButton> {

  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  String selectedValue;

  // Configurations
  bool isDense = false;
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Dropdown Padrão',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(height: 15,),

        DropdownButton<String>(
          value: selectedValue,
          isDense: isDense, // Dense = more compact
          isExpanded: isExpanded, // Expanded Widget
          dropdownColor: Colors.white,
          hint: Text(
            "Dropdown Button Padrão",
          ),
          underline: Container(
            height: 0.4,
            color: Colors.black,
          ),
          onChanged: (String value){
            setState(() {
              selectedValue = value;
            });
          },

          items: items.map((String item) { // Dropdown List
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),

          selectedItemBuilder: (BuildContext context) { // Selected Item
            return items.map<Widget>((String item) {
              return Text(item);
            }).toList();
          },
        ),

        // Configurations
        Column(
          children: [
            // Is Dense
            Row(
              children: [
                Checkbox(
                    value: isDense,
                    onChanged: (bool value){
                      setState(() {
                        isDense = value;
                      });
                    }
                ),
                Text(
                  'isDense?'
                ),
              ],
            ),

            // Is Expanded
            Row(
              children: [
                Checkbox(
                  value: isExpanded,
                  onChanged: (bool value){
                    setState(() {
                      isExpanded = value;
                    });
                  }
                ),
                Text(
                  'isExpanded?'
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

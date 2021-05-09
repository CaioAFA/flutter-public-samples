import 'package:flutter/material.dart';

class AppBarSearch extends StatelessWidget {

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              controller: textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: InputBorder.none,
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.grey[700],
                  onPressed: Navigator.of(context).pop,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.grey[700],
                  onPressed: textEditingController.clear,
                ),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (text) {
                Navigator.of(context).pop(text);
              },
            ),
          ),
        ),
      ],
    );
  }

}

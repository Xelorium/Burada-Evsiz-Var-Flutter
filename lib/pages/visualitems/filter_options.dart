import 'package:flutter/material.dart';

class FilterOptionsMenu extends StatefulWidget {
  const FilterOptionsMenu({Key? key}) : super(key: key);

  @override
  State<FilterOptionsMenu> createState() => _FilterOptionsMenuState();
}

class _FilterOptionsMenuState extends State<FilterOptionsMenu> {
  List<bool> isSelected = List.generate(2, (index) => false);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: const Text('Filtreleme Ayarları'),
      content: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              Text('A-Z Sıralaması: '),
              SizedBox(width: 5,),
              ToggleButtons(
                children: <Widget>[Icon(Icons.check), Icon(Icons.close)],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < isSelected.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected[buttonIndex] = true;
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: isSelected,
              ),
            ],
          )
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Onayla'),
        )
      ],
    );
  }
}

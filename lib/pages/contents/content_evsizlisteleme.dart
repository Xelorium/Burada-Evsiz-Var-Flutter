import 'package:burada_evsiz_var/utils/list_element.dart';
import 'package:flutter/material.dart';

import '../../utils/color_palette.dart';

class EvsizlistContent extends StatefulWidget {
  const EvsizlistContent({Key? key}) : super(key: key);

  @override
  State<EvsizlistContent> createState() => _EvsizlistContentState();
}

class _EvsizlistContentState extends State<EvsizlistContent> {
  // The controller for the text field
  final TextEditingController _controller = TextEditingController();

  // This function is triggered when the clear buttion is pressed
  void _clearTextField() {
    // Clear everything in the text field
    _controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(25),
        height: 800,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 250,
                  child: TextField(
                    controller: _controller,
                    onChanged: (value) {
                      // Call setState to update the UI
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: 'Search',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _controller.text.isEmpty
                          ? null // Show nothing if the text field is empty
                          : IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: _clearTextField,
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                IconButton(
                    iconSize: 35,
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: Palette.accentAppColor,
                    ))
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              height: 500,
              child: ListView(
                children: [
                  ListElementCreator(konumVerisi: 'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                ],
              ),
            ),
          ],
        )
    );
  }
}

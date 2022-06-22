import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:burada_evsiz_var/utils/list_element.dart';
import 'package:flutter/material.dart';

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
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Row(
                children: [
                  SizedBox(
                    child: TextField(
                      controller: _controller,
                      onChanged: (value) {
                        // Call setState to update the UI
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        labelText: 'Evsiz arayın..',
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
                    width: 250,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.filter_alt_outlined),
                    color: Palette.accentAppColor,
                    iconSize: 35,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(color: Colors.transparent),
              child: ListView(
                children: <Widget>[
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                  ListElementCreator(
                      konumVerisi:
                          'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

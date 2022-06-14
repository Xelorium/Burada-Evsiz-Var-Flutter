import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePostCard extends StatelessWidget {

  final String gonderiAciklamasi;

  const CreatePostCard({super.key, required this.gonderiAciklamasi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 1.5,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: EdgeInsets.all(18.0),
          width: double.infinity,
          height: 362.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Text(gonderiAciklamasi)
                    ],
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graduation/lib/models/message_model.dart';

class chatshared extends StatelessWidget {
  chatshared({ required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0 , top: 10 , right: 20 , bottom: 5),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: Colors.blueGrey,
          ),
          padding: EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 10 ),
          child: Text(
            message.content!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class chatsharedfriend extends StatelessWidget {
  chatsharedfriend({ required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0 , top: 10 , right: 20 , bottom: 5),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
            color: Colors.blueGrey[900],
          ),
          padding: EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 10 ),
          child: Text(
            message.content!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

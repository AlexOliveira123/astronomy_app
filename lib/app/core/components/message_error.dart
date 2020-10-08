import 'package:flutter/material.dart';

class MessageError extends StatelessWidget {
  final String msg;
  const MessageError({Key key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
          child: Text(
        msg,
        style: TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
      )),
    );
  }
}

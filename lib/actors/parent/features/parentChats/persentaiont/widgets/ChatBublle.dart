import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentChats/data/message_entity.dart';

class ChatBublle extends StatelessWidget {
  const ChatBublle({
    super.key,
    required this.messageModel,
  });
  final MessageEntity messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32)),
            color: Color.fromRGBO(241, 244, 255, 1)),
        child: Padding(
          padding: EdgeInsets.only(left: 14, top: 10, bottom: 10, right: 12),
          child: Text(messageModel.message!,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins',
                  color: Color.fromRGBO(48, 48, 50, 1))),
        ),
      ),
    );
  }
}

class ChatBublleForMe extends StatelessWidget {
  const ChatBublleForMe({
    super.key,
    required this.messageModel,
  });
  final MessageEntity messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32)),
            color: Color.fromRGBO(171, 186, 244, 1)),
        child: Padding(
          padding: EdgeInsets.only(left: 14, top: 10, bottom: 10, right: 12),
          child: Text(messageModel.message,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins',
                  color: Color.fromRGBO(48, 48, 50, 1))),
        ),
      ),
    );
  }
}

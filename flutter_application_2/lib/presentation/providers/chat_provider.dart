import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/helpers/get_yes_no_answer.dart';
import 'package:flutter_application_2/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(
      text: 'Hola amor!',
      fromWho: FromWho.mine,
      isRead: false,
      time: DateTime.now(),
    ),
    Message(
      text: 'Ya regresaste del trabajo?',
      fromWho: FromWho.mine,
      isRead: false,
      time: DateTime.now(),
    ),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(
      text: text,
      fromWho: FromWho.mine,
      time: DateTime.now(),
      isRead: false,
    );
    messageList.add((newMessage));

    if (text.endsWith("?")) {
      herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
;
  }

  void moveScrollToBottom() async {
    await Future.delayed(Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}

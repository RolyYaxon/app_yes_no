import 'package:app_yes_no/config/helpers/get_yes_no_wtf.dart';
import 'package:app_yes_no/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollContoller = ScrollController();
  final GetYesNo getYesNo = GetYesNo();

  List<Message> messages = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messages.add(newMessage);

    if (text.endsWith("?")) {
      replyO();
    }
    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> replyO() async {
    final answer = await getYesNo.getAnswer();
    messages.add(answer);
    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> moveScrollToBotton() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollContoller.animateTo(chatScrollContoller.position.maxScrollExtent,
        duration: const Duration(microseconds: 3), curve: Curves.easeOut);
  }
}

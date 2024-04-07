import 'package:app_yes_no/domain/entities/message.dart';
import 'package:app_yes_no/presentation/providers/chat_provider.dart';
import 'package:app_yes_no/presentation/widgets/chat/my_bubble.dart';
import 'package:app_yes_no/presentation/widgets/chat/other_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://solowrestling.mundodeportivo.com/uploads/mobileRESEM125003cena.jpg'),
          ),
        ),
        title: const Text('John Cena'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollContoller,
                    itemCount: chatProvider.messages.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messages[index];
                      return (message.fromWho == FromWho.others)
                      ? OtherBubble(message: message)
                      : MyBubble(message: message);
                    })),

            /// Caja de texto de mensajes
             MessageFieldBox(
              onValue: chatProvider.sendMessage
              ,
             ),
          ],
        ),
      ),
    );
  }
}

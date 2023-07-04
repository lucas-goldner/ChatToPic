import 'package:chattopic/ui/style/painters/chat_room_painter.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ChatRoomPainter(),
      size: const Size(280, 60),
    );
  }
}

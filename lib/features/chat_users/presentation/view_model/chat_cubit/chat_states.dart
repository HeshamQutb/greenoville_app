part of 'chat_cubit.dart';

abstract class ChatStates {
  const ChatStates();
}

class ChatInitialState extends ChatStates {}

class ChatSuccess extends ChatStates {
  List<MessageModel> messagesList;
  ChatSuccess({required this.messagesList});
}

part of 'chat_cubit.dart';

abstract class ChatStates {
  const ChatStates();
}

class ChatInitialState extends ChatStates {}

class SendMessageSuccessState extends ChatStates {}

class SendMessageErrorState extends ChatStates {
  final String error;
  SendMessageErrorState(this.error);
}


class GetMessageSuccessState extends ChatStates {
  List<MessageModel> messagesList;
  GetMessageSuccessState({required this.messagesList});
}

class GetMessageErrorState extends ChatStates {
  final String error;
  GetMessageErrorState(this.error);
}



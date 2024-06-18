part of 'chat_cubit.dart';

abstract class ChatUsersStates {
  const ChatUsersStates();
}

class ChatUsersInitialState extends ChatUsersStates {}


class GetChatUsersLoadingState extends ChatUsersStates {}

class GetChatUsersSuccessState extends ChatUsersStates {
  final List<UserModel> chatUsers;
  GetChatUsersSuccessState({required this.chatUsers});
}

class GetChatUsersErrorState extends ChatUsersStates {
  final String error;
  GetChatUsersErrorState(this.error);
}
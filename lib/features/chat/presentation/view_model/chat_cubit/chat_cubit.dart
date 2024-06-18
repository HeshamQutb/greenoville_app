import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/chat_model.dart';

part 'chat_states.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  List<MessageModel> messagesList = [];

  late String currentUserID;
  late String currentFriendID;

  void initializeChat(String userID, String friendID) {
    currentUserID = userID;
    currentFriendID = friendID;
    getMessages(friendID);
  }

  void sendMessage({
    required String message,
    required String friendID,
  }) {
    final messageData = {
      'message': message,
      'createdAt': DateTime.now(),
      'senderId': currentUserID,
    };

    try {
      // Send message to the sender's collection
      FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserID)
          .collection('chats')
          .doc(friendID)
          .collection('messages')
          .add(messageData);

      // Send message to the receiver's collection
      FirebaseFirestore.instance
          .collection('users')
          .doc(friendID)
          .collection('chats')
          .doc(currentUserID)
          .collection('messages')
          .add(messageData);
      emit(SendMessageSuccessState());
    } catch (error) {
      print(error.toString());
      emit(SendMessageErrorState(error.toString()));
    }
  }

  void getMessages(String friendID) {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserID)
          .collection('chats')
          .doc(friendID)
          .collection('messages')
          .orderBy('createdAt', descending: true)
          .snapshots()
          .listen((event) {
        messagesList.clear();
        for (var doc in event.docs) {
          messagesList.add(MessageModel.fromJson(doc.data()));
        }
        emit(GetMessageSuccessState(messagesList: messagesList));
      });
    } catch (error) {
      print(error.toString());
      emit(GetMessageErrorState(error.toString()));
    }
  }
}

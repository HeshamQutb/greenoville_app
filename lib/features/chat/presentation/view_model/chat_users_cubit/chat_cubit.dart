import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth/data/models/user_model.dart';

part 'chat_states.dart';

class ChatUsersCubit extends Cubit<ChatUsersStates> {
  ChatUsersCubit() : super(ChatUsersInitialState());

  static ChatUsersCubit get(context) => BlocProvider.of(context);

  List<String> userIds = [];

  Future<List<UserModel>> getChatUsers({required String uId}) async {
    try {
      // Step 1: Fetch the list of user IDs from the 'chats' subcollection
      final chatSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('chats')
          .get();

      if (chatSnapshot.docs.isEmpty) {
        return [];
      }

      List<String> userIds = [];
      for (var doc in chatSnapshot.docs) {
        userIds.add(doc.id);
      }

      // Step 2: Fetch the details of these users from the 'users' collection
      List<UserModel> chatUsers = [];
      for (String userId in userIds) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (userDoc.exists) {
          chatUsers.add(UserModel.fromJson(userDoc.data()));
        }
      }
      emit(GetChatUsersSuccessState(chatUsers: chatUsers));
      return chatUsers;
    } catch (error) {
      emit(GetChatUsersErrorState(error.toString()));
      throw Exception('Failed to load chat participants');
    }
  }
}

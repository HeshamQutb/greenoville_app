import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_model/chat_cubit/chat_cubit.dart';
import 'widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  final String friendID;

  const ChatView({
    super.key,
    required this.friendID,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..initializeChat(uId!, friendID),
      child: BlocConsumer<ChatCubit, ChatStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var chatCubit = ChatCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(
              title: S.of(context).chat,
              leadingAction: () {
                Navigator.pop(context);
              },
            ),
            body: ChatViewBody(
              friendID: friendID,
              chatCubit: chatCubit,
            ),
          );
        },
      ),
    );
  }
}

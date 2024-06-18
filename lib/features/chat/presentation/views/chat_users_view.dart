import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/data/models/user_model.dart';
import '../view_model/chat_users_cubit/chat_cubit.dart';

class ChatUsersScreen extends StatefulWidget {
  const ChatUsersScreen({super.key});

  @override
  State<ChatUsersScreen> createState() => _ChatUsersScreenState();
}

class _ChatUsersScreenState extends State<ChatUsersScreen> {
  late Future<List<UserModel>> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = ChatUsersCubit.get(context).getChatUsers(uId: uId!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatUsersCubit, ChatUsersStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: S.of(context).chat,
            leadingAction: () {
              Navigator.pop(context);
            },
          ),
          body: FutureBuilder<List<UserModel>>(
            future: futureUser,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${S.of(context).error}: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text(S.of(context).noChatParticipantsFound),
                );
              } else {
                final chatUsers = snapshot.data!;
                return ListView.builder(
                  itemCount: chatUsers.length,
                  itemBuilder: (context, index) {
                    final user = chatUsers[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          user.userImage,
                        ),
                      ),
                      title: Text(user.userName),
                      subtitle: Text(user.userEmail),
                      trailing: Text(user.userPhone),
                    );
                  },
                );
              }
            },
          ),
        );
      },
    );
  }
}

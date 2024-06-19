// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:greenoville_app/core/utils/icon_broken.dart';
// import '../../../../../constants.dart';
// import '../../../../../core/widgets/custom_text_field.dart';
// import '../../../../../generated/l10n.dart';
// import '../../../data/models/chat_users_model.dart';
// import '../../view_model/chat_cubit/search_cubit.dart';
// import 'chat_bubble_friend.dart';
// import 'chat_bubble_user.dart';
//
// class ChatViewBody extends StatefulWidget {
//   const ChatViewBody({
//     super.key,
//     required this.friendID,
//     required this.chatCubit,
//   });
//   final String friendID;
//   final ChatUsersCubit chatCubit;
//
//   @override
//   State<ChatViewBody> createState() => _ChatViewBodyState();
// }
//
// class _ChatViewBodyState extends State<ChatViewBody> {
//   final scrollController = ScrollController();
//   TextEditingController messageController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     super.initState();
//     widget.chatCubit.getMessages(widget.friendID);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ChatUsersCubit, ChatUsersStates>(
//       builder: (context, state) {
//         return Padding(
//           padding: const EdgeInsets.all(kDefaultPadding),
//           child: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 Expanded(
//                   child: BlocBuilder<ChatUsersCubit, ChatUsersStates>(
//                     builder: (context, state) {
//                       List<MessageModel> messagesList =
//                           widget.chatCubit.messagesList;
//                       return ListView.builder(
//                         reverse: true,
//                         controller: scrollController,
//                         itemCount: messagesList.length,
//                         itemBuilder: (context, index) {
//                           return messagesList[index].senderId ==
//                                   widget.chatCubit.currentUserID
//                               ? ChatBubbleUser(message: messagesList[index])
//                               : ChatBubbleFriend(message: messagesList[index]);
//                         },
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: CustomTextField(
//                     controller: messageController,
//                     keyboardType: TextInputType.text,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return S.of(context).pleaseEnterValidMessage;
//                       }
//                       return null;
//                     },
//                     suffixIcon: IconBroken.Send,
//                     suffixColor: kPrimaryColor,
//                     hintText: S.of(context).sendMessage,
//                     onPressedSuffix: () {
//                      if(formKey.currentState!.validate()){
//                        widget.chatCubit.sendMessage(
//                          message: messageController.text,
//                          friendID: widget.friendID,
//                        );
//                        messageController.clear();
//                        scrollController.animateTo(
//                          0,
//                          duration: const Duration(milliseconds: 500),
//                          curve: Curves.easeIn,
//                        );
//                      }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

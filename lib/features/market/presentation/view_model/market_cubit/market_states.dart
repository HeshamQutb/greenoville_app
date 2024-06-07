import '../../../../community/data/models/community_post_model.dart';

abstract class AccountStates {}

class AccountInitState extends AccountStates {}

// Get Post states
class AccountGetPostLoadingState extends AccountStates {}

class AccountGetPostSuccessState extends AccountStates {
  List<CommunityPostModel> posts;
  AccountGetPostSuccessState(this.posts);
}

class AccountGetPostErrorState extends AccountStates {
  final String error;

  AccountGetPostErrorState(this.error);
}

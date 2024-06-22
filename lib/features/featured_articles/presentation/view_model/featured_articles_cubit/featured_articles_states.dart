part of 'featured_articles_cubit.dart';

abstract class LatestNewsStates {
  const LatestNewsStates();
}

class LatestNewsInitialState extends LatestNewsStates {}

// Get News States
class LatestNewsGetNewsLoadingState extends LatestNewsStates {}

class LatestNewsGetNewsSuccessState extends LatestNewsStates {}

class LatestNewsGetNewsErrorState extends LatestNewsStates {
  final String error;

  LatestNewsGetNewsErrorState(this.error);
}



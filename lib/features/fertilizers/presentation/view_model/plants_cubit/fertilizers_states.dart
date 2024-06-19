part of 'fertilizers_cubit.dart';

abstract class FertilizersStates {
  const FertilizersStates();
}

class FertilizersInitialState extends FertilizersStates {}

class GetFertilizersLoadingState extends FertilizersStates {}

class GetFertilizersSuccessState extends FertilizersStates {}

class GetFertilizersErrorState extends FertilizersStates {
  final String error;
  GetFertilizersErrorState(this.error);
}

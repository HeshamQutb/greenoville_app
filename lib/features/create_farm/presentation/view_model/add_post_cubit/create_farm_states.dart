abstract class CreateFarmStates {}

class CreateFarmInitialState extends CreateFarmStates {}

// Add Farm
class CreateFarmLoadingState extends CreateFarmStates {}

class CreateFarmSuccessState extends CreateFarmStates {}

class CreateFarmErrorState extends CreateFarmStates {
  final String error;
  CreateFarmErrorState(this.error);
}

// Farm Image
class GetFarmImageSuccessState extends CreateFarmStates {}

class GetFarmImageCancelledState extends CreateFarmStates {}

class GetFarmImageErrorState extends CreateFarmStates {}

class RemoveFarmImageSuccessState extends CreateFarmStates {}

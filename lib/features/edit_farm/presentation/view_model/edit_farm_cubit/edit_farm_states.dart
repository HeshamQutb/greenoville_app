abstract class EditFarmStates {}

class EditFarmInitialState extends EditFarmStates {}

// Add Farm
class EditFarmLoadingState extends EditFarmStates {}

class EditFarmSuccessState extends EditFarmStates {}

class EditFarmErrorState extends EditFarmStates {
  final String error;
  EditFarmErrorState(this.error);
}

// Farm Image
class GetFarmImageSuccessState extends EditFarmStates {}

class GetFarmImageCancelledState extends EditFarmStates {}

class GetFarmImageErrorState extends EditFarmStates {}

class RemoveFarmImageSuccessState extends EditFarmStates {}

part of 'plants_cubit.dart';

abstract class PlantsStates {
  const PlantsStates();
}

class PlantsInitialState extends PlantsStates {}

class GetPlantsLoadingState extends PlantsStates {}

class GetPlantsSuccessState extends PlantsStates {}

class GetPlantsErrorState extends PlantsStates {
  final String error;
  GetPlantsErrorState(this.error);
}

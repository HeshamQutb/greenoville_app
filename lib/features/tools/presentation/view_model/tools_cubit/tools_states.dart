part of 'tools_cubit.dart';

abstract class ToolsStates {
  const ToolsStates();
}

class ToolsInitialState extends ToolsStates {}

class GetToolsLoadingState extends ToolsStates {}

class GetToolsSuccessState extends ToolsStates {}

class GetToolsErrorState extends ToolsStates {
  final String error;
  GetToolsErrorState(this.error);
}

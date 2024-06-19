import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/tool_model.dart';

part 'tools_states.dart';

class ToolsCubit extends Cubit<ToolsStates> {
  ToolsCubit() : super(ToolsInitialState());

  static ToolsCubit get(context) => BlocProvider.of(context);

  Future<List<ToolModel>> getTools({required String soilType}) async {
    emit(GetToolsLoadingState());

    try {
      // Fetch documents from Firestore where soilType matches
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('tools')
          .where('soilType', isEqualTo: soilType)
          .get();

      // Convert documents to ToolModel objects
      List<ToolModel> tools = querySnapshot.docs.map((doc) {
        return ToolModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      // Emit success state with the list of tools
      emit(GetToolsSuccessState());
      return tools;
    } catch (error) {
      // Emit error state if there is an exception
      emit(GetToolsErrorState(error.toString()));
      return [];
    }
  }
}

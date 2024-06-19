import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/plant_model.dart';

part 'plants_states.dart';

class PlantsCubit extends Cubit<PlantsStates> {
  PlantsCubit() : super(PlantsInitialState());

  static PlantsCubit get(context) => BlocProvider.of(context);

  Future<List<PlantModel>> getPlants({required String soilType}) async {
    emit(GetPlantsLoadingState());

    try {
      // Fetch documents from Firestore where soilType matches
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('plants')
          .where('soilType', isEqualTo: soilType)
          .get();

      // Convert documents to PlantModel objects
      List<PlantModel> plants = querySnapshot.docs.map((doc) {
        return PlantModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      // Emit success state with the list of plants
      emit(GetPlantsSuccessState());
      return plants;
    } catch (error) {
      // Emit error state if there is an exception
      emit(GetPlantsErrorState(error.toString()));
      return [];
    }
  }
}

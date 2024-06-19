import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/fertilizer_model.dart';

part 'fertilizers_states.dart';

class FertilizersCubit extends Cubit<FertilizersStates> {
  FertilizersCubit() : super(FertilizersInitialState());

  static FertilizersCubit get(context) => BlocProvider.of(context);

  Future<List<FertilizerModel>> getFertilizers({required String soilType}) async {
    emit(GetFertilizersLoadingState());

    try {
      // Fetch documents from Firestore where soilType matches
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('fertilizers')
          .where('soilType', isEqualTo: soilType)
          .get();

      // Convert documents to FertilizerModel objects
      List<FertilizerModel> fertilizers = querySnapshot.docs.map((doc) {
        return FertilizerModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      // Emit success state with the list of fertilizers
      emit(GetFertilizersSuccessState());
      return fertilizers;
    } catch (error) {
      // Emit error state if there is an exception
      emit(GetFertilizersErrorState(error.toString()));
      return [];
    }
  }
}

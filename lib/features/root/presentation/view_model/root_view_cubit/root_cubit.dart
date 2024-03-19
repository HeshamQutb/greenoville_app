import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/root/presentation/view_model/root_view_cubit/root_states.dart';

class RootCubit extends Cubit<RootStates>{
  RootCubit() : super(RootInitialState());

  static RootCubit get(context) => BlocProvider.of(context);


}
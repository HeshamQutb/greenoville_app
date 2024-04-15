import '../../features/auth/presentation/views/login_view.dart';
import '../network/local/cache_helper.dart';
import 'navigate_services.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'uId').then((value) {
    if (value) {
      navigateAndFinish(context, const LoginView());
    }
  });
}
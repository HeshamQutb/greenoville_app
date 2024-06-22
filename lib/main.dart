import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/app_cubit/app_states.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:greenoville_app/features/account/presentation/view_model/account_cubit/account_cubit.dart';
import 'package:greenoville_app/features/chat/presentation/view_model/chat_cubit/chat_cubit.dart';
import 'package:greenoville_app/features/chat/presentation/view_model/chat_users_cubit/chat_users_cubit.dart';
import 'package:greenoville_app/features/community/presentation/view_model/community_cubit/community_cubit.dart';
import 'package:greenoville_app/features/farm/presentation/view_model/farm_cubit.dart';
import 'package:greenoville_app/features/fertilizers/presentation/view_model/plants_cubit/fertilizers_cubit.dart';
import 'package:greenoville_app/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:greenoville_app/features/tips_view/presentation/view_model/tips_cubit/tips_cubit.dart';
import 'package:greenoville_app/features/welcome/presentation/views/splash_view.dart';
import 'bloc_observer.dart';
import 'core/network/local/cache_helper.dart';
import 'features/add_tips/presentation/view_model/add_tips_cubit/add_tips_cubit.dart';
import 'features/edit_post/presentation/view_model/edit_post_cubit/edit_post_cubit.dart';
import 'features/market/presentation/view_model/market_cubit/market_cubit.dart';
import 'features/market_prices/presentation/view_model/market_prices_cubit/market_prices_cubit.dart';
import 'features/plants/presentation/view_model/plants_cubit/plants_cubit.dart';
import 'features/tools/presentation/view_model/tools_cubit/tools_cubit.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  uId = CacheHelper.getData(key: 'uId');
  if (kDebugMode) {
    print(uId);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..getSplashNextScreen(),
        ),
        BlocProvider(
          create: (context) => CommunityCubit(),
        ),
        BlocProvider(
          create: (context) => AccountCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(
          create: (context) => MarketCubit(),
        ),
        BlocProvider(
          create: (context) => FarmCubit(),
        ),
        BlocProvider(
          create: (context) => ChatUsersCubit()..getChatUsers(uId: uId!),
        ),
        BlocProvider(
          create: (context) => MarketPricesCubit(),
        ),
        BlocProvider(
          create: (context) => PlantsCubit(),
        ),
        BlocProvider(
          create: (context) => ToolsCubit(),
        ),
        BlocProvider(
          create: (context) => FertilizersCubit(),
        ),
        BlocProvider(
          create: (context) => EditPostCubit(),
        ),
        BlocProvider(
          create: (context) => AddTipsCubit(),
        ),
        BlocProvider(
          create: (context) => TipsCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var appCubit = AppCubit.get(context);
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
          );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: Locale(appCubit.getAppLanguage() ?? 'ar'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              fontFamily: AssetsData.almaraiFont,
              scaffoldBackgroundColor: Colors.white,
            ),
            home: const SplashView(),
          );
        },
      ),
    );
  }
}

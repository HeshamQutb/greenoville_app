// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:greenoville_app/views/root_view.dart';
// import 'package:lottie/lottie.dart';
// import 'package:page_transition/page_transition.dart';
//
// class SplashView extends StatelessWidget {
//   const SplashView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Column(
//         children: [
//           Center(
//             child: LottieBuilder.asset(
//               'assets/lottie/splash.json',
//             ),
//           ),
//           Text(
//             'GreeNoville',
//             style: TextStyle(
//               foreground: Paint()
//                 ..shader = const LinearGradient(
//                   colors: [Colors.green, Colors.blue],
//                 ).createShader(
//                   const Rect.fromLTWH(0.0, 0.0, 500.0, 20.0),
//                 ),
//               fontSize: 50
//             ),
//           ),
//         ],
//       ),
//       nextScreen: const RootView(),
//       splashIconSize: 500,
//       pageTransitionType: PageTransitionType.bottomToTop,
//     );
//   }
// }

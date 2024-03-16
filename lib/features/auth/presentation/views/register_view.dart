// // ignore_for_file: avoid_print
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../constants.dart';
// import '../widgets/default_button.dart';
// import '../widgets/default_text_button.dart';
// import '../widgets/default_text_field.dart';
//
// class RegisterView extends StatelessWidget {
//   const RegisterView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.dark,
//       ),
//     );
//
//     var nameController = TextEditingController();
//     var phoneController = TextEditingController();
//     var emailController = TextEditingController();
//     var passwordController = TextEditingController();
//     var formKey = GlobalKey<FormState>();
//
//
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Column(
//                       children: [
//                         Text(
//                           'Sign Up',
//                           style: Theme.of(context)
//                               .textTheme
//                               .headlineMedium
//                               ?.copyWith(color: Colors.black),
//                         ),
//                         const SizedBox(
//                           height: 15.0,
//                         ),
//                         Text(
//                           'Join GreeNoville Community\nDiscover Sustainable Farming Practices!',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             shadows: [
//                               Shadow(
//                                 color: Colors.black.withOpacity(0.0),
//                                 blurRadius: 3,
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15.0,
//                         ),
//                         GestureDetector(
//                           onTap: (){
//                             showModalBottomSheet(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return SizedBox(
//                                   height: 140,
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       ListTile(
//                                         visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
//                                         leading: const Icon(Icons.camera_alt),
//                                         title: const Text('Take a photo'),
//                                         onTap: () {
//
//                                         },
//                                       ),
//                                       Container(
//                                         width: double.infinity,
//                                         height: 0.5,
//                                         color: Colors.grey,
//                                       ),
//                                       ListTile(
//                                         visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
//                                         leading: const Icon(Icons.image),
//                                         title: const Text('Choose from gallery'),
//                                         onTap: () {
//
//
//                                         },
//                                       ),
//                                       Container(
//                                         width: double.infinity,
//                                         height: 0.5,
//                                         color: Colors.grey,
//                                       ),
//                                       DefaultTextButton(
//                                           onPressed: () {
//                                             Navigator.pop(context);
//                                           },
//                                           text: 'Cancel',
//                                           size: 15
//                                       )
//                                     ],
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                           child: Stack(
//                             alignment: AlignmentDirectional.bottomCenter,
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor: defaultColor,
//                                 radius: 40,
//                                 backgroundImage:const AssetImage('assets/images/user.png')
//                               ),
//                               const CircleAvatar(
//                                 backgroundColor: Colors.green,
//                                 radius: 10,
//                                 child: Icon(
//                                   Icons.add,
//                                   size: 18,
//                                   color: Colors.white,
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15.0,
//                   ),
//                   DefaultTextField(
//                     controller: nameController,
//                     type: TextInputType.name,
//                     validate: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please Enter Your Name!';
//                       }
//                       return null;
//                     },
//                     label: 'Name',
//                     prefixIcon: Icons.person,
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   DefaultTextField(
//                     controller: emailController,
//                     type: TextInputType.emailAddress,
//                     validate: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please Enter Email Address!';
//                       }
//                       return null;
//                     },
//                     label: 'Email Address',
//                     prefixIcon: Icons.email_outlined,
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   DefaultTextField(
//                     onFieldSubmitted: (value) {
//                       if (formKey.currentState!.validate()) {}
//                     },
//                     controller: passwordController,
//                     type: TextInputType.text,
//                     validate: (value) {
//                       if (value!.isEmpty) {
//                         return 'Password is too short!';
//                       }
//                       return null;
//                     },
//                     label: 'Password',
//                     prefixIcon: Icons.lock,
//                     onPressedSuffix: () {
//
//                     },
//                     suffix: Icons.remove_red_eye,
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   DefaultTextField(
//                     controller: phoneController,
//                     type: TextInputType.phone,
//                     validate: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please Enter Phone Number!';
//                       }
//                       return null;
//                     },
//                     label: 'Phone',
//                     prefixIcon: Icons.phone,
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   DefaultButton(
//                       function: () {
//                         if (formKey.currentState!.validate()) {}
//                       },
//                       text: 'register',
//                       radius: 10.0),
//                   const SizedBox(
//                     height: 25.0,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         'have an account ! ',
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold),
//                       ),
//                       DefaultTextButton(
//                         onPressed: () {},
//                         text: 'Login',
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // class Verification extends StatefulWidget {
// //   const Verification({super.key});
// //
// //   @override
// //   State<Verification> createState() => _VerificationState();
// // }
//
// // class _VerificationState extends State<Verification> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (context) => RegisterCubit(),
// //       child: BlocConsumer<RegisterCubit, RegisterStates>(
// //           listener: (context, state) {},
// //           builder: (context, state) {
// //             return Scaffold(
// //               appBar: AppBar(),
// //               body: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     const Text(
// //                       'We have sent a verification email to:',
// //                       style: TextStyle(fontSize: 18),
// //                     ),
// //                     Text(
// //                       '${FirebaseAuth.instance.currentUser?.email}',
// //                       style: const TextStyle(fontSize: 18),
// //                     ),
// //                     const SizedBox(
// //                       height: 10,
// //                     ),
// //                     const Text(
// //                       'click the link in your email to verify your account',
// //                       style: TextStyle(fontSize: 14, color: Colors.grey),
// //                     ),
// //                     const SizedBox(
// //                       height: 10,
// //                     ),
// //                     defaultButton(
// //                         function: () async {
// //                           await FirebaseAuth.instance.currentUser?.reload();
// //                           if (FirebaseAuth
// //                                   .instance.currentUser!.emailVerified ==
// //                               true) {
// //                             CacheHelper.setData(
// //                               key: 'uId',
// //                               value: FirebaseAuth.instance.currentUser?.uid,
// //                             ).then((value) {
// //                               navigateAndFinish(context, const RootLayout());
// //                             });
// //                             showToast(
// //                                 message: 'Verified successfully',
// //                                 state: ToastState.success);
// //                             setState(() {
// //                               uId = CacheHelper.getData(key: 'uId');
// //                             });
// //                           }
// //                         },
// //                         text: 'continue',
// //                         isUpperCase: true),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         const Text(
// //                           'If you can\'t find it',
// //                           style: TextStyle(fontSize: 15, color: Colors.grey),
// //                         ),
// //                         defaultTextButton(
// //                             onPressed: () {
// //                               FirebaseAuth.instance.currentUser
// //                                   ?.sendEmailVerification()
// //                                   .then((value) {
// //                                 showToast(
// //                                     message: 'Check your mail',
// //                                     state: ToastState.success);
// //                               }).catchError((error) {
// //                                 print(error.toString());
// //                               });
// //                             },
// //                             text: 'click here to resend')
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             );
// //           }),
// //     );
// //   }
// // }

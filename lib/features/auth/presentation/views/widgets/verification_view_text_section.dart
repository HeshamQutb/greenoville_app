// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class VerificationViewTextSection extends StatelessWidget {
//   const VerificationViewTextSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Text(
//           'We have sent a verification email to:',
//           style: TextStyle(fontSize: 18),
//         ),
//         Text(
//           '${FirebaseAuth.instance.currentUser?.email}',
//           style: const TextStyle(fontSize: 18),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         const Text(
//           'click the link in your email to verify your account',
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//       ],
//     );
//   }
// }
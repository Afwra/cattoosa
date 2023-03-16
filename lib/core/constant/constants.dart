// import 'dart:io';

// import 'package:flutter/material.dart';



// late SharedPreferences prefs;
// Future startShared() async {
//   prefs = await SharedPreferences.getInstance();
// }
// /////////////////////////////////////////////////////////////////////

// homeBottomSheet({context, child}) {
//   var w = MediaQuery.of(context).size.width;

//   return showModalBottomSheet(
//     isScrollControlled: true,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//           topRight: Radius.circular(w * 0.07),
//           topLeft: Radius.circular(w * 0.07)),
//     ),
//     isDismissible: true,
//     context: context,
//     builder: (context) => child,
//   );
// }
// ////////////////////////////////////////////////////////////////////

// String translateString(String a, String b) {
//   if (prefs.getString("lang") != null) {
//     return prefs.getString('lang').toString() == 'en' ? a : b;
//   } else {
//     return Platform.localeName.split('_')[0] == 'en' ? a : b;
//   }
// }

// ////////////////////////////////////////////////////////////////////

// void dialog(context) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return WillPopScope(
//         child: Opacity(
//           opacity: 0.7,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             color: Colors.black12,
//             child: Center(
//               child: CircularProgressIndicator(
//                 color: MyColors.mainColor,
//               ),
//             ),
//           ),
//         ),
//         onWillPop: () async => false,
//       );
//     },
//   );
// }

// ///////////////////////////////////////////////////////////////////////////////

// customCachedNetworkImage(
//     {required String url, required context, required BoxFit fit}) {
//   try {
//     // ignore: unnecessary_null_comparison
//     if (url == null || url == "") {
//       return const Icon(
//         Icons.error,
//         color: Color(0xffAB0D03),
//       );
//     } else {
//       return Container(
//         color: Colors.transparent,
//         width: MediaQuery.of(context).size.width,
//         child: (Uri.parse(url).isAbsolute)
//             ? CachedNetworkImage(
//                 imageUrl: url,
//                 fit: fit,
//                 placeholder: (context, url) => SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.02,
//                       height: MediaQuery.of(context).size.height * 0.02,
//                       child: Image.asset(
//                         "assets/icons/LOGO.png",
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                 errorWidget: (context, url, error) {
//                   // ignore: prefer_const_constructors
//                   return Icon(
//                     Icons.error,
//                     color: const Color(0xffAB0D03),
//                   );
//                 })
//             : const Icon(
//                 Icons.error,
//                 color: Color(0xffAB0D03),
//               ),
//       );
//     }
//   } catch (e) {
//     // ignore: avoid_print
//     print(e.toString());
//   }
// }

// ////////////////////////////////////////////////////////

// // customAppbar({required String title, required context, Color? backgroud}) {
// //   return AppBar(
// //     backgroundColor: (backgroud != null) ? backgroud : Colors.white,
// //     elevation: 1,
// //     automaticallyImplyLeading: false,
// //     centerTitle: true,
// //     title: Text(
// //       title,
// //       style: headingStyle.copyWith(
// //           fontSize: (prefs.getString("lang") == "en")
// //               ? screenWidth(context) * 0.055
// //               : screenWidth(context) * 0.065,
// //           fontWeight: FontWeight.bold,
// //           color: MyColors.colorBlack),
// //     ),
// //     leading: InkWell(
// //       onTap: () => MagicRouter.pop(),
// //       child: Container(
// //         width: MediaQuery.of(context).size.width * 0.12,
// //         height: MediaQuery.of(context).size.height * 0.01,
// //         margin: EdgeInsets.symmetric(
// //           horizontal: MediaQuery.of(context).size.width * 0.02,
// //           vertical: MediaQuery.of(context).size.height * 0.013,
// //         ),
// //         padding: EdgeInsetsDirectional.only(
// //           start: MediaQuery.of(context).size.width * 0.02,
// //         ),
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           border: Border.all(
// //             color: Colors.grey.withOpacity(0.3),
// //           ),
// //           borderRadius:
// //               BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
// //         ),
// //         child: Center(
// //           child: Icon(
// //             Icons.arrow_back_ios,
// //             color: MyColors.mainColor,
// //             size: MediaQuery.of(context).size.width * 0.06,
// //           ),
// //         ),
// //       ),
// //     ),
// //   );
// // }

// ///////////////////////////////////////////////////////////

// double screenWidth(context) {
//   return MediaQuery.of(context).size.width;
// }
// ////////////////////////////////////////////////////////////////////

// double screenHeight(context) {
//   return MediaQuery.of(context).size.height;
// }

// ////////////////////////////////////////////////////////////////////

// Widget suffixshape(
//     {required String image, Color? suffixColor, required context}) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child:
//         // Material(
//         // borderRadius: BorderRadius.circular(20),
//         // elevation: 1,
//         CircleAvatar(
//       radius: screenWidth(context) * 0.051,
//       backgroundColor: MyColors.mainColor,
//       child: CircleAvatar(
//         backgroundColor: Colors.white,
//         radius: screenWidth(context) * 0.05,
//         child: Image.asset(
//           image,
//           color: (suffixColor != null) ? suffixColor : MyColors.mainColor,
//           width: MediaQuery.of(context).size.width * 0.06,
//           fit: BoxFit.contain,
//         ),
//       ),
//     ),
//     // ),
//   );
// }

// /////////////////////////////////////////////////////////////////////////////







// // getflagandCurrency() {
// //   if (CustomDropDown.chosenValue == "الكويت") {
// //     currency = "د.ك";
// //     countryFlag = "assets/icons/الكويت.png";
// //     countryCode = "+965";
// //   } else if (CustomDropDown.chosenValue == "السعودية") {
// //     currency = "ر.س";
// //     countryFlag = "assets/icons/السعودية.png";
// //     countryCode = "+966";
// //   } else if (CustomDropDown.chosenValue == "الامارات") {
// //     currency = "درهم";
// //     countryFlag = "assets/icons/امارات.png";
// //     countryCode = "+971";
// //   } else if (CustomDropDown.chosenValue == "البحرين") {
// //     currency = "دينار";
// //     countryFlag = "assets/icons/بحر.png";
// //     countryCode = "+973";
// //   } else if (CustomDropDown.chosenValue == "قطر") {
// //     currency = "ر.ق";
// //     countryFlag = "assets/icons/قطر.png";
// //     countryCode = "+974";
// //   } else if (CustomDropDown.chosenValue == "عمان") {
// //     currency = "ر.ع";
// //     countryFlag = "assets/icons/عمان.png";
// //     countryCode = "+968";
// //   }
// // }

import 'dart:developer';

import 'package:cattoosa/business%20logic/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cottoosa/core/constant/colors.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        log('state is $state');
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Mycolor.mainColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    cubit.startRecording();
                  },
                  child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset(cubit.recording? 'assets/images/record.gif' : "assets/images/record.png")),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(cubit.recording?'Recording' : 'Record your Voice',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );
      },
    );
  }
}
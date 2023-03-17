import 'package:cattoosa/business%20logic/cubit/uploadfile_cubit.dart';
import 'package:cattoosa/presentation/screens/spalsh/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UploadFileCubit>(
            create: (context) =>
                UploadFileCubit()),
      ],
      child: BlocConsumer<UploadFileCubit, UploadfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              // title: 'Flutter Demo',
              theme: ThemeData(),
              home: const SplashScreen());
        },
      ),
    );
  }
}

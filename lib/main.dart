import 'package:cattoosa/presentation/screens/spalsh/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Business_Logic/bloc_observer.dart';
import 'Business_Logic/cubit/app_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
            create: (context) =>
                AppCubit()..appHasInternet()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
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

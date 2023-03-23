import 'package:cattoosa/presentation/screens/details/widgets/info_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Business_Logic/cubit/app_cubit.dart';
import '../../../core/constant/colors.dart';
import '../home/home.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: MyColor.mainColor,
            body: ConditionalBuilder(
              condition: !cubit.loading,
              builder: (context) => Column(
                children: [
                  const Spacer(),
                  ConditionalBuilder(
                    condition: cubit.imageLoading,
                    builder: (context)=> const Center(child:  CircularProgressIndicator()),
                    fallback: (context) => Center(
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: Image.network(
                            cubit.animalImageUrl,
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text(cubit.animalModel!.predictedClass.toString(),
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  if (cubit.animalModel!.predictedClass.toString() != 'Unkown')
                    InkWell(
                      onTap: () {
                        cubit.getAnimalInfo(name: cubit.animalModel!.predictedClass.toString());
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ConditionalBuilder(
                              condition: !cubit.infoLoading,
                              builder: (context) => InfoDialog(
                                  animalInfo: cubit.animalInfo,
                                  name: cubit.animalModel!.predictedClass.toString()),
                              fallback: (context) =>
                                  const Center(child:  CircularProgressIndicator()),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 40,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text('show information',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                )),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              fallback: (context) => Center(
                child: Image.asset('assets/images/loading.gif'),
              ),
            ));
      },
    );
  }
}

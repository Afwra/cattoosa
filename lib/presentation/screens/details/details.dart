import 'package:cattoosa/business%20logic/cubit/app_cubit.dart';
import 'package:cattoosa/cottoosa/core/constant/colors.dart';
import 'package:cattoosa/presentation/screens/details/widgets/info_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Mycolor.mainColor,
            body: ConditionalBuilder(
              condition: !cubit.loading,
              builder: (context) =>Column(
                children: [
                  const Spacer(),
                  Center(
                    child: SizedBox(
                        width: 300,
                        height: 200,
                        child: Icon(
                          Icons.image,
                          size: 100,
                          color: Colors.grey[500],
                        )
                      //  Image.asset(
                      //     "assets/images/Cartoon-green-snake-on-transparent-background-PNG.png",
                      //     fit: BoxFit.fill) ,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text(cubit.animalModel!.name,
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  if(cubit.animalModel!.name != 'Unkown')
                    InkWell(
                    onTap: () {
                      cubit.getAnimalInfo(name: cubit.animalModel!.name);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ConditionalBuilder(
                            condition: !cubit.infoLoading,
                              builder:(context) => InfoDialog(animalInfo: cubit.animalInfo, name: cubit.animalModel!.name),
                            fallback: (context) => const CircularProgressIndicator(),
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
              fallback: (context) => Center(child:Image.asset('assets/images/loading.gif'),),
            ));
      },
    );
  }
}

import 'package:cattoosa/business%20logic/cubit/uploadfile_cubit.dart';
import 'package:cattoosa/core/constant/colors.dart';
import 'package:cattoosa/cottoosa/core/constant/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadFileCubit, UploadfileState>(
      listener: (context, state) {
        if (state is! UploadAudofileSuccess) {
          Container(
            child: const CircularProgressIndicator(),
          );
        }
      },
      builder: (context, state) {
        var cubit = UploadFileCubit.get(context);
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
            body: Column(
              children: [
                const Spacer(),
                Center(
                  child: Container(
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
                ConditionalBuilder(
                    condition: state is UploadAudofileSuccess,
                    builder: (context) => Text(cubit.animalModel!.name,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                    fallback: (context) => const CircularProgressIndicator()),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: Column(
                              children: const [
                                Text('Cobra Snake',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 22,
                                    )),
                                SizedBox(height: 15),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                      '-The King Cobra Is the Longest of Venomous Snakes'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                      '-The King Cobra Is the Longest of Venomous Snakes'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                      '-The King Cobra Is the Longest of Venomous Snakes'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                      '-The King Cobra Is the Longest of Venomous Snakes'),
                                )
                              ],
                            ),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
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
            ));
      },
    );
  }
}

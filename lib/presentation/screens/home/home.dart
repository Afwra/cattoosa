import 'package:cattoosa/business%20logic/cubit/app_cubit.dart';
import 'package:cattoosa/cottoosa/core/constant/colors.dart';
import 'package:cattoosa/presentation/screens/details/details.dart';
import 'package:cattoosa/presentation/screens/record_screen/record_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is UploadAudioFileLoading) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const DetailsScreen()));
        }
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
            backgroundColor: Mycolor.mainColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  child: Column(
                                    children: [
                                      const Text('Recommended Audio',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 22,
                                          )),
                                      const SizedBox(height: 15),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: Image.asset(
                                                  "assets/images/Cartoon-green-snake-on-transparent-background-PNG.png",
                                                  fit: BoxFit.fill),
                                            ),
                                            const SizedBox(width: 10),
                                            const Text('Cobra Snake',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: Image.asset(
                                                  "assets/images/Cow_(Fleckvieh_breed)_Oeschinensee_Slaunger_2009-07-07.jpg",
                                                  fit: BoxFit.fill),
                                            ),
                                            const SizedBox(width: 10),
                                            const Text('Cow',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: Image.asset(
                                                  "assets/images/amur-tiger-01-01.webp",
                                                  fit: BoxFit.fill),
                                            ),
                                            const SizedBox(width: 10),
                                            const Text('Tiger',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: Image.asset(
                                                  "assets/images/Cartoon-green-snake-on-transparent-background-PNG.png",
                                                  fit: BoxFit.fill),
                                            ),
                                            const SizedBox(width: 10),
                                            const Text('Cobra Snake',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                )),
                                          ],
                                        ),
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
                        }),
                  ),
                )
              ],
            ),
            body: Column(
              children: [
                const Spacer(),
                Center(
                  child: InkWell(
                    onTap: () {
                      cubit.initRecorder();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const RecordScreen()));
                    },
                    child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset("assets/images/record.png")),
                  ),
                ),
                Text('Record your Voice',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                const Spacer(),
                ConditionalBuilder(
                  builder: (context) => GestureDetector(
                    onTap: () async {
                      cubit.getAudioFile();
                    },
                    child: const Center(
                      child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Icon(
                            Icons.upload_file,
                            color: Color.fromARGB(255, 13, 127, 131),
                            size: 100,
                          )),
                    ),
                  ),
                  fallback: (context) => const Center(
                    child: SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        )),
                  ),
                  condition: state is! UploadAudioFileLoading,
                ),
                Text('upload your Voice',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                const Spacer(
                  flex: 3,
                )
              ],
            ));
      },
    );
  }
}

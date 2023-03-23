import 'package:cattoosa/Presentation/screens/home/widgets/recommended_audio_dialog.dart';
import 'package:cattoosa/presentation/screens/details/details.dart';
import 'package:cattoosa/presentation/screens/record_screen/record_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Business_Logic/cubit/app_cubit.dart';
import '../../../core/constant/colors.dart';

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
            backgroundColor: MyColor.mainColor,
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
                              return RecommendedAudioDialog(cubit: cubit);
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

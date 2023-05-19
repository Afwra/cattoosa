import 'package:cattoosa/Business_Logic/cubit/app_cubit.dart';
import 'package:cattoosa/Data/recommended_audio_model/recommended_audio_model.dart';
import 'package:flutter/material.dart';

class RecommendedAudioDialog extends StatelessWidget {
  AppCubit cubit;


  RecommendedAudioDialog({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height:
        MediaQuery.of(context).size.height * 0.35,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Recommended Audio',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                  )),
              const SizedBox(height: 15),
              recommendedAudioRow(audioPath: localAudio[0].path, audioName: localAudio[0].name,),
              recommendedAudioRow(audioPath: localAudio[1].path, audioName: localAudio[1].name,),
              recommendedAudioRow(audioPath: localAudio[2].path, audioName: localAudio[2].name,),
              recommendedAudioRow(audioPath: localAudio[3].path, audioName: localAudio[3].name,),
              recommendedAudioRow(audioPath: localAudio[4].path, audioName: localAudio[4].name,),

            ],
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(50))),
    );
  }




  Widget recommendedAudioRow({required String audioPath,required String audioName}) =>Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: (){
        cubit.getLocalAudio(path: audioPath);
      },
      child: Row(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(
                "assets/images/local_audio.jpg",
                fit: BoxFit.fill),
          ),
          const SizedBox(width: 10),
          Text(audioName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
              )),
        ],
      ),
    ),
  );
}

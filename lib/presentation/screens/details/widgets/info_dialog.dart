import 'package:flutter/material.dart';

import '../../../../Data/animal_info_model/animal_info_model.dart';

class InfoDialog extends StatelessWidget {

  final AnimalInfo? animalInfo;
  final String name;

  const InfoDialog({super.key, required this.animalInfo,required this.name});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(name,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                  )),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Scientific Name: ${animalInfo!.taxonomy!.scientificName}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Locations: ${animalInfo!.locations!}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Type: ${animalInfo!.characteristics!.type}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Main Prey: ${animalInfo!.characteristics!.mainPrey}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Life Span: ${animalInfo!.characteristics!.lifespan}'),
            )
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(50))),
    );
  }
}

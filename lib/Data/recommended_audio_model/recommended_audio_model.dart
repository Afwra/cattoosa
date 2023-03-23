class RecommendedAudio {
  String path;
  String name;

  RecommendedAudio({required this.path, required this.name});
}

List<RecommendedAudio> localAudio = [
  RecommendedAudio(
    path: 'assets/audio/lion.wav',
    name: 'Lion',
  ),
  RecommendedAudio(
    path: 'assets/audio/Elephant.wav',
    name: 'Elephant',
  ),
  RecommendedAudio(
    path: 'assets/audio/donkey.wav',
    name: 'Donkey',
  ),
  RecommendedAudio(
    path: 'assets/audio/record4.wav',
    name: 'Human 1',
  ),
  RecommendedAudio(
    path: 'assets/audio/record5.wav',
    name: 'Human 2',
  ),
];

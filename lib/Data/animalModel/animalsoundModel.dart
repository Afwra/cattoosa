class animalSoundModel {
  String? _predictedClass;

  animalSoundModel({String? predictedClass}) {
    if (predictedClass != null) {
      this._predictedClass = predictedClass;
    }
  }

  String? get predictedClass => _predictedClass;
  set predictedClass(String? predictedClass) =>
      _predictedClass = predictedClass;

  animalSoundModel.fromJson(Map<String, dynamic> json) {
    _predictedClass = json['predicted_class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['predicted_class'] = this._predictedClass;
    return data;
  }
}

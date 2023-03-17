class AnimalModel {
  String? predictedClass;

  AnimalModel({this.predictedClass});

  AnimalModel.fromJson(Map<String, dynamic> json) {
    predictedClass = json['predicted_class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['predicted_class'] = this.predictedClass;
    return data;
  }
}
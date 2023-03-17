class AnimalInfo {
  String? name;
  Taxonomy? taxonomy;
  List<String>? locations;
  Characteristics? characteristics;

  AnimalInfo({this.name, this.taxonomy, this.locations, this.characteristics});

  AnimalInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    taxonomy = json['taxonomy'] != null
        ? new Taxonomy.fromJson(json['taxonomy'])
        : null;
    locations = json['locations'].cast<String>();
    characteristics = json['characteristics'] != null
        ? new Characteristics.fromJson(json['characteristics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.taxonomy != null) {
      data['taxonomy'] = this.taxonomy!.toJson();
    }
    data['locations'] = this.locations;
    if (this.characteristics != null) {
      data['characteristics'] = this.characteristics!.toJson();
    }
    return data;
  }
}

class Taxonomy {
  String? kingdom;
  String? phylum;
  String? animalClass;
  String? order;
  String? family;
  String? genus;
  String? scientificName;

  Taxonomy(
      {this.kingdom,
        this.phylum,
        this.animalClass,
        this.order,
        this.family,
        this.genus,
        this.scientificName});

  Taxonomy.fromJson(Map<String, dynamic> json) {
    kingdom = json['kingdom'];
    phylum = json['phylum'];
    animalClass = json['animal_class'];
    order = json['order'];
    family = json['family'];
    genus = json['genus'];
    scientificName = json['scientific_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kingdom'] = this.kingdom;
    data['phylum'] = this.phylum;
    data['animal_class'] = this.animalClass;
    data['order'] = this.order;
    data['family'] = this.family;
    data['genus'] = this.genus;
    data['scientific_name'] = this.scientificName;
    return data;
  }
}

class Characteristics {
  String? mainPrey;
  String? distinctiveFeature;
  String? habitat;
  String? predators;
  String? diet;
  String? averageLitterSize;
  String? lifestyle;
  String? favoriteFood;
  String? type;
  String? slogan;
  String? color;
  String? skinType;
  String? topSpeed;
  String? lifespan;
  String? weight;
  String? height;

  Characteristics(
      {this.mainPrey,
        this.distinctiveFeature,
        this.habitat,
        this.predators,
        this.diet,
        this.averageLitterSize,
        this.lifestyle,
        this.favoriteFood,
        this.type,
        this.slogan,
        this.color,
        this.skinType,
        this.topSpeed,
        this.lifespan,
        this.weight,
        this.height});

  Characteristics.fromJson(Map<String, dynamic> json) {
    mainPrey = json['main_prey'];
    distinctiveFeature = json['distinctive_feature'];
    habitat = json['habitat'];
    predators = json['predators'];
    diet = json['diet'];
    averageLitterSize = json['average_litter_size'];
    lifestyle = json['lifestyle'];
    favoriteFood = json['favorite_food'];
    type = json['type'];
    slogan = json['slogan'];
    color = json['color'];
    skinType = json['skin_type'];
    topSpeed = json['top_speed'];
    lifespan = json['lifespan'];
    weight = json['weight'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main_prey'] = this.mainPrey;
    data['distinctive_feature'] = this.distinctiveFeature;
    data['habitat'] = this.habitat;
    data['predators'] = this.predators;
    data['diet'] = this.diet;
    data['average_litter_size'] = this.averageLitterSize;
    data['lifestyle'] = this.lifestyle;
    data['favorite_food'] = this.favoriteFood;
    data['type'] = this.type;
    data['slogan'] = this.slogan;
    data['color'] = this.color;
    data['skin_type'] = this.skinType;
    data['top_speed'] = this.topSpeed;
    data['lifespan'] = this.lifespan;
    data['weight'] = this.weight;
    data['height'] = this.height;
    return data;
  }
}

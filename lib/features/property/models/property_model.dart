class PropertyModel {
  final String id;
  final String type;
  final String title;
  final String province;
  final String city;
  final String street;
  final String description;
  final int bedroom;
  final int bathroom;
  final int squareMeters;
  final double price;
  final List<String> facilities;
  final List<String> proximities;
  final List<String> images;
  final DateTime dateCreated;

  PropertyModel(
      {required this.id,
      required this.type,
      required this.title,
      required this.province,
      required this.city,
      required this.street,
      required this.description,
      required this.bedroom,
      required this.bathroom,
      required this.squareMeters,
      required this.price,
      required this.facilities,
      required this.proximities,
      required this.images,
      required this.dateCreated});

  factory PropertyModel.fromJson(Map<String, dynamic> map) {
    return PropertyModel(
        id: map['id'],
        type: map['type'],
        title: map['title'],
        province: map['province'],
        city: map['city'],
        street: map['street'],
        description: map['description'],
        bedroom: map['bedroom'],
        bathroom: map['bathroom'],
        squareMeters: map['squareMeters'],
        price: map['price'],
        facilities: List<String>.from(map['facilities']),
        proximities: List<String>.from(map['proximities']),
        images: List<String>.from(map['images']),
        dateCreated: map['dateCreated']);
  }
}

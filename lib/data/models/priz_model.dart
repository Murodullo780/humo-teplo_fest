class PrizModel {
  final String name;
  final int price;
  final String image;
  final int count;

  PrizModel({required this.name, required this.price, required this.image, required this.count});

  PrizModel copyWith({String? name, int? price, String? image, int? count}) {
    return PrizModel(
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      count: count ?? this.count,
    );
  }
}

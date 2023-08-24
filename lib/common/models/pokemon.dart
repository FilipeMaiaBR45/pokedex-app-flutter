class Pokemon {
  late final String name;
  late final String image;
  late final List<String> type;
  late final int id;
  late final String num;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
        name: json['name'],
        image: json['img'],
        id: json['id'],
        num: json['num'],
        type: (json['type'] as List<dynamic>)
            .map(
              (e) => e as String,
            )
            .toList());
  }

  Pokemon(
      {required this.name,
      required this.image,
      required this.type,
      required this.id,
      required this.num});
}

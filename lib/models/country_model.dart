class Country {
  final String name;
  final String flagUrl;

  Country({required this.name, required this.flagUrl});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      flagUrl: json['flags']['png'],
    );
  }
}

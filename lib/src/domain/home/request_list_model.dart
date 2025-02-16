class RequestDetails {
  final List<String> cities;
  final List<String> categories;
  final List<String> languages;
  final List<String> platform;

  RequestDetails({
    required this.cities,
    required this.categories,
    required this.languages,
    required this.platform,
  });

  factory RequestDetails.fromJson(Map<String, dynamic> json) {
    return RequestDetails(
      cities: List<String>.from(json['cities'] as Iterable<dynamic> ?? []),
      categories:
          List<String>.from(json['categories'] as Iterable<dynamic> ?? []),
      languages:
          List<String>.from(json['languages'] as Iterable<dynamic> ?? []),
      platform: List<String>.from(json['platform'] as Iterable<dynamic> ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cities': cities,
      'categories': categories,
      'languages': languages,
      'platform': platform,
    };
  }
}

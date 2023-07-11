class MenuProperties {
  final String routeName;
  final String image;
  final String displayName;
  final String? category;
  final Map<String, dynamic>? arguments;
  final String onTap;
  final bool? shouldShowLoading;

  MenuProperties({
    required this.routeName,
    required this.image,
    required this.displayName,
    this.category,
    this.arguments,
    required this.onTap,
    this.shouldShowLoading,
  });

  factory MenuProperties.fromJson(Map<String, dynamic> json) {
    return MenuProperties(
      routeName: json['routeName'] as String,
      image: json['image'] as String,
      displayName: json['displayName'] as String,
      category: json['category'] as String?,
      arguments: json['arguments'] as Map<String, dynamic>?,
      onTap: json['onTap'] as String,
      shouldShowLoading: json['shouldShowLoading'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'routeName': routeName,
      'image': image,
      'displayName': displayName,
      'category': category,
      'arguments': arguments,
      'onTap': onTap,
      'shouldShowLoading': shouldShowLoading,
    };
  }
}

class User {
  final String name;
  final String message;
  final String time;
  final String image;

  User({
    required this.name,
    required this.message,
    required this.time,
    required this.image,
  });

  String getName() {
    return name;
  }

  String getMessage() {
    return message;
  }

  String getTime() {
    return time;
  }

  String getImage() {
    return image;
  }
}
class User {
  final String name;
  User({required this.name});

  factory User.empty() => User(name: '');
}

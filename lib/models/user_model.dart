class User {
  final String? id;
  final String name;
  final String? email;
  final String? password;

  User({
    this.id,
    required this.name,
    this.email,
    this.password
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'password': password,
  };
}
class User {
  int id;
  String name;
  String username;
  String email;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
      };

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $username, email: $email}';
  }
}

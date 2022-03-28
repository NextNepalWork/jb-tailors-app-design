import 'dart:convert';

class LoginResponse {
  final LoginModel? user;
  LoginResponse({
    this.user,
  });

  LoginResponse copyWith({
    LoginModel? user,
  }) {
    return LoginResponse(
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }

    return result;
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      user: map['user'] != null ? LoginModel.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));

  @override
  String toString() => 'LoginResponse(user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponse && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}

class LoginModel {
  final String email;
  final String password;
  LoginModel({
    required this.email,
    required this.password,
  });

  LoginModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'password': password});

    return result;
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginModel(email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginModel &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}

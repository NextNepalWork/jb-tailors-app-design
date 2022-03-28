import 'dart:convert';

class RegisterResponse {
  final RegisterModel? user;
  RegisterResponse({
    this.user,
  });

  RegisterResponse copyWith({
    RegisterModel? user,
  }) {
    return RegisterResponse(
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

  factory RegisterResponse.fromMap(Map<String, dynamic> map) {
    return RegisterResponse(
      user: map['user'] != null ? RegisterModel.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponse.fromJson(String source) =>
      RegisterResponse.fromMap(json.decode(source));

  @override
  String toString() => 'RegisterResponse(user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterResponse && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}

class RegisterModel {
  final String email;
  final String name;
  final String password;
  final String cpassword;
  RegisterModel({
    required this.email,
    required this.name,
    required this.password,
    required this.cpassword,
  });

  RegisterModel copyWith({
    String? email,
    String? name,
    String? password,
    String? cpassword,
  }) {
    return RegisterModel(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      cpassword: cpassword ?? this.cpassword,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'password': password});
    result.addAll({'password_confirmation': cpassword});

    return result;
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      password: map['password'] ?? '',
      cpassword: map['password_confirmation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterModel(email: $email, name: $name, password: $password, password_confirmation: $cpassword)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterModel &&
        other.email == email &&
        other.name == name &&
        other.password == password &&
        other.cpassword == cpassword;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        name.hashCode ^
        password.hashCode ^
        cpassword.hashCode;
  }
}

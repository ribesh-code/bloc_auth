import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({required this.userName});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      userName: json['username'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': userName,
      };

  final String userName;

  @override
  List<Object?> get props => [
        userName,
      ];
}

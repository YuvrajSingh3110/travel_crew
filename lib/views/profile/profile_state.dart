part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileDataReceived extends ProfileState{
  final String name;
  final String userId;
  final String email;
  final String gender;
  final String age;
  final String phoneNumber;
  ProfileDataReceived({
    required this.name,
    required this.userId,
    required this.email,
    required this.gender,
    required this.age,
    required this.phoneNumber
  });

  @override
  List<Object?> get props => [name, userId, email, gender, age, phoneNumber];
}

class GetProfileDataFailed extends ProfileState{
  final message;
  GetProfileDataFailed(this.message);
  @override
  List<Object?> get props => [message];
}
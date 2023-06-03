part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileDataReceived extends ProfileState{
  final String message;
  ProfileDataReceived({required this.message});

  @override
  List<Object?> get props => [message];
}
part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfileData extends ProfileEvent{

  const GetProfileData();

  @override
  List<Object?> get props => [];

}
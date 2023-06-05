import 'dart:async';
import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_crew/constants/constants.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetProfileData) {
        final client = Client()
            .setEndpoint(AppConstants.endPointId)
            .setProject(AppConstants.projectId);
        final account = Account(client);
        try {
          final result = await account.get();
          emit(ProfileDataReceived(
            name: result.name,
            age: result.prefs.data["age"],
            email: result.email.isNotEmpty? result.email:"Not Set",
            gender: result.prefs.data["gender"],
            phoneNumber: result.phone.isNotEmpty? result.phone:"Not Set",
            userId: result.$id
          ));
        } on Exception catch (e) {
          emit(GetProfileDataFailed(e.toString()));
        }
      }
    });
  }
}

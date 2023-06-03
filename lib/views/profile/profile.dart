import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_crew/views/profile/profile_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _profileBloc = ProfileBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context){
            _profileBloc.add(GetProfileData());
            return _profileBloc;
          },
        child: BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state)async{

            },
          child: Center(child: Text("temp"),)
        ),
      )
    );
  }
}


part of 'profile_bloc.dart';

enum UserStatus{init,loading,success,failed}

class ProfileState {
  final UserModel? user;
  final UserStatus userStatus;

  ProfileState({this.user, this.userStatus=UserStatus.init});

  ProfileState copyWith({
    UserModel? user,
    UserStatus? userStatus,
  }) {
    return ProfileState(
      user: user ?? this.user,
      userStatus: userStatus ?? this.userStatus,
    );
  }
}



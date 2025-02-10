import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/profile/data/data_sources/get_details_about_user.dart';
import 'package:foody/features/profile/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<GetUserInfo>((event, emit) async{
      emit(state.copyWith(userStatus: UserStatus.loading));
      try {
        final user=await GetUserInformation().getUserInfo();
        emit(state.copyWith(user: user,userStatus: UserStatus.success));
      } on Exception catch (e) {
        emit(state.copyWith(userStatus: UserStatus.failed));
      }
    });
  }
}

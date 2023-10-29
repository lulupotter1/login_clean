import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@Injectable()
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileChangedIndex(index: 3)) {
    on<ProfileChangeIndex>(_onProfileChangeIndex);
  }

  _onProfileChangeIndex(ProfileChangeIndex event, Emitter<ProfileState> emit) async {
    emit(ProfileChangedIndex(index: event.index));
  }
}

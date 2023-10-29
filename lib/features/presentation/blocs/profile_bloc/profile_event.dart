part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileChangeIndex extends ProfileEvent {
  final int index;

  const ProfileChangeIndex({
    required this.index,
  });

  @override
  List<Object> get props => [
        index,
      ];
}

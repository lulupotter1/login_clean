part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileChangedIndex extends ProfileState {
  final int index;

  const ProfileChangedIndex({
    required this.index,
  });

  @override
  List<Object> get props => [
        index,
      ];
}

import 'package:registration_test/core/app/app_injection.dart';
import 'package:registration_test/features/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:registration_test/features/presentation/blocs/profile_bloc/profile_bloc.dart';

class CoreBlocs {
  static final login = sl.get<LoginBloc>();
  static final profile = sl.get<ProfileBloc>();
}

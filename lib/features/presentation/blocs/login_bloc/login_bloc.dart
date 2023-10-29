import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:registration_test/core/app/app_injection.dart';
import 'package:registration_test/core/resources/data_state.dart';
import 'package:registration_test/features/domain/entities/login_entities.dart';
import 'package:registration_test/features/domain/usecases/get_login.dart';

part 'login_event.dart';
part 'login_state.dart';

@Injectable()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginUseCase getLoginUseCase;
  LoginBloc(
    this.getLoginUseCase,
  ) : super(LoginInitial()) {
    on<LoginGetLogin>(_onLoginGetLogin);
  }

  _onLoginGetLogin(LoginGetLogin event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading());

      Map<String, dynamic> data = {
        "email": event.login,
        "password": event.password,
      };

      final dataState = await getLoginUseCase.call(
        data: data,
      );

      if (dataState is DataSuccess) {
        if (dataState.data!.tokenData?.accessToken != null) {
          await secureDB.write(key: 'accessToken', value: dataState.data!.tokenData?.accessToken);
        }

        if (dataState.data!.tokenData?.refreshToken != null) {
          await secureDB.write(key: 'refreshToken', value: dataState.data!.tokenData?.refreshToken);
        }
        if (dataState.data!.userData != null) {
          emit(LoginLoaded(data: dataState.data!.userData!));
        } else {
          emit(const LoginFailure(errorMessage: "User is empty"));
        }
      } else {
        if (dataState.exception!.response?.statusCode == 422) {
          emit(LoginFailure(errorMessage: dataState.exception!.response?.data["message"] ?? "Something wrong"));
        } else {
          emit(LoginFailure(errorMessage: dataState.exception!.message ?? "Something wrong"));
        }
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}

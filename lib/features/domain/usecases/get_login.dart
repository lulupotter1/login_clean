import 'package:injectable/injectable.dart';
import 'package:registration_test/core/resources/data_state.dart';
import 'package:registration_test/core/usecases/usecase.dart';
import 'package:registration_test/features/domain/entities/login_entities.dart';
import 'package:registration_test/features/domain/repositories/login_repository.dart';

@Injectable()
class GetLoginUseCase implements UseCase<DataState<LoginEntity>, Map<String, dynamic>> {
  final LoginRepository _loginRepository;

  GetLoginUseCase(this._loginRepository);

  @override
  Future<DataState<LoginEntity>> call({required Map<String, dynamic> data}) {
    return _loginRepository.getLogin(data: data);
  }
}

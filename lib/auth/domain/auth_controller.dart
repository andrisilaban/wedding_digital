import '../data/auth_remote_data_source.dart';
import '../domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }

  @override
  Future<void> register(String name, String email, String password) {
    return remoteDataSource.register(name, email, password);
  }
}

class AuthController {
  final AuthRepository repository;

  AuthController() : repository = AuthRepositoryImpl(AuthRemoteDataSource());

  Future<void> login(String email, String password) async {
    await repository.login(email, password);
  }

  Future<void> register(String name, String email, String password) async {
    await repository.register(name, email, password);
  }
}

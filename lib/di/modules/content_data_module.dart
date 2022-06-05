import 'package:horoskope/data/repositories/fake_compatibility_repository.dart';
import 'package:horoskope/data/repositories/fake_natal_charts_repository.dart';
import 'package:horoskope/data/repositories/firebase_user_data_repository.dart';
import 'package:horoskope/data/repositories/firebase_user_friends_repository.dart';
import 'package:horoskope/data/repositories/remote_horoskope_repository.dart';
import 'package:horoskope/domain/repositories/compatibility_repository.dart';
import 'package:horoskope/domain/repositories/horoskope_repository.dart';
import 'package:horoskope/domain/repositories/natal_charts_repository.dart';
import 'package:horoskope/domain/repositories/user_data_repository.dart';
import 'package:horoskope/domain/repositories/user_friends_repository.dart';
import 'package:horoskope/domain/services/auth_service.dart';
import 'package:injectable/injectable.dart';

void disposeUserDataRepository(
  UserDataRepository userDataRepository,
) =>
    userDataRepository.dispose();
void disposeUserFriendsRepository(
  UserFriendsRepository userFriendsRepository,
) =>
    userFriendsRepository.dispose();

@module
abstract class ContentDataModule {
  HoroskopeRepository astrodataRepository(
    UserDataRepository userDataRepository,
  ) =>
      RemoteHoroskopeRepository(userDataRepository);

  NatalChartsRepository natalChartsRepository() => FakeNatalChartsRepository();

  @Singleton(dispose: disposeUserDataRepository)
  UserDataRepository userDataRepository(
    AuthService authService,
  ) =>
      FirebaseUserDataRepository(authService);

  CompatibilityRepository compatibilityRepository(
    UserDataRepository userDataRepository,
  ) =>
      FakeCompatibilityRepository(userDataRepository);

  @Singleton()
  UserFriendsRepository userFriendsRepository(
    AuthService authService,
  ) =>
      FirebaseUserFriendsRepository(authService);
}

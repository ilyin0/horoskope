import 'package:horoskope/data/services/firebase_auth_service.dart';
import 'package:horoskope/domain/services/auth_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ServicesModule {
  AuthService authService() => FirebaseAuthService();
}

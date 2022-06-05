import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/domain/repositories/user_friends_repository.dart';
import 'package:horoskope/presentation/pages/home/fragments/compatibility/compatibility_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CompatibilityCubit extends Cubit<CompatibilityState> {
  final UserFriendsRepository _friendsRepository;

  CompatibilityCubit(
    this._friendsRepository,
  ) : super(CompatibilityState());

  late StreamSubscription friendsSubscription;

  void init() async {
    emit(
      state.copyWith(friends: _friendsRepository.friendsList),
    );

    friendsSubscription = _friendsRepository.userFriendsStream.listen(
      (friendsList) {
        if (friendsList != null) {
          emit(
            state.copyWith(friends: friendsList),
          );
        }
      },
    );
  }

  void dispose() {
    friendsSubscription.cancel();
  }
}

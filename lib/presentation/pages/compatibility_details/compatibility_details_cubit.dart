import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/domain/entities/compatibility.dart';
import 'package:horoskope/domain/entities/friend_data.dart';
import 'package:horoskope/domain/repositories/horoskope_repository.dart';
import 'package:horoskope/domain/repositories/user_data_repository.dart';
import 'package:horoskope/presentation/pages/compatibility_details/compatibility_details_state.dart';

class CompatibilityDetailsCubit extends Cubit<CompatibilityDetailsState> {
  final HoroskopeRepository _horoskopeRepository;
  final UserDataRepository _userDataRepository;

  CompatibilityDetailsCubit(
    this._horoskopeRepository,
    this._userDataRepository,
  ) : super(const CompatibilityDetailsState());

  void init(FriendData friendData) async {
    final romanticCompatibilityItems =
        await _horoskopeRepository.getCompatibility(
      friendData: friendData,
    );

    final compatibility = state.compatibility ?? const Compatibility();
    final userData = _userDataRepository.userData;

    if (userData != null) {
      emit(
        state.copyWith(
          userData: userData,
          friendData: friendData,
          compatibility: compatibility.copyWith(
            romanticCompatibilityItems: romanticCompatibilityItems,
          ),
        ),
      );
    }
  }

  void changeTab(int index) {
    emit(
      state.copyWith(
        tab: CompatibilityDetailsTab.values[index],
      ),
    );
  }
}

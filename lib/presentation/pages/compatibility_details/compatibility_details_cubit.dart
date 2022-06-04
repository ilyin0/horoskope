import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/domain/entities/friend_data.dart';
import 'package:horoskope/domain/repositories/compatibility_repository.dart';
import 'package:horoskope/presentation/pages/compatibility_details/compatibility_details_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CompatibilityDetailsCubit extends Cubit<CompatibilityDetailsState> {
  final CompatibilityRepository _compatibilityRepository;

  CompatibilityDetailsCubit(this._compatibilityRepository)
      : super(const CompatibilityDetailsState());

  void init(FriendData friendData) async {
    final compatibility =
        await _compatibilityRepository.getDetailedCompatibility(
      friendId: friendData.id,
    );

    emit(
      state.copyWith(
        compatibility: compatibility,
        friendData: friendData,
      ),
    );
  }

  void changeTab(int index) {
    emit(
      state.copyWith(
        tab: CompatibilityDetailsTab.values[index],
      ),
    );
  }
}

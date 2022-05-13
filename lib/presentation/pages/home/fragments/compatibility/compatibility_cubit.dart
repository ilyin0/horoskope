import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/domain/repositories/compatibility_repository.dart';
import 'package:horoskope/presentation/pages/home/fragments/compatibility/compatibility_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CompatibilityCubit extends Cubit<CompatibilityState> {
  final CompatibilityRepository _compatibilityRepository;

  CompatibilityCubit(
    this._compatibilityRepository,
  ) : super(CompatibilityState()) {
    _init();
  }

  void _init() async {
    final compatibilityItems =
        await _compatibilityRepository.getAllShortCompatibilities(0);
    emit(
      state.copyWith(
        compatibilityItems: compatibilityItems,
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/domain/entities/zodiac_signs.dart';
import 'package:horoskope/domain/repositories/astrodata_repository.dart';
import 'package:horoskope/presentation/pages/home/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final AstrodataRepository _astrodataRepository;

  HomeCubit(
    this._astrodataRepository,
  ) : super(
          const HomeState(todayForecast: ''),
        ) {
    _init();
  }

  void _init() async {
    final todayForecast = await _astrodataRepository.getTodayForecast(
      sign: ZodiacSigns.aries,
      dateTime: DateTime.now(),
    );
    emit(
      state.copyWith(todayForecast: todayForecast),
    );
  }
}

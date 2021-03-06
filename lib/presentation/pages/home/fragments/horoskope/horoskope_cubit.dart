import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/domain/entities/zodiac_sign.dart';
import 'package:horoskope/domain/repositories/horoskope_repository.dart';
import 'package:horoskope/presentation/pages/home/fragments/horoskope/horoskope_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HoroskopeCubit extends Cubit<HoroskopeState> {
  final HoroskopeRepository _astrodataRepository;

  HoroskopeCubit(
    this._astrodataRepository,
  ) : super(const HoroskopeState()) {
    _init();
  }

  void _init() async {
    final todayForecast =
        await _astrodataRepository.getTodayForecastByBirthDateAndName(
      birthDate: DateTime(2000, 11, 7),
      name: 'Alex',
    );
    emit(
      state.copyWith(todayForecast: todayForecast),
    );

    final tomorrowForecast = await _astrodataRepository.getTomorrowForecast(
      sign: ZodiacSign.aries,
    );
    emit(
      state.copyWith(tomorrowForecast: tomorrowForecast),
    );
  }

  void changeTab(int newTab) {
    emit(
      state.copyWith(tab: newTab),
    );
  }
}

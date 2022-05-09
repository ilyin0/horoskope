import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/domain/entities/zodiac_signs.dart';
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
    final todayForecast = await _astrodataRepository.getTodayForecast(
      sign: ZodiacSign.aries,
      dateTime: DateTime.now(),
    );
    emit(
      state.copyWith(todayForecast: todayForecast),
    );
  }
}

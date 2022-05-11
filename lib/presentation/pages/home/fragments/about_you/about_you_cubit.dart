import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/domain/repositories/natal_charts_repository.dart';
import 'package:horoskope/presentation/pages/home/fragments/about_you/about_you_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AboutYouCubit extends Cubit<AboutYouState> {
  final NatalChartsRepository _natalChartsRepository;

  AboutYouCubit(this._natalChartsRepository) : super(AboutYouState()) {
    _init();
  }

  void _init() async {
    final personalityCharts =
        await _natalChartsRepository.getPersonalityCharts(0);
    final additionalCharts =
        await _natalChartsRepository.getAdditionalCharts(0);

    emit(
      state.copyWith(
        personalityCharts: personalityCharts,
        additionalCharts: additionalCharts,
      ),
    );
  }
}

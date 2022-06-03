import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/domain/entities/geo.dart';
import 'package:horoskope/domain/entities/user_data.dart';
import 'package:horoskope/domain/repositories/user_data_repository.dart';
import 'package:horoskope/domain/services/auth_service.dart';
import 'package:horoskope/presentation/pages/onboarding/oboarding_state.dart';
import 'package:horoskope/presentation/utils/constants.dart';
import 'package:intl/intl.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final AuthService _authService;
  final UserDataRepository _userDataRepository;

  late final TextEditingController nameController;
  late final TextEditingController birthDateController;
  late final TextEditingController birthPlaceController;
  late final TextEditingController birthTimeController;

  final formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  OnboardingCubit(
    this._authService,
    this._userDataRepository,
  ) : super(
          const OnboardingState(page: 0),
        );

  void init() {
    nameController = TextEditingController();
    birthDateController = TextEditingController();
    birthPlaceController = TextEditingController();
    birthTimeController = TextEditingController();
  }

  void dispose() {
    nameController.dispose();
    birthDateController.dispose();
    birthPlaceController.dispose();
    birthTimeController.dispose();
  }

  void changePage(int newPage) {
    emit(
      state.copyWith(page: newPage),
    );
  }

  void nextPage() {
    final currentPage = state.page;

    if (formKeys[currentPage].currentState?.validate() ?? false) {
      if (currentPage < formKeys.length - 1) {
        emit(
          state.copyWith(page: currentPage + 1),
        );
      } else {
        final currentUser = _authService.currentUser;
        if (currentUser != null) {
          _userDataRepository.setUserData(
            UserData(
              id: currentUser.uid,
              name: nameController.value.text,
              birthDateTime: DateFormat(dateTimePattern).parse(
                '${birthDateController.value.text} ${birthTimeController.value.text}',
              ),
              //TODO: add real data
              birthPlace: Geo(latitude: '0.0', longitude: '0.0'),
            ),
          );
        }
      }
    }
  }

  void previousPage() {
    if (state.page >= 1) {
      emit(
        state.copyWith(page: state.page - 1),
      );
    }
  }
}

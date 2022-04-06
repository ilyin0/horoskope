part of 'home_page.dart';

@injectable
class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  void switchTab(int tabIndex) {
    emit(tabIndex);
  }
}

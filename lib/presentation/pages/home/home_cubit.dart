part of 'home_page.dart';

@injectable
class HomeCubit extends Cubit<int> {
  HomeCubit() : super(1);

  void switchTab(int tabIndex) {
    emit(tabIndex);
  }
}

import 'package:flutter/material.dart';
import 'package:horoskope/domain/entities/friend_data.dart';
import 'package:horoskope/domain/entities/geo.dart';
import 'package:horoskope/domain/repositories/user_friends_repository.dart';
import 'package:horoskope/presentation/utils/constants.dart';
import 'package:intl/intl.dart';

class AddFriendCubit {
  final UserFriendsRepository _friendsRepository;

  AddFriendCubit(this._friendsRepository);

  final formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController birthDateController;
  late TextEditingController birthPlaceController;
  late TextEditingController birthTimeController;

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

  Future<bool> addFriend() async {
    if (formKey.currentState?.validate() ?? false) {
      return _friendsRepository.addFriend(
        FriendData(
          name: nameController.value.text,
          birthDateTime: DateFormat(dateTimePattern).parse(
            '${birthDateController.value.text} ${birthTimeController.value.text}',
          ),
          birthPlace: const Geo.zero(),
        ),
      );
    }
    return false;
  }
}

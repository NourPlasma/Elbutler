import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/app_status/app_status.dart';
import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:ebutler_task/pages/users/users_controller.dart';
import 'package:ebutler_task/pages/users/widgets/users_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: GetBuilder(builder: (UsersController controller) {
      Widget currentWidget = Container();
      switch (controller.appStatus) {
        case AppStatus.init:
          currentWidget = Container();
          break;
        case AppStatus.loading:
          currentWidget = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                color: AppColors.colorBlack1,
              ),
            ],
          );
          break;
        case AppStatus.success:
          currentWidget = LazyLoadScrollView(
            onEndOfPage: controller.onLoadMore,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.userModelList.length,
                itemBuilder: (child, index) {
                  return UsersListItem(
                    controller: controller,
                    userModel: controller.userModelList[index],
                  );
                }),
          );
          break;
        case AppStatus.failed:
          currentWidget = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.colorRed1,
                ),
                onPressed: () => controller.onLoadUsers(isLoading: true),
                child: Text(AppLocalKeys.tryAgain.tr,
                    style: const TextStyle(color: AppColors.colorWhite1)),
              ),
            ],
          );
          break;
      }
      return currentWidget;
    }));
  }
}

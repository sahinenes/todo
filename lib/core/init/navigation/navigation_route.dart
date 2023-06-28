
import 'package:flutter/material.dart';



class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      /*
      case NavigationConstants.ADD_TASK:
        return normalNavigate(const AddTaskView(), NavigationConstants.ADD_TASK);

      case NavigationConstants.ADD_SUBJECT:
        return normalNavigate(AddSubjectView(), NavigationConstants.ADD_SUBJECT);

      case NavigationConstants.ADD_LECTURER:
        return normalNavigate(AddLecturerView(), NavigationConstants.ADD_LECTURER);

      case NavigationConstants.LECTURERS:
        return normalNavigate(const LecturersView(), NavigationConstants.LECTURERS);

      case NavigationConstants.SUBJECTS:
        return normalNavigate(const SubjectView(), NavigationConstants.SUBJECTS);

      case NavigationConstants.EDIT_PROFILE:
        return normalNavigate(const EditProfileView(), NavigationConstants.EDIT_PROFILE);
*/
      // case NavigationConstants.SETTINGS_WEB_VIEW:
      //   if (args.arguments is SettingsDynamicModel) {
      //     return normalNavigate(
      //       SettingsDynamicView(model: args.arguments as SettingsDynamicModel),
      //       NavigationConstants.SETTINGS_WEB_VIEW,
      //     );
      //   }
      //   throw NavigateException<SettingsDynamicModel>(args.arguments);

      default:
        return MaterialPageRoute(
          builder: (context) => Placeholder(
           
          ),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      //analytciste görülecek olan sayfa ismi için pageName veriyoruz
      settings: RouteSettings(name: pageName),
    );
  }
}

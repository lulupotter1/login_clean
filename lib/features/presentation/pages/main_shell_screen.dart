import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:registration_test/config/themes/theme_colors.dart';
import 'package:registration_test/config/themes/theme_text_style.dart';
import 'package:registration_test/core/core_bloc/core_blocs.dart';
import 'package:registration_test/features/domain/entities/login_entities.dart';
import 'package:registration_test/features/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:registration_test/features/presentation/widgets/appbars.dart';
import 'package:registration_test/features/presentation/widgets/fav_screen_widget.dart';
import 'package:registration_test/features/presentation/widgets/map_screen_widget.dart';
import 'package:registration_test/features/presentation/widgets/news_screen_widget.dart';
import 'package:registration_test/features/presentation/widgets/profile_screen_widget.dart';

@RoutePage()
class MainShellScreen extends StatefulWidget {
  final UserEntity userData;
  const MainShellScreen({
    super.key,
    required this.userData,
  });

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  List<Widget> screenWidgets = [];
  List<String> appBarStrings = [
    "Лента",
    "Карта",
    "Избранные",
    "Профиль",
  ];
  int selectedIndex = 0;
  @override
  void initState() {
    screenWidgets.addAll([
      const NewsScreenWidget(),
      const MapScreenWidget(),
      const FavScreenWidget(),
      ProfileScreenWidget(
        userData: widget.userData,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoreBlocs.profile,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileChangedIndex) {
            selectedIndex = state.index;
          }
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: selectedIndex,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: ThemeColors.blue,
                unselectedItemColor: ThemeColors.black,
                unselectedLabelStyle: ThemeTextManropeRegular.cmSize.copyWith(
                  color: ThemeColors.black,
                  fontSize: 10,
                ),
                selectedLabelStyle: ThemeTextManropeRegular.cmSize.copyWith(
                  color: ThemeColors.blue,
                  fontSize: 10,
                ),
                onTap: (selIndex) {
                  CoreBlocs.profile.add(ProfileChangeIndex(index: selIndex));
                },
                items: [
                  _item(asset: "assets/svg/lenta.svg", text: "Лента"),
                  _item(asset: "assets/svg/karta.svg", text: "Карта"),
                  _item(asset: "assets/svg/fav.svg", text: "Избранные"),
                  _item(asset: "assets/svg/profile.svg", text: "Профиль"),
                ],
              ),
              backgroundColor: ThemeColors.formBg,
              appBar: CommonAppBar(
                appTitleText: appBarStrings[selectedIndex],
              ),
              body: screenWidgets[selectedIndex],
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _item({
    required String asset,
    required String text,
  }) {
    return BottomNavigationBarItem(
      label: text,
      icon: SvgPicture.asset(
        asset,
        color: ThemeColors.black,
      ),
      activeIcon: SvgPicture.asset(
        asset,
        color: ThemeColors.blue,
      ),
    );
  }
}

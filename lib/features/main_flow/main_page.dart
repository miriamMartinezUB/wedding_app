import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/features/home/home_page.dart';
import 'package:wedding_jc/features/information/information_page.dart';
import 'package:wedding_jc/features/main_flow/bloc/main_flow_bloc.dart';
import 'package:wedding_jc/features/profile/profile_page.dart';
import 'package:wedding_jc/resources/palette_colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<MainFlowBloc, MainFlowState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: PaletteColors.bottomNavigationBackground,
            selectedItemColor: PaletteColors.bottomNavigationSelectedItems,
            unselectedItemColor: PaletteColors.bottomNavigationUnselectedItems,
            iconSize: 28,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.info,
                ),
                label: 'info',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'profile',
              ),
            ],
            onTap: (index) => BlocProvider.of<MainFlowBloc>(context).add(ChangeMainScreenEvent(index: index)),
          );
        },
      ),
      body: BlocBuilder<MainFlowBloc, MainFlowState>(builder: (context, state) {
        if (state.index == Pages.home.number) {
          return const HomePage();
        } else if (state.index == Pages.information.number) {
          return const InformationPage();
        } else if (state.index == Pages.profile.number) {
          return const ProfilePage();
        }
        return Container();
      }),
    );
  }
}

enum Pages { home, information, profile }

extension NumberPages on Pages {
  int get number {
    switch (this) {
      case Pages.home:
        return 0;
      case Pages.information:
        return 1;
      case Pages.profile:
        return 2;
    }
  }
}

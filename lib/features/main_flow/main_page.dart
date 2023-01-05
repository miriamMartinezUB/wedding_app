import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/features/change_language/change_language_page.dart';
import 'package:wedding_jc/features/home/home_page.dart';
import 'package:wedding_jc/features/information/information_page.dart';
import 'package:wedding_jc/features/invitation/invitation_page.dart';
import 'package:wedding_jc/features/main_flow/bloc/main_flow_bloc.dart';
import 'package:wedding_jc/features/main_flow/drawer_item_id.dart';
import 'package:wedding_jc/features/present/present_page.dart';
import 'package:wedding_jc/features/summary/summary_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<MainFlowBloc, MainFlowState>(
        builder: (context, state) {
          switch (state.itemId) {
            case DrawerItemId.summary:
              return const SummaryPage();
            case DrawerItemId.information:
              return const InformationPage();
            case DrawerItemId.present:
              return const PresentPage();
            case DrawerItemId.invitation:
              return const InvitationPage();
            case DrawerItemId.changeLanguage:
              return const ChangeLanguagePage();
            case DrawerItemId.home:
            default:
              return const HomePage();
          }
        },
      ),
    );
  }
}

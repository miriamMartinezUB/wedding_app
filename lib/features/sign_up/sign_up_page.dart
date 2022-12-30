import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/buttons/app_button.dart';
import 'package:wedding_jc/views/circular_progress.dart';
import 'package:wedding_jc/views/text.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PaletteColors.background,
        body: SafeArea(
          child: BlocProvider(
            create: (context) => SignUpBloc(),
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                if (state is SignUpLoading) {
                  return const CircularProgress();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimens.paddingXXLarge,
                    horizontal: Dimens.paddingXLarge,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimens.iconSizeBig,
                        child: Center(
                          child: Image.asset('assets/images/logo.jpeg'),
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.paddingXLarge,
                      ),
                      AppText(
                        translate('welcome'),
                        type: TextTypes.title,
                        align: TextAlign.center,
                      ),
                      const SizedBox(
                        height: Dimens.paddingXLarge,
                      ),
                      AppText(
                        translate('app_name'),
                        type: TextTypes.subtitle,
                        align: TextAlign.center,
                      ),
                      const SizedBox(
                        height: Dimens.paddingXLarge,
                      ),
                      AppButton(
                        text: translate('sign_up'),
                        onTap: () {
                          BlocProvider.of<SignUpBloc>(context).add(RegisterWithGoogleEvent());
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}

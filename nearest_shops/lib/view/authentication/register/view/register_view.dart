import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import '../viewmodel/register_view_model.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/border/circular_border_radius.dart';
import '../../../../core/components/button/icon_button.dart';
import '../../../../core/components/button/normal_button.dart';
import '../../../../core/components/button/text_button.dart';
import '../../../../core/components/column/form_column.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/language_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';

import '../../../product/contstants/image_path_svg.dart';
import '../../login/viewmodel/login_view_model.dart';

part 'subview/register_view_textfields.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
        viewModel: RegisterViewModel(),
        onModelReady: (model) {},
        onPageBuilder: (BuildContext context, RegisterViewModel viewModel) {
          return buildScaffold(context, viewModel);
        });
  }

  Scaffold buildScaffold(BuildContext context, RegisterViewModel viewModel) =>
      Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 4,
            child: buildLoginForm(context, viewModel),
          ),
        ],
      ));

  Container buildLoginForm(BuildContext context, RegisterViewModel viewModel) {
    return Container(
      child: Form(
        key: viewModel.formState,
        child: buildFormColumn(viewModel, context),
      ),
    );
  }

  Widget buildFormColumn(RegisterViewModel viewModel, BuildContext context) {
    return FormColumn(
      children: [
        buildWelcomeTextColumnBuild(context),
        Spacer(
          flex: 4,
        ),
        buildEmailTextField(viewModel, context),
        SizedBox(height: context.lowValue),
        buildFirstPasswordTextField(viewModel, context),
        SizedBox(height: context.lowValue),
        buildLaterPasswordTextField(viewModel, context),
        Spacer(
          flex: 3,
        ),
        buildLoginButton(context, viewModel),
        Spacer(
          flex: 6,
        ),
      ],
    );
  }


  Widget buildWelcomeTextColumnBuild(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            LocaleKeys.createAccount.locale,
            style: context.textTheme.headline2!
                .copyWith(color: context.colorScheme.onPrimary),
          ),
        ),
      ],
    );
  }

  NormalTextButton buildCreateAccountButton() {
    return NormalTextButton(
      text: LocaleKeys.createAccount.locale,
      onPressed: () {},
    );
  }

  Widget buildLoginButton(BuildContext context, RegisterViewModel viewModel) {
    return Observer(builder: (_) {
      return NormalButton(
        child: Text(
          LocaleKeys.createAccount.locale,
          style: context.textTheme.headline6!
              .copyWith(color: context.colorScheme.onSecondary),
        ),
        onPressed: viewModel.isLoading
            ? null
            : () async {
                viewModel.checkUserData();
              },
        color: context.appTheme.colorScheme.onSurfaceVariant,
      );
    });
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      // color: context.colors.onError,
      padding: context.paddingLow,
      child: Icon(icon, color: context.appTheme.colorScheme.onSurfaceVariant),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  TextEditingController? emailController;
  TextEditingController? passwordController;

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  void setContext(BuildContext context) => this.context = context;
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void checkUserData() {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      if (scaffoldState.currentState != null) {
        scaffoldState.currentState!
            .showSnackBar(SnackBar(content: Text("oeky")));
      }
    }
    isLoadingChange();
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}

import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:najali_chaimae_s_application1/core/app_export.dart';
import 'package:najali_chaimae_s_application1/core/utils/validation_functions.dart';
import 'package:najali_chaimae_s_application1/widgets/custom_elevated_button.dart';
import 'package:najali_chaimae_s_application1/widgets/custom_text_form_field.dart';
import 'package:najali_chaimae_s_application1/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
          ..add(LoginInitialEvent()),
        child: LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      _buildSeven(context),
                      SizedBox(height: 50.v),
                      Padding(
                          padding: EdgeInsets.only(left: 26.h, right: 36.h),
                          child: BlocSelector<LoginBloc, LoginState,
                                  TextEditingController?>(
                              selector: (state) => state.emailController,
                              builder: (context, emailController) {
                                return CustomTextFormField(
                                    controller: emailController,
                                    hintText: "lbl_email".tr,
                                    textInputType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidEmail(value,
                                              isRequired: true))) {
                                        return "err_msg_please_enter_valid_email"
                                            .tr;
                                      }
                                      return null;
                                    });
                              })),
                      SizedBox(height: 11.v),
                      Padding(
                          padding: EdgeInsets.only(left: 26.h, right: 36.h),
                          child: BlocSelector<LoginBloc, LoginState,
                                  TextEditingController?>(
                              selector: (state) => state.passwordController,
                              builder: (context, passwordController) {
                                return CustomTextFormField(
                                    controller: passwordController,
                                    hintText: "lbl_password".tr,
                                    textInputAction: TextInputAction.done,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidPassword(value,
                                              isRequired: true))) {
                                        return "err_msg_please_enter_valid_password"
                                            .tr;
                                      }
                                      return null;
                                    },
                                    obscureText: true);
                              })),
                      SizedBox(height: 5.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(right: 36.h),
                              child: Text("msg_forget_password".tr,
                                  style: CustomTextStyles
                                      .bodyMediumOnSecondaryContainer))),
                      SizedBox(height: 23.v),
                      CustomElevatedButton(
                          text: "lbl_login".tr,
                          margin: EdgeInsets.only(left: 26.h, right: 36.h)),
                      SizedBox(height: 35.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 46.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 9.v, bottom: 6.v),
                                    child: SizedBox(
                                        width: 105.h, child: Divider())),
                                Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text("lbl_or_sign_up_with".tr,
                                        style: theme.textTheme.bodySmall)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 9.v, bottom: 6.v),
                                    child: SizedBox(
                                        width: 109.h,
                                        child: Divider(indent: 4.h)))
                              ])),
                      SizedBox(height: 33.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 54.h),
                              child: Row(children: [
                                Container(
                                    height: 48.v,
                                    width: 75.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 23.h, vertical: 10.v),
                                    decoration: AppDecoration
                                        .outlineOnSecondaryContainer
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgGoogleLogo,
                                        height: 27.adaptSize,
                                        width: 27.adaptSize,
                                        alignment: Alignment.centerRight)),
                                Container(
                                    height: 48.v,
                                    width: 75.h,
                                    margin: EdgeInsets.only(left: 20.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.h, vertical: 11.v),
                                    decoration: AppDecoration
                                        .outlineOnSecondaryContainer
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgFacebook,
                                        height: 24.v,
                                        width: 26.h,
                                        alignment: Alignment.bottomLeft,
                                        onTap: () {
                                          onTapImgFacebook(context);
                                        })),
                                Container(
                                    height: 48.v,
                                    width: 75.h,
                                    margin: EdgeInsets.only(left: 20.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.h, vertical: 11.v),
                                    decoration: AppDecoration
                                        .outlineOnSecondaryContainer
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgVector,
                                        height: 26.v,
                                        width: 22.h,
                                        alignment: Alignment.centerRight))
                              ]))),
                      SizedBox(height: 52.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 91.h),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_not_register_yet2".tr,
                                        style: CustomTextStyles
                                            .bodyMediumGray70002),
                                    TextSpan(
                                        text: "lbl_create_account".tr,
                                        style: theme.textTheme.labelLarge)
                                  ]),
                                  textAlign: TextAlign.left))),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
    return SizedBox(
        height: 243.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topRight, children: [
          Opacity(
              opacity: 0.2,
              child: CustomImageView(
                  imagePath: ImageConstant.imgEllipse48,
                  height: 196.v,
                  width: 390.h,
                  alignment: Alignment.topCenter)),
          Opacity(
              opacity: 0.2,
              child: CustomImageView(
                  imagePath: ImageConstant.imgEllipse47,
                  height: 167.v,
                  width: 183.h,
                  alignment: Alignment.topRight)),
          Align(
              alignment: Alignment.bottomCenter,
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "lbl_fit".tr,
                        style: CustomTextStyles
                            .displayLargeOnSecondaryContainer_1),
                    TextSpan(
                        text: "lbl_tracker".tr,
                        style: theme.textTheme.displayLarge)
                  ]),
                  textAlign: TextAlign.left))
        ]));
  }

  onTapImgFacebook(BuildContext context) async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }
}

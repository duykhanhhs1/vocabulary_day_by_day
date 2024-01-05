import 'package:vocabulary_day_by_day/common/extensions/message_dialog.extension.dart';
import 'package:vocabulary_day_by_day/common/theme/app_colors.dart';
import 'package:vocabulary_day_by_day/common/theme/app_texts.dart';
import 'package:vocabulary_day_by_day/common/widgets/app_input.widget.dart';
import 'package:vocabulary_day_by_day/common/widgets/rounded_button.widget.dart';
import 'package:vocabulary_day_by_day/common/widgets/spacer.dart';
import 'package:vocabulary_day_by_day/modules/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:vocabulary_day_by_day/modules/auth/presentation/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:vocabulary_day_by_day/modules/root/routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final _showPassword = ValueNotifier(false);

  @override
  void dispose() {
    usernameTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              final submitStatus = state.submitStatus;
              if (submitStatus.status.isSuccess) {
                context.read<AuthBloc>().add(
                      LoginPassed(
                        userLoginResponse: state.userLoginResponse!,
                      ),
                    );
              }
              if (submitStatus.status.isFailure) {
                context.showErrorToast(message: submitStatus.message);
              }
              if (submitStatus.status.isInProgress) {
                context.showLoading();
              } else {
                context.hideLoading();
              }
            },
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              final getUserDataStatus = state.getUserDataStatus;
              if (getUserDataStatus.status.isSuccess) {
               context.go(RootRoutes.root);
              }
              if (getUserDataStatus.status.isFailure) {
                context.showErrorToast(message: getUserDataStatus.message);
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: AutofillGroup(
                      child: Column(
                        children: [
                          const VSpacer(100),
                          const VSpacer(20),
                          Text(
                            "Đổi mới vận hành và cộng tác\ntrong thời kỳ số",
                            style: TextStyles.mobileMedium.copyWith(
                                color: ColorStyles.black7, height: 1.5),
                            textAlign: TextAlign.center,
                          ),
                          const VSpacer(45),
                          _buildUsernameField(),
                          const SizedBox(height: 24),
                          _buildPasswordField(),
                          const SizedBox(height: 15),
                          _buildLoginButton(),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => false,
      builder: (BuildContext context, state) {
        return RoundedButton(
          backgroundColor: ColorStyles.blackDeep,
          labelText: "Login",
          borderColor: ColorStyles.black5,
          width: double.infinity,
          height: 48,
          radius: 50,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<LoginBloc>().add(
                    LoginSubmitted(
                      username: usernameTextController.text,
                      password: passwordTextController.text,
                    ),
                  );
            }
          },
        );
      },
    );
  }

  Widget _buildUsernameField() {
    return AppInput(
      scrollPadding: const EdgeInsets.all(220),
      radius: 50,
      fillColor: ColorStyles.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      controller: usernameTextController,
      textCapitalization: TextCapitalization.none,
      validator: MultiValidator(
        [
          RequiredValidator(
            errorText: " LocaleKeys.Login_EmailRequireMessage.tr",
          ),
          CustomEmailValidator(
            errorText: " errorText: LocaleKeys.Login_EmailInvalid.tr",
          ),
        ],
      ),
      keyboardType: TextInputType.emailAddress,
      hintText: "Email",
      autofillHints: const [AutofillHints.username],
    );
  }

  Widget _buildPasswordField() {
    return ValueListenableBuilder<bool>(
      valueListenable: _showPassword,
      builder: (BuildContext context, bool showPassword, Widget? child) {
        return AppInput(
          scrollPadding: const EdgeInsets.all(150),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          radius: 50,
          fillColor: ColorStyles.white,
          textCapitalization: TextCapitalization.none,
          controller: passwordTextController,
          suffixIcon: IconButton(
            icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              _showPassword.value = !_showPassword.value;
            },
            color: ColorStyles.black7,
          ),
          validator: MultiValidator(
            [
              RequiredValidator(
                errorText: "LocaleKeys.Login_PasswordRequireMessage.tr",
              ),
            ],
          ),
          hintText: "Password",
          obscureText: !showPassword,
          autofillHints: const [AutofillHints.password],
        );
      },
    );
  }
}

class CustomEmailValidator extends TextFieldValidator {
  /// regex pattern to validate email inputs.
  final Pattern _emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  CustomEmailValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) =>
      hasMatch(_emailPattern.toString(), value!, caseSensitive: false);
}

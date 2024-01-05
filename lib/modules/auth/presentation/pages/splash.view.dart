import 'package:vocabulary_day_by_day/common/configs/keys.dart';
import 'package:vocabulary_day_by_day/common/theme/app_colors.dart';
import 'package:vocabulary_day_by_day/modules/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:vocabulary_day_by_day/modules/auth/routes.dart';
import 'package:vocabulary_day_by_day/modules/root/routes.dart';
import 'package:vocabulary_day_by_day/services/storages/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final prefs = AppStorage.instance.prefs;
      final token = prefs.getString(AppStorageKey.ACCESS_TOKEN);
      if (token != null) {
        context.read<AuthBloc>().add(const SplashPassed());
      } else {
        context.push(AuthRoutes.login);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.getUserDataStatus.status.isSuccess) {
          context.push(RootRoutes.root);
        }
      },
      child: const Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Center(
            child: Icon(
              Icons.ac_unit_rounded,
              size: 115,
              color: ColorStyles.blue7,
            ),
          ),
        ),
      ),
    );
  }
}

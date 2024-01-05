import 'package:vocabulary_day_by_day/common/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({Key? key, this.center = true}) : super(key: key);

  final bool center;

  @override
  Widget build(BuildContext context) {
    return center
        ? const Center(
            child: CupertinoActivityIndicator(),
          )
        : const CupertinoActivityIndicator();
  }
}

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: ColorStyles.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: ColorStyles.black2,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
            BoxShadow(
              color: ColorStyles.black2,
              blurRadius: 1,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: const AppLoadingIndicator(),
      ),
    );
  }
}

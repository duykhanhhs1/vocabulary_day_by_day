import 'package:vocabulary_day_by_day/common/theme/app_colors.dart';
import 'package:vocabulary_day_by_day/common/theme/app_texts.dart';
import 'package:vocabulary_day_by_day/common/theme/constants.dart';
import 'package:vocabulary_day_by_day/common/widgets/app_loading_indicator.widget.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}

extension MessageDialogExtension on BuildContext {
  void showSuccessToast({
    required String message,
    bool showIcon = true,
    Function()? onUndo,
  }) {
    showFlash(
      context: this,
      duration: kSnackBarDuration,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          behavior: FlashBehavior.floating,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.all(12),
          content: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorStyles.black10,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showIcon)
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.check_circle_rounded,
                        color: ColorStyles.green5,
                        size: 24,
                      ),
                    ),
                  Flexible(
                    child: Text(
                      message,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.mobileCaption1
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  if (onUndo != null)
                    GestureDetector(
                      onTap: () {
                        controller.dismiss();
                        onUndo();
                      },
                      child: Container(
                        height: 36,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Hoàn tác",
                          style: TextStyles.mobileSmall
                              .copyWith(color: ColorStyles.blue5),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showErrorToast({
    String? message,
  }) async {
    showFlash(
      context: this,
      duration: kSnackBarDuration,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          behavior: FlashBehavior.floating,
          position: FlashPosition.top,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.all(12),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorStyles.red5,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.warning_amber_outlined,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    message ?? "Đã có lỗi xảy ra",
                    style: TextStyles.mobileSmallMedium
                        .copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void showLoading() {
    LoadingOverlay.instance.showLoading(this);
  }

  void hideLoading() {
    LoadingOverlay.instance.hideLoading();
  }
}

class LoadingOverlay {
  LoadingOverlay._();

  static final LoadingOverlay instance = LoadingOverlay._();

  FlashController? controller;

  void showLoading(BuildContext context) {
    context.showModalFlash(
      builder: (BuildContext context, FlashController controller) {
        this.controller = controller;
        return const PopScope(
          canPop: false,
          child: AppLoadingOverlay(),
        );
      },
    );
  }

  void hideLoading() {
    controller?.dismiss();
  }
}

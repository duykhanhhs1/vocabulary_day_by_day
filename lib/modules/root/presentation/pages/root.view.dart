import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_day_by_day/common/theme/app_colors.dart';
import 'package:vocabulary_day_by_day/generated/assets.gen.dart';
import 'package:vocabulary_day_by_day/modules/home/presentation/pages/home.view.dart';
import 'package:vocabulary_day_by_day/modules/profile/presentation/pages/profile.view.dart';
import 'package:vocabulary_day_by_day/modules/root/presentation/widgets/app_bottom_navigation_bar.widget.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final pageController = PageController();
  final currentTab = 0;
  final isSlide = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.libraryBg.path),
          fit: BoxFit.cover, // Choose the fitting strategy
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SlideWidget(
          isSlide: false,
          index: currentTab,
          child: PageView(
            onPageChanged: _onPageChanged,
            controller: pageController,
            children: const [
              KeepAlivePage(child: HomeView()),
              KeepAlivePage(child: ProfileView()),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: ColorStyles.blue2,
          child: const Icon(
            CupertinoIcons.add,
            color: ColorStyles.black7,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  void _onPageChanged(int value) {}
}

class SlideWidget extends StatefulWidget {
  const SlideWidget({
    Key? key,
    required this.index,
    required this.child,
    this.slideOffset = 0.2,
    this.isSlide = true,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  final int index;
  final Duration duration;
  final double slideOffset;
  final Widget child;
  final bool isSlide;

  @override
  State<SlideWidget> createState() => _SlideWidgetState();
}

class _SlideWidgetState extends State<SlideWidget>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController _animationController;

  late final Animation<Offset> _slideRTL;
  late final Animation<Offset> _slideLTR;

  bool isRTL = true;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _slideRTL = _getAnimationIn();
    _slideLTR = _getAnimationOut();
    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant SlideWidget oldWidget) {
    if (widget.index != oldWidget.index && widget.isSlide) {
      bool isRTL = false;
      if (widget.index > oldWidget.index) {
        isRTL = true;
      }
      setState(() {
        isRTL = isRTL;
      });
      _animationController.forward(from: 0.0);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: isRTL ? _slideRTL : _slideLTR,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  Animation<Offset> _getAnimationIn() {
    return Tween(begin: Offset(widget.slideOffset, 0), end: Offset.zero)
        .animate(_animationController);
  }

  Animation<Offset> _getAnimationOut() {
    return Tween(begin: Offset(-widget.slideOffset, 0), end: Offset.zero)
        .animate(_animationController);
  }

  @override
  bool get wantKeepAlive => true;
}
//
// class NavBarScrollListener extends StatelessWidget {
//   const NavBarScrollListener(
//       {Key? key,
//         required this.child,
//         required this.scrollController,
//         this.hasScrollBar = true})
//       : super(key: key);
//   final Widget child;
//   final ScrollController scrollController;
//   final bool hasScrollBar;
//
//   @override
//   Widget build(BuildContext context) {
//     return NotificationListener<UserScrollNotification>(
//       onNotification: (scrollNotification) {
//         if (scrollNotification.depth == 1 ||
//             scrollNotification.metrics is PageMetrics ||
//             scrollNotification.direction == ScrollDirection.idle) return true;
//         //
//         if (scrollNotification.metrics.maxScrollExtent == 0) {
//           RootController.to.showNavBar();
//         } else if (scrollNotification.direction == ScrollDirection.reverse) {
//           RootController.to.hideNavBar();
//         } else {
//           RootController.to.showNavBar();
//         }
//         return true;
//       },
//       child: hasScrollBar
//           ? AppScrollBar(scrollController: scrollController, child: child)
//           : child,
//     );
//   }
// }

class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<KeepAlivePage> createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

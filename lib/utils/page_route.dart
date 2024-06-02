part of 'utils.dart';

class SlidePageRoute<T> extends PageRoute<T> {
  SlidePageRoute({
    super.settings,
    required this.pageBuilder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.reverseTransitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
    super.fullscreenDialog,
    super.allowSnapshotting = true,
  });

  final WidgetBuilder pageBuilder;

  @override
  final Duration transitionDuration;

  @override
  final Duration reverseTransitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color? barrierColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => pageBuilder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => FadeTransition(
        opacity: animation.drive(Tween(begin: 0.5, end: 1.0)).drive(CurveTween(curve: Curves.easeInOut)),
        child: SlideTransition(
          position: animation.drive(Tween(begin: const Offset(1.0, 0.0), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut))),
          child: child,
        ),
      );
}

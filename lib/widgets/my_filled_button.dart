part of 'widgets.dart';

class MyFilledButton extends StatefulWidget {
  const MyFilledButton({
    super.key,
    required this.onPressed,
    required this.child,
  })  : radius = 0.0,
        _circle = false;

  const MyFilledButton.circle({
    super.key,
    required this.onPressed,
    this.child,
    this.radius = 48.0,
  }) : _circle = true;

  final VoidCallback? onPressed;
  final Widget? child;
  final double radius;
  final bool _circle;

  @override
  State<MyFilledButton> createState() => _MyFilledButtonState();
}

class _MyFilledButtonState extends State<MyFilledButton> {
  bool _onPressed = false;

  BorderRadius get _circleBorderRadius => BorderRadius.all(Radius.circular(widget.radius / 2));

  @override
  Widget build(BuildContext context) {
    ColorScheme effectiveColorScheme = ColorScheme.fromSeed(seedColor: kColorPrimary);

    Color effectiveBorderColor = effectiveColorScheme.inversePrimary;

    Color effectiveDisabledColor = effectiveColorScheme.onSurface.withOpacity(0.12);

    return Column(
      crossAxisAlignment: widget._circle ? CrossAxisAlignment.center : CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_onPressed) const SizedBox(height: 4.0),
        Container(
          width: widget._circle ? widget.radius : null,
          height: widget._circle ? widget.radius : null,
          decoration: BoxDecoration(
            color: widget.onPressed == null ? effectiveDisabledColor : kColorPrimary,
            borderRadius: widget._circle ? null : kBorderRadius,
            border: Border(
              // left: BorderSide(
              //   color: widget.onPressed == null ? effectiveDisabledColor : effectiveBorderColor,
              // ),
              // top: BorderSide(
              //   color: widget.onPressed == null ? effectiveDisabledColor : effectiveBorderColor,
              // ),
              // right: BorderSide(
              //   color: widget.onPressed == null ? effectiveDisabledColor : effectiveBorderColor,
              // ),
              bottom: _onPressed
                  ? BorderSide.none
                  : BorderSide(
                      color: widget.onPressed == null ? effectiveDisabledColor : effectiveBorderColor,
                      width: 4.0,
                    ),
            ),
            shape: widget._circle ? BoxShape.circle : BoxShape.rectangle,
          ),
          child: Material(
            borderRadius: widget._circle ? _circleBorderRadius : kBorderRadius,
            color: Colors.transparent,
            child: InkWell(
              borderRadius: widget._circle ? _circleBorderRadius : kBorderRadius,
              onTap: widget.onPressed,
              onTapDown: (details) => setState(() => _onPressed = true),
              onTapUp: (details) => setState(() => _onPressed = false),
              onTapCancel: () => setState(() => _onPressed = false),
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.headlineMedium!,
                textAlign: TextAlign.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

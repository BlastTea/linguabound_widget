part of 'widgets.dart';

class MyFilledButton extends StatefulWidget {
  const MyFilledButton({
    super.key,
    required this.onPressed,
    this.width,
    this.height,
    this.iconSize,
    this.minHorizontalPadding,
    this.bottomBorderWidth = 6.0,
    this.pressedBottomBorderWidth = 2.0,
    this.padding,
    this.icon,
    required this.child,
    this.bottomBorderOnly = false,
    this.backgroundColor,
    this.foregroundColor,
    this.iconColor,
    this.borderColor,
    this.textStyle,
    this.selectedTextStyle,
    this.image,
    this.borderRadius,
  })  : radius = null,
        selected = false,
        selectedBackgroundColor = null,
        selectedForegroundColor = null,
        selectedIconColor = null,
        selectedBorderColor = null,
        _circle = false,
        _tonal = false;

  const MyFilledButton.tonal({
    super.key,
    required this.onPressed,
    this.width,
    this.height,
    this.iconSize,
    this.minHorizontalPadding,
    this.bottomBorderWidth = 6.0,
    this.pressedBottomBorderWidth = 2.0,
    this.padding,
    this.icon,
    required this.child,
    this.selected = false,
    this.bottomBorderOnly = false,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.foregroundColor,
    this.selectedForegroundColor,
    this.iconColor,
    this.selectedIconColor,
    this.borderColor,
    this.selectedBorderColor,
    this.textStyle,
    this.selectedTextStyle,
    this.image,
    this.borderRadius,
  })  : radius = null,
        _circle = false,
        _tonal = true;

  const MyFilledButton.circle({
    super.key,
    required this.onPressed,
    this.radius,
    this.iconSize,
    this.minHorizontalPadding,
    this.bottomBorderWidth = 6.0,
    this.pressedBottomBorderWidth = 2.0,
    this.icon,
    this.child,
    this.bottomBorderOnly = false,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.iconColor,
    this.borderColor,
    this.textStyle,
    this.selectedTextStyle,
    this.image,
    this.borderRadius,
  })  : width = null,
        height = null,
        selected = false,
        selectedBackgroundColor = null,
        selectedForegroundColor = null,
        selectedIconColor = null,
        selectedBorderColor = null,
        _circle = true,
        _tonal = false;

  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? iconSize;
  final double? radius;
  final double? minHorizontalPadding;
  final double bottomBorderWidth;
  final double pressedBottomBorderWidth;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final Widget? child;
  final bool selected;
  final bool bottomBorderOnly;
  final Color? backgroundColor;
  final Color? selectedBackgroundColor;
  final Color? foregroundColor;
  final Color? selectedForegroundColor;
  final Color? iconColor;
  final Color? selectedIconColor;
  final Color? borderColor;
  final Color? selectedBorderColor;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;
  final DecorationImage? image;
  final BorderRadiusGeometry? borderRadius;

  final bool _circle;
  final bool _tonal;

  @override
  State<MyFilledButton> createState() => _MyFilledButtonState();
}

class _MyFilledButtonState extends State<MyFilledButton> {
  bool _onPressed = false;

  /// Gets the border radius for the circle shaped button.
  BorderRadius get _circleBorderRadius => BorderRadius.all(Radius.circular((widget.radius ?? 48.0) / 2));

  @override
  Widget build(BuildContext context) {
    ColorScheme effectiveColorScheme = ColorScheme.fromSeed(seedColor: widget._tonal ? kColorWhite : kColorPrimary);

    Color effectiveDisabledColor = effectiveColorScheme.onSurface.withOpacity(0.12);

    Color effectiveBackgroundColor = widget._tonal
        ? widget.selected
            ? widget.selectedBackgroundColor ?? kColorSelected
            : widget.backgroundColor ?? kColorWhite
        : widget.backgroundColor ?? kColorPrimary;

    Color effectiveBorderColor = widget._tonal
        ? widget.selected
            ? widget.selectedBorderColor ?? kColorTonalBorderSelected
            : widget.borderColor ?? kColorTonalBorder
        : widget.borderColor ?? kColorBorder;

    TextStyle effectiveTextStyle = Theme.of(context).textTheme.titleLarge!.copyWith(color: widget.foregroundColor ?? (widget._tonal ? kColorPrimary : kColorWhite));

    return Column(
      crossAxisAlignment: widget._circle ? CrossAxisAlignment.center : CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_onPressed && !widget._circle) SizedBox(height: widget.bottomBorderWidth - widget.pressedBottomBorderWidth),
        Container(
          width: widget._circle ? (widget.radius ?? (widget.padding != null ? null : 48.0)) : widget.width,
          height: widget._circle ? (widget.radius ?? (widget.padding != null ? null : 48.0)) : widget.height,
          decoration: BoxDecoration(
            color: widget.onPressed == null ? effectiveDisabledColor : effectiveBackgroundColor,
            borderRadius: widget.borderRadius ?? (widget._circle ? null : kBorderRadius),
            image: widget.image,
            border: Border(
              left: widget.bottomBorderOnly
                  ? BorderSide.none
                  : BorderSide(
                      color: widget.onPressed == null ? effectiveDisabledColor : effectiveBorderColor,
                      width: 2.0,
                    ),
              top: widget.bottomBorderOnly
                  ? BorderSide.none
                  : BorderSide(
                      color: widget.onPressed == null ? effectiveDisabledColor : effectiveBorderColor,
                      width: 2.0,
                    ),
              right: widget.bottomBorderOnly
                  ? BorderSide.none
                  : BorderSide(
                      color: widget.onPressed == null ? effectiveDisabledColor : effectiveBorderColor,
                      width: 2.0,
                    ),
              bottom: (_onPressed ? widget.pressedBottomBorderWidth == 0.0 : widget.bottomBorderWidth == 0.0)
                  ? BorderSide.none
                  : BorderSide(
                      color: widget.onPressed == null ? effectiveDisabledColor : effectiveBorderColor,
                      width: _onPressed ? widget.pressedBottomBorderWidth : widget.bottomBorderWidth,
                    ),
            ),
            shape: widget._circle ? BoxShape.circle : BoxShape.rectangle,
          ),
          child: IgnorePointer(
            ignoring: widget.onPressed == null,
            child: Material(
              borderRadius: widget._circle ? _circleBorderRadius : kBorderRadius,
              color: Colors.transparent,
              child: InkWell(
                borderRadius: widget._circle ? _circleBorderRadius : kBorderRadius,
                onTap: widget.onPressed,
                onTapDown: (details) => setState(() => _onPressed = true),
                onTapUp: (details) => setState(() => _onPressed = false),
                onTapCancel: () => setState(() => _onPressed = false),
                child: Padding(
                  padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: widget.icon != null ? MainAxisAlignment.start : MainAxisAlignment.center,
                    children: [
                      if (widget.icon != null) ...[
                        Theme(
                          data: Theme.of(context).copyWith(
                            iconTheme: IconThemeData(
                              color: widget.selected ? (widget.selectedIconColor ?? widget.selectedForegroundColor ?? widget.iconColor ?? (widget._tonal ? kColorPrimary : kColorWhite)) : (widget.iconColor ?? widget.foregroundColor ?? (widget._tonal ? kColorPrimary : kColorWhite)),
                              size: widget.iconSize,
                            ),
                          ),
                          child: widget.icon!,
                        ),
                        SizedBox(width: widget.minHorizontalPadding ?? 4.0),
                      ],
                      DefaultTextStyle(
                        style: effectiveTextStyle.merge(widget.selected ? widget.selectedTextStyle : widget.textStyle),
                        textAlign: TextAlign.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: widget.child,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

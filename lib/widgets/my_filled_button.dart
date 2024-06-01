part of 'widgets.dart';

/// A customizable filled button widget that can adapt to different styles and shapes.
class MyFilledButton extends StatefulWidget {
  /// Creates a default styled filled button.
  ///
  /// [onPressed] is the callback that is called when the button is tapped.
  /// [width] and [height] define the size of the button.
  /// [iconSize] specifies the size of the [icon].
  /// [minHorizontalPadding] is the minimum padding on the horizontal axis inside the button.
  /// [padding] specifies the internal padding of the button.
  /// [icon] is the widget displayed as an icon on the button.
  /// [child] is the content displayed inside the button.
  /// [backgroundColor], [foregroundColor], [iconColor], and [borderColor] define the color properties of the button.
  /// [textStyle] and [selectedTextStyle] define the text style for the button label.
  const MyFilledButton({
    super.key,
    required this.onPressed,
    this.width,
    this.height,
    this.iconSize,
    this.minHorizontalPadding,
    this.padding,
    this.icon,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.iconColor,
    this.borderColor,
    this.textStyle,
    this.selectedTextStyle,
  })  : radius = null,
        selected = false,
        selectedBackgroundColor = null,
        selectedForegroundColor = null,
        selectedIconColor = null,
        selectedBorderColor = null,
        _circle = false,
        _tonal = false;

  /// Creates a tonal style filled button, which adapts its style based on the selection state.
  ///
  /// [onPressed] is the callback that is called when the button is tapped.
  /// [width] and [height] define the size of the button.
  /// [iconSize] specifies the size of the [icon].
  /// [minHorizontalPadding] is the minimum padding on the horizontal axis inside the button.
  /// [padding] specifies the internal padding of the button.
  /// [icon] is the widget displayed as an icon on the button.
  /// [child] is the content displayed inside the button.
  /// [selected] defines the initial selection state of the button.
  /// [backgroundColor] and [selectedBackgroundColor] define the normal and selected state background colors respectively.
  /// [foregroundColor] and [selectedForegroundColor] define the normal and selected state foreground colors respectively.
  /// [iconColor] and [selectedIconColor] define the normal and selected state icon colors respectively.
  /// [borderColor] and [selectedBorderColor] define the normal and selected state border colors respectively.
  /// [textStyle] and [selectedTextStyle] define the text style for the button label in normal and selected states respectively.
  const MyFilledButton.tonal({
    super.key,
    required this.onPressed,
    this.width,
    this.height,
    this.iconSize,
    this.minHorizontalPadding,
    this.padding,
    this.icon,
    required this.child,
    this.selected = false,
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
  })  : radius = null,
        _circle = false,
        _tonal = true;

  /// Creates a circular styled filled button.
  ///
  /// [onPressed] is the callback that is called when the button is tapped.
  /// [radius] specifies the radius of the circular button.
  /// [iconSize] specifies the size of the [icon].
  /// [minHorizontalPadding] is the minimum padding on the horizontal axis inside the button.
  /// [icon] is the widget displayed as an icon on the button.
  /// [child] is the content displayed inside the button.
  /// [padding] specifies the internal padding of the button.
  /// [backgroundColor] and [foregroundColor] define the color properties of the button.
  /// [iconColor] and [borderColor] define the color of the icon and the border of the button respectively.
  /// [textStyle] and [selectedTextStyle] define the text style for the button label.
  const MyFilledButton.circle({
    super.key,
    required this.onPressed,
    this.radius,
    this.iconSize,
    this.minHorizontalPadding,
    this.icon,
    this.child,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.iconColor,
    this.borderColor,
    this.textStyle,
    this.selectedTextStyle,
  })  : width = null,
        height = null,
        selected = false,
        selectedBackgroundColor = null,
        selectedForegroundColor = null,
        selectedIconColor = null,
        selectedBorderColor = null,
        _circle = true,
        _tonal = false;

  /// The callback that is triggered when the button is tapped.
  final VoidCallback? onPressed;

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// The size of the icon inside the button, if any.
  final double? iconSize;

  /// The border radius for circular buttons.
  final double? radius;

  /// The minimum horizontal padding inside the button.
  final double? minHorizontalPadding;

  /// The padding inside the button.
  final EdgeInsetsGeometry? padding;

  /// The icon widget to display in the button.
  final Widget? icon;

  /// The main content of the button.
  final Widget? child;

  /// Indicates if the button is selected.
  ///
  /// This property influences the styling of the button when the tonal constructor is used.
  final bool selected;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The background color of the button when it is selected.
  final Color? selectedBackgroundColor;

  /// The foreground color of the text and icon in the button.
  final Color? foregroundColor;

  /// The foreground color when the button is selected.
  final Color? selectedForegroundColor;

  /// The color of the icon in the button.
  final Color? iconColor;

  /// The color of the icon when the button is selected.
  final Color? selectedIconColor;

  /// The color of the button's border.
  final Color? borderColor;

  /// The color of the button's border when it is selected.
  final Color? selectedBorderColor;

  /// The text style of the content inside the button.
  final TextStyle? textStyle;

  /// The text style of the content inside the button when it is selected.
  final TextStyle? selectedTextStyle;

  /// Indicates if the button should be styled as a circle.
  final bool _circle;

  /// Indicates if the button is using a tonal style.
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
        if (_onPressed) const SizedBox(height: 4.0),
        Container(
          width: widget._circle ? (widget.radius ?? (widget.padding != null ? null : 48.0)) : widget.width,
          height: widget._circle ? (widget.radius ?? (widget.padding != null ? null : 48.0)) : widget.height,
          decoration: BoxDecoration(
            color: widget.onPressed == null ? effectiveDisabledColor : effectiveBackgroundColor,
            borderRadius: widget._circle ? null : kBorderRadius,
            border: Border(
              left: BorderSide(
                color: widget.onPressed == null ? effectiveDisabledColor : effectiveBorderColor,
                width: 2.0,
              ),
              top: BorderSide(
                color: widget.onPressed == null ? effectiveDisabledColor : effectiveBorderColor,
                width: 2.0,
              ),
              right: BorderSide(
                color: widget.onPressed == null ? effectiveDisabledColor : effectiveBorderColor,
                width: 2.0,
              ),
              bottom: BorderSide(
                color: widget.onPressed == null ? effectiveDisabledColor : effectiveBorderColor,
                width: _onPressed ? 2.0 : 6.0,
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
                  padding: widget.padding ?? (widget._tonal ? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0) : const EdgeInsets.symmetric(vertical: 16.0)),
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

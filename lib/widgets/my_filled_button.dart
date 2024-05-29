part of 'widgets.dart';

class MyFilledButton extends StatefulWidget {
  const MyFilledButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  State<MyFilledButton> createState() => _MyFilledButtonState();
}

class _MyFilledButtonState extends State<MyFilledButton> {
  bool _onPressed = false;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_onPressed) const SizedBox(height: 3.0),
          Container(
            decoration: BoxDecoration(
              // TODO: Implement color for disabled state when widget.onPressed is null
              color: kColorPrimary,
              borderRadius: kBorderRadius,
              border: Border(
                left: const BorderSide(
                  color: kColorBorder,
                ),
                top: const BorderSide(
                  color: kColorBorder,
                ),
                right: const BorderSide(
                  color: kColorBorder,
                ),
                bottom: BorderSide(
                  color: kColorBorder,
                  width: _onPressed ? 1.0 : 4.0,
                ),
              ),
            ),
            child: Material(
              borderRadius: kBorderRadius,
              color: Colors.transparent,
              child: InkWell(
                borderRadius: kBorderRadius,
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

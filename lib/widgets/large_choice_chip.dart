part of 'widgets.dart';

class LargeChoiceChip extends StatelessWidget {
  const LargeChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    this.onSelected,
  });

  final Widget label;
  final bool selected;
  final ValueChanged<bool>? onSelected;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          // TODO: maybe change the color to appropiate one?
          color: selected ? const Color(0xFFD1B23D) : kColorYellow,
          borderRadius: kBorderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: kBorderRadius,
          child: InkWell(
            onTap: onSelected != null ? () => onSelected?.call(!selected) : null,
            borderRadius: kBorderRadius,
            child: DefaultTextStyle(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: kColorBlack),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
                child: label,
              ),
            ),
          ),
        ),
      );
}

part of 'custom_widgets_by_sumit.dart';

class AnimatedSearchbar extends StatefulWidget {
  const AnimatedSearchbar(
      {super.key,
      this.searchBarBGColor,
      required this.textEditingController,
      this.iconColor,
      required this.onTapOfSearch,
      this.onFieldSubmitted,
      this.onChanged});

  final Color? searchBarBGColor, iconColor;
  final TextEditingController textEditingController;
  final VoidCallback onTapOfSearch;
  final VoidCallback? onFieldSubmitted, onChanged;

  @override
  State<AnimatedSearchbar> createState() => _AnimatedSearchbarState();
}

class _AnimatedSearchbarState extends State<AnimatedSearchbar> {
  bool doToggle = false;

  void doToggling() => setState(() {
        doToggle = !doToggle;
      });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      padding: EdgeInsets.all(8),
      height: 56,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.searchBarBGColor ?? Colors.white),
      child: doToggle
          ? TextField()
          : Center(
              child: AnimatedOpacity(
                  opacity: doToggle ? 1 : 0,
                  duration: Duration(seconds: 1),
                  child: IconButton(
                    icon: Icon(
                      Icons.search_outlined,
                      color: widget.iconColor ?? Colors.black,
                    ),
                    onPressed: doToggling,
                  )),
            ),
    );
  }
}

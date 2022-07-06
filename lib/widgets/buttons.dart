import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:gwala/constants/colors.dart';
import 'package:gwala/constants/text.dart';
import 'package:gwala/helpers/scroll_to_item.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class AppBarButton extends StatefulWidget {
  final String label;
  final Image icon;
  final double width;
  final GlobalKey viewKey;

  const AppBarButton(
      {Key? key,
      required this.label,
      required this.icon,
      required this.width,
      required this.viewKey})
      : super(key: key);

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton>
    with SingleTickerProviderStateMixin {
  var isLoading = false;
  bool isPressed = false;
  bool isElevated = true;

  var _buttonPrimary = Colors.white;
  var _buttonOnPrimary = AppColors.colorPalette['dark'];

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    animation = Tween<double>(begin: -0.5, end: 1).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, _) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              boxShadow: isElevated
                  ? [
                      BoxShadow(
                        color: Colors.grey[500]!,
                        offset: const Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ]
                  : []),
          child: TextButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(65 + (widget.width - 60) * animation.value, 50),
              primary: _buttonPrimary,
              onPrimary: _buttonOnPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            ),
            onPressed: () {
              scrollToItem(widget.viewKey);
              setState(() {
                isPressed = true;
                _buttonPrimary = AppColors.colorPalette['secondary']!;
              });
            },
            onHover: (hovering) {
              if (hovering) {
                setState(
                  () {
                    _buttonPrimary = Colors.white;
                    isElevated = false;
                  },
                );
              } else {
                setState(
                  () {
                    isElevated = true;
                    _buttonPrimary = Colors.white;
                    _buttonOnPrimary = AppColors.colorPalette['dark'];
                  },
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon,
                Expanded(
                  child: Text(widget.label,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.appBarStyle),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AppBarIconButton extends StatefulWidget {
  final AssetImage icon;
  final GlobalKey viewKey;

  const AppBarIconButton({Key? key, required this.icon, required this.viewKey})
      : super(key: key);
  @override
  State<AppBarIconButton> createState() => _AppBarIconButtonState();
}

class _AppBarIconButtonState extends State<AppBarIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
  }

  var isLoading = false;
  bool isPressed = false;
  bool isElevated = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, _) {
          return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: 50 + (1 - animation.value) * 60,
              height: 50, //50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: isElevated
                      ? [
                          BoxShadow(
                            color: Colors.grey[500]!,
                            offset: const Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                        ]
                      : []),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    setState(() {
                      isPressed = true;
                    });
                  },
                  onHover: (bool isHover) {
                    setState(() {
                      isElevated = !isHover;
                    });
                  },
                  child: Image(
                    image: widget.icon,
                  )));
        });
  }
}

class AppPrimaryButton extends StatefulWidget {
  const AppPrimaryButton(
      {Key? key,
      required this.content,
      required this.borderRadius,
      required this.width,
      required this.height,
      required this.onClick})
      : super(key: key);
  final Widget content;
  final double borderRadius;
  final double width;
  final double height;
  final VoidCallback onClick;
  @override
  State<AppPrimaryButton> createState() => _AppPrimaryButtonState();
}

class _AppPrimaryButtonState extends State<AppPrimaryButton> {
  var isLoading = false;
  bool isPressed = false;
  bool isElevated = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: widget.width, //200,
      height: widget.height, //50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: isElevated
              ? [
                  BoxShadow(
                    color: Colors.grey[500]!,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]
              : []),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        onPressed: widget.onClick,
        onHover: (bool isHover) {
          setState(() {
            isElevated = !isHover;
          });
        },
        child: widget.content,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FlipContainerCard extends StatefulWidget {
  final Widget frontWidget;
  final Widget backWidget;

  /// Creates a FlipContainerCard with customizable front and back widgets.
  const FlipContainerCard({
    super.key,
    required this.frontWidget,
    required this.backWidget,
  });

  @override
  _FlipContainerCardState createState() => _FlipContainerCardState();
}

class _FlipContainerCardState extends State<FlipContainerCard>
    with SingleTickerProviderStateMixin {
  bool isFront = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFront = !isFront;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final rotateAnim = Tween(begin: 0.0, end: 1.0).animate(animation);

          return AnimatedBuilder(
            animation: rotateAnim,
            builder: (context, child) {
              final isUnder = ValueKey(isFront) != child?.key;
              final tilt = (animation.value - 0.5).abs() - 0.5;
              final rotationY =
                  isUnder ? (rotateAnim.value - 1) * -1 : rotateAnim.value;

              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001),
                  // ..rotateY(rotationY * 3.1416)
                  // ..rotateY(rotationY * 3.1416),
                alignment: Alignment.center,
                child: isUnder ? Container() : child,
              );
            },
            child: child,
          );
        },
        layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          );
        },
        child: isFront
            ? Container(
                key: ValueKey(true),
                child: widget.frontWidget,
              )
            : Container(
                key: ValueKey(false),
                child: widget.backWidget,
              ),
      ),
    );
  }
}


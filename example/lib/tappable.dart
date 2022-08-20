import 'package:flutter/material.dart';
import 'package:mutable_state/mutable_state.dart';

class TappableButton extends StatefulWidget {
  const TappableButton({
    Key? key,
    required this.counter,
  }) : super(key: key);

  final MutableState<int> counter;

  @override
  State<TappableButton> createState() => _TappableButtonState();
}

class _TappableButtonState extends StateScope<TappableButton> {
  late var counter = track(widget.counter);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        counter.value++;
      },
      child: Text(
        "${counter.value}",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 44),
      ),
    );
  }
}

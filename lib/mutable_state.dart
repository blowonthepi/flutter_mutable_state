library mutable_state;

import 'dart:async';
import 'package:flutter/widgets.dart';

MutableState<T> mutableStateOf<T>(T value) {
  return MutableState(value);
}

class MutableState<T> {
  MutableState(T value) : _value = value;

  T _value;

  T get value => _value;

  set value(T value) {
    _value = value;
    _stream.add(value);
  }

  @protected
  final StreamController<T> _stream = StreamController();
  @protected
  late final _broadcastStream = _stream.stream.asBroadcastStream();

  Stream<T> get _broadcast => _broadcastStream;
}

/// StateScope is a replacement for State in a StatefulWidget.
/// It's special skill is the [track] function which listens to it's [MutableState]'s broadcast stream.
abstract class StateScope<T extends StatefulWidget> extends State<T> {
  final Set<StreamSubscription> _listeners = {};

  M track<M extends MutableState>(M state) {
    _listeners.add(state._broadcast.listen((event) {
      setState(() {});
    }));
    return state;
  }

  @override
  void dispose() {
    for (var value in _listeners) {
      value.cancel();
    }
    super.dispose();
  }
}

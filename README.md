Extends the abilities of Flutter's existing State management to avoid the need for ```setState()``` to be littered around your code.

## Features

Triggers rebuilds of StatefulWidget's state when a MutableState being tracked is mutated.

## Getting started

Add the package to your dependencies:
```yaml
dependencies:
  mutable_state: latest_version
```

## Usage

```dart
// ommited StatefulWidget

class _TappableButtonState extends StateScope<TappableButton> {
  // You must call track() for StateScope to track the state.
  // It'll also need to be marked as late.
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
```

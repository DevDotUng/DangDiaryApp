import 'package:flutter/material.dart';

class AutomaticKeepAliveScreen extends StatefulWidget {
  AutomaticKeepAliveScreen({
    Key? key,
    required Widget child,
  })  : this.child = child,
        assert(child != null);

  final Widget child;

  @override
  _AutomaticKeepAliveScreenState createState() =>
      _AutomaticKeepAliveScreenState();
}

class _AutomaticKeepAliveScreenState extends State<AutomaticKeepAliveScreen>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return widget.child;
  }
}

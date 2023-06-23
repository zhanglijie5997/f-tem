import 'package:flutter/material.dart';

class CalenderCollectionComponent extends StatefulWidget {
  const CalenderCollectionComponent({super.key});

  @override
  State<CalenderCollectionComponent> createState() =>
      _CalenderCollectionComponentState();
}

class _CalenderCollectionComponentState
    extends State<CalenderCollectionComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemBuilder: (c, i) => Text('$i'),
      itemCount: 100,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

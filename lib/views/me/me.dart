import 'package:flutter/material.dart';


class MeView extends StatefulWidget {
  const MeView({super.key});

  @override
  State<MeView> createState() => _MeViewState();
}


class _MeViewState extends State<MeView> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Placeholder();
  }
  
  @override
  bool get wantKeepAlive => true;
}
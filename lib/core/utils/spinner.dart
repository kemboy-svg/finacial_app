// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  LoadingSpinner({
    Key? key,

     required Color ? color,
    double ? strokeWidth,strokeAlign,
  }):super();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

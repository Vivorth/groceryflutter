import 'package:flutter/cupertino.dart';

class Responsive {
  double responsiveness(BuildContext context, double value) {
    double width = MediaQuery.of(context).size.width;
    return (value / 283) * width;
  }
}

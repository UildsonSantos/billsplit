import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  final String bill;
  final String tax;
  final double friends;
  final double tip;

  const ResultsPage(
      {super.key,
      required this.bill,
      required this.tax,
      required this.friends,
      required this.tip});

  @override
  State<ResultsPage> createState() => ResultsPageState();
}

class ResultsPageState extends State<ResultsPage> {
  String dividedAmount = '';
  @override
  void initState() {
    super.initState();
    divideamount();
  }

  divideamount() {
    double taxAmount =
        double.parse(widget.bill) * (double.parse(widget.tax) / 100);
    double finalBill =
        (double.parse(widget.bill) + taxAmount + widget.tip) / widget.friends;

    setState(() {
      dividedAmount = finalBill.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillSplit extends StatefulWidget {
  const BillSplit({super.key});

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 50),
              child: Text(
                'Split Bill',
                style: GoogleFonts.montserrat(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}

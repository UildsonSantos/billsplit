import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillSplit extends StatefulWidget {
  const BillSplit({super.key});

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  double friendsValue = 0.0;
  double tip = 0.0;
  String tax = '0';
  String bill = '';

  TextStyle infoStyle = GoogleFonts.montserrat(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700);

  Expanded buildButton(String text) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(20),
        ),
        onPressed: () {
          if (text == '-') {
            setState(() {
              bill = '';
            });
          } else {
            setState(() {
              bill += text;
            });
          }
        },
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.montserrat(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            bill,
                            style: GoogleFonts.montserrat(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Friends', style: infoStyle),
                              Text('Tax', style: infoStyle),
                              Text('Tip', style: infoStyle),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(friendsValue.toStringAsFixed(0),
                                  style: infoStyle),
                              Text('$tax %', style: infoStyle),
                              Text(tip.toStringAsFixed(0), style: infoStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'How many friends?',
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Slider(
                min: 0,
                max: 15,
                divisions: 15,
                activeColor: Colors.orange,
                inactiveColor: Colors.grey,
                value: friendsValue,
                onChanged: (value) {
                  setState(() {
                    friendsValue = value;
                  });
                },
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'TIP',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: FloatingActionButton(
                                backgroundColor: Colors.grey[400],
                                onPressed: () {
                                  setState(() {
                                    tip--;
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              '\$ ${tip.toStringAsFixed(0)}',
                              style: GoogleFonts.montserrat(
                                fontSize: 27,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: FloatingActionButton(
                                backgroundColor: Colors.grey[400],
                                onPressed: () {
                                  setState(() {
                                    tip++;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            tax = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Tax in %',
                          labelStyle: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                ],
              ),
              Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                ],
              ),
              Row(
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                ],
              ),
              Row(
                children: [
                  buildButton('.'),
                  buildButton('0'),
                  buildButton('-'),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(360, 70),
                ),
                onPressed: () {},
                child: Text(
                  'Split Bill',
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

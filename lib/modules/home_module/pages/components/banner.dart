import 'package:ajani/ui_utils/app_text.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppText.appText(
                text: "Cryptocurrency",
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            const SizedBox(
              width: 20,
            ),
            AppText.appText(
                text: "NFT",
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 198, 198, 198),
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const WaveShape()
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wave Shape in Flutter'),
        ),
        body: const WaveShape(),
      ),
    );
  }
}

class WaveShape extends StatelessWidget {
  const WaveShape({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 206, 8, 1).withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Positioned(
            top: 25,
            child: SizedBox(
              width: size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage("assets/images/bitcoin.png"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.appText(
                                text: "BTC",
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            AppText.appText(
                                text: "Bitcoin",
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13))
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppText.appText(
                                text: "\$55,000 USD",
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            AppText.appText(
                                text: "+2.5%",
                                textStyle: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13))
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 87),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 9, 80, 12).withOpacity(0.01),
                  ),
                  height: 40.0,
                  width: double.infinity,
                  child: ClipPath(
                    clipper: const ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)))),
                    child: CustomPaint(
                      painter: RPSCustomPainter(
                          color: const Color.fromRGBO(0, 206, 8, 0.8)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 229, 255, 230)
                        .withOpacity(0.01),
                  ),
                  height: 40.0,
                  width: double.infinity,
                  child: ClipPath(
                    clipper: const ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)))),
                    child: CustomPaint(
                      painter: RPSCustomPainter(
                          color: const Color.fromRGBO(0, 206, 8, 0.8)
                              .withOpacity(0.1)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  Color color;
  RPSCustomPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 5.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0462500, size.height * 0.2202865);
    path_0.quadraticBezierTo(size.width * 0.0587500, size.height * 0.0310445,
        size.width * 0.0950000, size.height * 0.0334400);
    path_0.cubicTo(
        size.width * 0.1296875,
        size.height * 0.0549992,
        size.width * 0.1478125,
        size.height * 0.6706345,
        size.width * 0.1812500,
        size.height * 0.6370979);
    path_0.cubicTo(
        size.width * 0.2034375,
        size.height * 0.6197308,
        size.width * 0.2090625,
        size.height * 0.4005455,
        size.width * 0.2637500,
        size.height * 0.3903647);
    path_0.cubicTo(
        size.width * 0.3056250,
        size.height * 0.4029409,
        size.width * 0.2818750,
        size.height * 0.5556520,
        size.width * 0.3375000,
        size.height * 0.5676293);
    path_0.cubicTo(
        size.width * 0.3753125,
        size.height * 0.5700248,
        size.width * 0.3709375,
        size.height * 0.4670197,
        size.width * 0.4000000,
        size.height * 0.4478559);
    path_0.cubicTo(
        size.width * 0.4518750,
        size.height * 0.4382741,
        size.width * 0.4468750,
        size.height * 0.6969846,
        size.width * 0.4937500,
        size.height * 0.6634481);
    path_0.cubicTo(
        size.width * 0.5490625,
        size.height * 0.6430866,
        size.width * 0.5471875,
        size.height * 0.2238797,
        size.width * 0.5900000,
        size.height * 0.2298684);
    path_0.cubicTo(
        size.width * 0.6365625,
        size.height * 0.2136989,
        size.width * 0.6659375,
        size.height * 0.5478667,
        size.width * 0.6912500,
        size.height * 0.5724203);
    path_0.cubicTo(
        size.width * 0.7140625,
        size.height * 0.5927818,
        size.width * 0.7196875,
        size.height * 0.4394718,
        size.width * 0.7462500,
        size.height * 0.4310877);
    path_0.cubicTo(
        size.width * 0.7778125,
        size.height * 0.4346809,
        size.width * 0.7659375,
        size.height * 0.5520588,
        size.width * 0.7975000,
        size.height * 0.5508611);
    path_0.cubicTo(
        size.width * 0.8650000,
        size.height * 0.5436747,
        size.width * 0.8443750,
        size.height * 0.2226820,
        size.width * 0.8875000,
        size.height * 0.2250774);
    path_0.quadraticBezierTo(size.width * 0.9496875, size.height * 0.2083091,
        size.width, size.height * 1.0060000);
    path_0.lineTo(size.width * -0.0012500, size.height * 1.0036045);
    path_0.lineTo(size.width * 0.0462500, size.height * 0.2202865);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

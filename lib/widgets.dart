import 'package:flutter/material.dart';

class BackgroundBlob extends StatelessWidget {
  const BackgroundBlob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 128.0),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 16.0),
                Text(
                  'Super Template',
                  style: textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(width: double.maxFinite),
            Positioned(
              top: 80,
              child: CustomPaint(
                size: Size(450, (450 * 0.9732540861812778).toDouble()),
                painter: YellowBlob(),
              ),
            ),
            Positioned(
              top: 220 * 0.70,
              left: 320,
              child: CustomPaint(
                size: Size(450, (450 * 0.9732540861812778).toDouble()),
                painter: RedBlob(),
              ),
            ),
            Positioned(
              top: 450 * 0.70,
              left: 100,
              child: CustomPaint(
                size: Size(450, (450 * 0.9732540861812778).toDouble()),
                painter: BlueBlob(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YellowBlob extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.09802407, size.height * 0.6951328);
    path_0.cubicTo(
        size.width * 0.04590223,
        size.height * 0.5985527,
        size.width * 0.1009614,
        size.height * 0.4829328,
        size.width * 0.1373101,
        size.height * 0.3790046);
    path_0.cubicTo(
        size.width * 0.1695201,
        size.height * 0.2869115,
        size.width * 0.2109807,
        size.height * 0.1983237,
        size.width * 0.2905780,
        size.height * 0.1445843);
    path_0.cubicTo(
        size.width * 0.3750104,
        size.height * 0.08758092,
        size.width * 0.4754993,
        size.height * 0.07118489,
        size.width * 0.5758811,
        size.height * 0.08290962);
    path_0.cubicTo(
        size.width * 0.6977355,
        size.height * 0.09714229,
        size.width * 0.8464086,
        size.height * 0.1057194,
        size.width * 0.9051010,
        size.height * 0.2163618);
    path_0.cubicTo(
        size.width * 0.9635215,
        size.height * 0.3264901,
        size.width * 0.8679643,
        size.height * 0.4503252,
        size.width * 0.8348202,
        size.height * 0.5710382);
    path_0.cubicTo(
        size.width * 0.8024695,
        size.height * 0.6888611,
        size.width * 0.8207489,
        size.height * 0.8432885,
        size.width * 0.7166256,
        size.height * 0.9027985);
    path_0.cubicTo(
        size.width * 0.6127563,
        size.height * 0.9621603,
        size.width * 0.4939153,
        size.height * 0.8683679,
        size.width * 0.3809376,
        size.height * 0.8304397);
    path_0.cubicTo(
        size.width * 0.2781486,
        size.height * 0.7959344,
        size.width * 0.1504636,
        size.height * 0.7923023,
        size.width * 0.09802407,
        size.height * 0.6951328);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffFFC297).withOpacity(0.3);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BlueBlob extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6124438, size.height * 0.06768623);
    path_0.cubicTo(
        size.width * 0.7062507,
        size.height * 0.07180570,
        size.width * 0.7786960,
        size.height * 0.1489033,
        size.width * 0.8346311,
        size.height * 0.2182477);
    path_0.cubicTo(
        size.width * 0.8802233,
        size.height * 0.2747709,
        size.width * 0.8772536,
        size.height * 0.3490490,
        size.width * 0.8946700,
        size.height * 0.4175695);
    path_0.cubicTo(
        size.width * 0.9083516,
        size.height * 0.4713960,
        size.width * 0.9270677,
        size.height * 0.5222093,
        size.width * 0.9259409,
        size.height * 0.5774755);
    path_0.cubicTo(
        size.width * 0.9246844,
        size.height * 0.6391483,
        size.width * 0.9209424,
        size.height * 0.7017245,
        size.width * 0.8877867,
        size.height * 0.7553523);
    path_0.cubicTo(
        size.width * 0.8503775,
        size.height * 0.8158570,
        size.width * 0.7973689,
        size.height * 0.8698795,
        size.width * 0.7279654,
        size.height * 0.8976861);
    path_0.cubicTo(
        size.width * 0.6540677,
        size.height * 0.9272940,
        size.width * 0.5637147,
        size.height * 0.9473364,
        size.width * 0.4916974,
        size.height * 0.9140464);
    path_0.cubicTo(
        size.width * 0.4203963,
        size.height * 0.8810874,
        size.width * 0.4282233,
        size.height * 0.7787616,
        size.width * 0.3675634,
        size.height * 0.7310901);
    path_0.cubicTo(
        size.width * 0.2890836,
        size.height * 0.6694146,
        size.width * 0.1466110,
        size.height * 0.6875258,
        size.width * 0.09733343,
        size.height * 0.6041219);
    path_0.cubicTo(
        size.width * 0.04943357,
        size.height * 0.5230490,
        size.width * 0.07996556,
        size.height * 0.4130185,
        size.width * 0.1335444,
        size.height * 0.3350079);
    path_0.cubicTo(
        size.width * 0.1852522,
        size.height * 0.2597205,
        size.width * 0.2933919,
        size.height * 0.2443298,
        size.width * 0.3761830,
        size.height * 0.1981152);
    path_0.cubicTo(
        size.width * 0.4563271,
        size.height * 0.1533788,
        size.width * 0.5187867,
        size.height * 0.06357338,
        size.width * 0.6124438,
        size.height * 0.06768623);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff8DD4F4).withOpacity(0.3);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RedBlob extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1845354, size.height * 0.1000477);
    path_0.cubicTo(
        size.width * 0.2899322,
        size.height * 0.02740915,
        size.width * 0.4269683,
        size.height * 0.1203621,
        size.width * 0.5553290,
        size.height * 0.1331111);
    path_0.cubicTo(
        size.width * 0.6602251,
        size.height * 0.1435296,
        size.width * 0.7851732,
        size.height * 0.09213549,
        size.width * 0.8576291,
        size.height * 0.1669014);
    path_0.cubicTo(
        size.width * 0.9297201,
        size.height * 0.2412901,
        size.width * 0.8671472,
        size.height * 0.3597873,
        size.width * 0.8740202,
        size.height * 0.4619634);
    path_0.cubicTo(
        size.width * 0.8818701,
        size.height * 0.5786606,
        size.width * 0.9667403,
        size.height * 0.7012915,
        size.width * 0.9001169,
        size.height * 0.7984958);
    path_0.cubicTo(
        size.width * 0.8290087,
        size.height * 0.9022408,
        size.width * 0.6829524,
        size.height * 0.9348535,
        size.width * 0.5553290,
        size.height * 0.9269324);
    path_0.cubicTo(
        size.width * 0.4345310,
        size.height * 0.9194352,
        size.width * 0.3374271,
        size.height * 0.8417268,
        size.width * 0.2517677,
        size.height * 0.7582549);
    path_0.cubicTo(
        size.width * 0.1660130,
        size.height * 0.6746915,
        size.width * 0.09019235,
        size.height * 0.5796549,
        size.width * 0.07817071,
        size.height * 0.4619634);
    path_0.cubicTo(
        size.width * 0.06490967,
        size.height * 0.3321366,
        size.width * 0.07534185,
        size.height * 0.1753028,
        size.width * 0.1845354,
        size.height * 0.1000477);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffDA5050).withOpacity(0.3);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

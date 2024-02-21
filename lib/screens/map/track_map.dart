import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class TrackMap extends StatelessWidget {
  final notifier = ValueNotifier(Offset.zero);

  TrackMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (e) => notifier.value = e.localPosition,
      onPointerMove: (e) => notifier.value = e.localPosition,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 8, 0),
        child: CustomPaint(
          painter: WorldMapPainter(notifier),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}

class Shape {
  Shape(strPath, this._label, this._color) : _path = parseSvgPathData(strPath);

  /// transforms a [_path] into [_transformedPath] using given [matrix]
  void transform(Matrix4 matrix) =>
      _transformedPath = _path.transform(matrix.storage);

  final Path _path;
  Path? _transformedPath;
  final String _label;
  final Color _color;
}

class WorldMapPainter extends CustomPainter {
  WorldMapPainter(this._notifier) : super(repaint: _notifier);

  static final _data = '''M0 25H26M26 25V5H66.5M26 25V46H66.5 
M 37 5 m 5, 0 a 5,5 0 1,0 -10,0 a 5,5 0 1,0  10,0 
M 37 46 m 5, 0 a 5,5 0 1,0 -10,0 a 5,5 0 1,0  10,0 
M 59 5 m 5, 0 a 5,5 0 1,0 -10,0 a 5,5 0 1,0  10,0 
M 59 46 m 5, 0 a 5,5 0 1,0 -10,0 a 5,5 0 1,0  10,0'''
      .split('\n');

  final _shapes = [
    Shape(_data[0], 'track', Colors.black),
    Shape(_data[1], 'cube0', Colors.grey),
    Shape(_data[2], 'cube1', Colors.grey),
    Shape(_data[3], 'cube2', Colors.grey),
    Shape(_data[4], 'cube3', Colors.grey),
  ];

  final ValueNotifier<Offset> _notifier;
  final Paint _paint = Paint();
  Size _size = Size.zero;

  @override
  void paint(Canvas canvas, Size size) {
    if (size != _size) {
      _size = size;
      final fs = applyBoxFit(BoxFit.contain, const Size(70, 70), size);
      final r = Alignment.center.inscribe(fs.destination, Offset.zero & size);
      final matrix = Matrix4.translationValues(r.left, r.top, 0)
        ..scale(fs.destination.width / fs.source.width);
      for (var shape in _shapes) {
        shape.transform(matrix);
      }
    }

    canvas
      ..clipRect(Offset.zero & size)
      ..drawColor(Colors.white, BlendMode.src);
    Shape? selectedShape;
    for (var shape in _shapes) {
      final path = shape._transformedPath;
      final selected = path!.contains(_notifier.value);
      if (shape._label == "track") {
        _paint
          ..color = Colors.black
          ..strokeWidth = 3
          ..style = PaintingStyle.stroke;
        canvas.drawPath(path, _paint);
      } else {
        _paint
          ..color = selected ? Colors.teal : shape._color
          ..style = PaintingStyle.fill;
        canvas.drawPath(path, _paint);
        selectedShape ??= selected ? shape : null;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:grubhie/utilities/note_models.dart';
import 'package:grubhie/utilities/constants.dart';

final _lightColors = [
  'ea9052'.toColor(),
  'e84060'.toColor(),
  '77b255'.toColor(),
  '6840e8'.toColor(),
];

class NoteCardWidget extends StatelessWidget {
  NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: getScreenWidth(context) * 0.03),
            ),
            SizedBox(height: 4),
            Text(
              note.title,
              style: TextStyle(
                color: 'fafafa'.toColor(),
                fontSize: getScreenWidth(context) * 0.05,
                fontWeight: FontWeight.bold,
                fontFamily: 'patrickHand',
                shadows: [
                  Shadow(
                    blurRadius: 8,
                    color: Colors.black,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/colors_list_view.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.color = kColors[index].value;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ColorItem(
                isActive: currentIndex == index,
                colors: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteModel});

  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const EditNoteView();
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            ListTile(
              contentPadding: EdgeInsetsDirectional.zero,
              title: Text(
                noteModel.title,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  noteModel.subTitle,
                  style: TextStyle(
                      fontSize: 20, color: Colors.black.withOpacity(0.5)),
                ),
              ),
              trailing: IconButton(
                  alignment: Alignment.topCenter,
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 22,
                  )),
            ),
            Text(
              noteModel.date,
              style:
                  TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.5)),
            ),
          ]),
        ),
      ),
    );
  }
}

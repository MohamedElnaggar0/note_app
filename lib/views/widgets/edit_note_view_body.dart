import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';
import 'package:note_app/views/widgets/edit_note_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Edit Notes',
            icon: Icons.check,
            onPressed: () {
              widget.noteModel.title = title ?? widget.noteModel.title;
              widget.noteModel.subTitle = content ?? widget.noteModel.subTitle;
              widget.noteModel.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNote();
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
            hintText: widget.noteModel.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hintText: widget.noteModel.subTitle,
            maxLines: 5,
          ),
          EditNoteColorList(
            note: widget.noteModel,
          ),
        ],
      ),
    );
  }
}

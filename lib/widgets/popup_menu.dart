import 'package:flutter/material.dart';
import 'package:todo_bloc/models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;
  const PopupMenu({
    Key? key,
    required this.task,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislikeCallback,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false?((contex) => [
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: editTaskCallback,
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit"),
                ),
                onTap: null,
              ),
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: null,
                  icon: task.isFavorite == false
                  ? const Icon(Icons.bookmark_add_outlined)
                  : const Icon(Icons.bookmark_remove),
                  label: task.isFavorite == false
                  ? const Text("Add to \nBookmarks")
                  : const Text("Remove from \nBookmarks"),
                ),
                onTap: likeOrDislikeCallback,
              ),
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.delete),
                  label: const Text("Delete"),
                ),
                onTap: ()=> cancelOrDeleteCallback,
              ),
            ])
            :(context) => [
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.restore_from_trash),
                  label: const Text("Restore"),
                ),
                onTap: restoreTaskCallback,
              ),
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.delete_forever),
                  label: const Text("Delete Forever"),
                ),
                onTap: (){},
              ),
            ]);
  }
}

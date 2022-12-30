class Task {
  final String id;
  final String title;
  final DateTime availableUntil;
  final String? subtitle;

  Task({
    required this.id,
    required this.title,
    required this.availableUntil,
    this.subtitle,
  });
}

class TaskPage extends Task {
  final String routeName;

  TaskPage({
    required this.routeName,
    required String id,
    required String title,
    required DateTime availableUntil,
    String? subtitle,
  }) : super(
          id: id,
          title: title,
          availableUntil: availableUntil,
          subtitle: subtitle,
        );
}

class TaskForm extends Task {
  final String routeName;
  final String formId;

  TaskForm({
    required this.routeName,
    required this.formId,
    required String id,
    required String title,
    required DateTime availableUntil,
    String? subtitle,
  }) : super(
          id: id,
          title: title,
          availableUntil: availableUntil,
          subtitle: subtitle,
        );
}

class TaskLink extends Task {
  final String link;

  TaskLink({
    required this.link,
    required String id,
    required String title,
    required DateTime availableUntil,
    String? subtitle,
  }) : super(
          id: id,
          title: title,
          availableUntil: availableUntil,
          subtitle: subtitle,
        );
}

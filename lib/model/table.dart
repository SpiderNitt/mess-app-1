final String tableNotes = 'notes';
final String Register = 'REG';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, number, time
  ];

  static final String id = '_id';
  static final String number = 'number';
  static final String time = 'time';
}

class Note {
  final int? id;
  final int number;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.number,
    required this.createdTime,
  });

  Note copy({
    int? id,
    int? number,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        number: number ?? this.number,
        createdTime: createdTime ?? this.createdTime,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        number: json[NoteFields.number] as int,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.number: number,
        NoteFields.time: createdTime.toIso8601String(),
      };
}

class REG_Fields {
  static final List<String> values = [
    /// Add all fields
    number, name
  ];

  static final String number = 'number';
  static final String name = 'name';
}

class REG {
  final int number;
  final String name ;

  const REG({
    required this.number,
    required this.name,
  });

  REG copy({
    int? number,
    String? name,
  }) =>
      REG(
        number: number ?? this.number,
        name: name ?? this.name,
      );

  static REG fromJson(Map<String, Object?> json) => REG(
    number: json[REG_Fields.number] as int,
    name: json[REG_Fields.name] as String,
  );

  Map<String, Object?> toJson() => {
    REG_Fields.name: name,
    REG_Fields.number: number,
  };
}

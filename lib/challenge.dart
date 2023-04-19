
class Challenge {
  String name;
  String exerciseId;
  double? duration;
  double? repetition;

  Challenge({
    required this.name,
    required this.exerciseId,
    this.duration,
    this.repetition,
  });

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      name: json['name'],
      exerciseId: json['exercise_id'],
      duration: json['duration'],
      repetition: json['repetition'],
    );
  }

  Map<String, dynamic> toJson(Challenge challenge) {
    Map<String, dynamic> json = {
      'name': challenge.name,
      'exercise_id': challenge.exerciseId,
      'duration': challenge.duration,
      'repetition': challenge.repetition
    };

    return json;
  }
}

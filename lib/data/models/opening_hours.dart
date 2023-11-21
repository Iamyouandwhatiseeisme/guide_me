import 'package:hive/hive.dart';

part 'opening_hours.g.dart';

@HiveType(typeId: 1)
class OpeningHours {
  @HiveField(0)
  final bool? openNow;

  OpeningHours({
    required this.openNow,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(
      openNow: json['open_now'],
    );
  }
}

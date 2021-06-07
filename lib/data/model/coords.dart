import 'package:freezed_annotation/freezed_annotation.dart';

part 'coords.freezed.dart';
part 'coords.g.dart';

@freezed
class Coords with _$Coords {
  const factory Coords({required double latitude, required double longitude}) = _Coords;

  factory Coords.fromJson(Map<String, dynamic> data) => _$CoordsFromJson(data);
}
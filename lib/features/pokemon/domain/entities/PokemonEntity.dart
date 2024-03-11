import 'package:freezed_annotation/freezed_annotation.dart';

part 'PokemonEntity.freezed.dart';

@freezed
class PokemonEntity with _$PokemonEntity {
  const factory PokemonEntity({
    required int id,
    String? name,
    String? sprite,
  }) = _PokemonEntity;
}

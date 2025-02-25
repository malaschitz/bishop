import 'package:bishop/bishop.dart';

extension MoveListExtension on Iterable<Move> {
  /// All moves that involve a promotion.
  List<Move> get promoMoves => where((e) => e.promotion).toList();

  /// All moves that involve gating.
  List<Move> get gatingMoves => where((e) => e.gate).toList();

  /// All moves that involve a hand drop.
  List<Move> get handDropMoves => where((e) => e.handDrop).toList();

  /// All moves from [square].
  List<Move> from(int square) => where((e) => e.from == square).toList();

  /// All moves to [square].
  List<Move> to(int square) => where((e) => e.to == square).toList();
}

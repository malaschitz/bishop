import 'castling_rights.dart';
import 'constants.dart';
import 'move.dart';

/// A record of the game's state at a particular move.
/// Doesn't include the board state.
class State {
  /// The previous move that was played. If null, the game has just started.
  final Move? move;

  /// The player who can make the next move.
  final Colour turn;

  /// How many half moves have been played since the last capture or pawn move.
  final int halfMoves;

  /// How many full moves have been played in the entire game.
  final int fullMoves;

  /// The current castling rights of both players.
  final CastlingRights castlingRights;

  /// The en passant square, if one is available.
  final int? epSquare;

  /// The squares the kings (or equivalent) currently reside on.
  /// Index 0 - white, index 1 - black.
  final List<int> royalSquares;

  /// Two lists of pieces, for each player's hand.
  /// Index 0 - white, Index 1 - black.
  final List<Hand>? hands;

  /// The Zobrist hash of the game state.
  /// Needs to be set after construction of the first hash, but otherwise is
  /// updated in `Game.makeMove()`.
  int hash;

  State({
    this.move,
    required this.turn,
    required this.halfMoves,
    required this.fullMoves,
    required this.castlingRights,
    this.epSquare,
    required this.royalSquares,
    this.hands,
    this.hash = 0,
  });
}

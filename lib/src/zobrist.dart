import 'dart:math';
import 'package:bishop/bishop.dart';

class Zobrist {
  static const int META = 0;
  late List<List<int>> table;
  Map<int, int> hashes = {};

  late int CASTLING;
  late int TURN;

  Zobrist(Variant variant, int seed) {
    init(variant, seed);
  }

  void init(Variant variant, int seed) {
    const int numAux = 16; // we need some extra entries for castling rights, ep, etc
    const int numParts = 4;
    Random r = Random(seed);
    int dimX = variant.boardSize.numIndices + numAux;
    int dimY = max(variant.pieces.length * 2, Castling.mask + 1);
    CASTLING = dimY + 1;
    TURN = dimY + 2;
    table = List<List<int>>.generate(dimX, (i) => List<int>.generate(dimY, (j) => 0));
    for (int i = 0; i < dimX; i++) {
      for (int j = 0; j < dimY; j++) {
        int value = 0;
        for (int k = 0; k < numParts; k++) {
          // compute a random 64 bit int
          int part = r.nextInt(1 << 16); // 16 bit because max value is 2^32-1
          value <<= 16;
          value += part;
        }
        table[i][j] = value;
      }
    }
  }

  int compute(State state, List<int> board) {
    int hash = 0;
    for (int i = 0; i < board.length; i++) {
      if (board[i] != EMPTY) hash ^= table[i][board[i]];
    }
    if (state.epSquare != null) hash ^= table[state.epSquare!][META];
    hash ^= table[CASTLING][state.castlingRights];
    if (state.turn == BLACK) hash ^= table[TURN][META];

    return hash;
  }

  int incrementHash(int hash) {
    if (hashes.containsKey(hash)) {
      hashes[hash] = hashes[hash]! + 1;
    } else {
      hashes[hash] = 1;
    }
    return hashes[hash]!;
  }

  int decrementHash(int hash) {
    if (hashes.containsKey(hash)) {
      hashes[hash] = hashes[hash]! - 1;
      int hits = hashes[hash]!;
      if (hashes[hash]! < 1) {
        hashes.remove(hash);
        hits = 0;
      }
      return hits;
    } else {
      return 0;
    }
  }

  int hashHits(int hash) => hashes.containsKey(hash) ? hashes[hash]! : 0;
}

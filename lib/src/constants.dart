typedef Colour = int;

extension Opponent on Colour {
  Colour get opponent => 1 - this;
}

const Colour WHITE = 0;
const Colour BLACK = 1;

const int INVALID = -1;
const int HAND = -2;

const List<int> PLAYER_DIRECTION = [-1, 1];
const List<String> PLAYER_NAME = ['hite', 'Black'];

const ASCII_a = 97;

const Map<String, String> UNICODE_PIECES = {
  'R': '♜',
  'N': '♞',
  'B': '♝',
  'Q': '♛',
  'K': '♚',
  'P': '♟',
  'r': '♖',
  'n': '♘',
  'b': '♗',
  'q': '♕',
  'k': '♔',
  'p': '♙',
  '.': '·'
};

class Modality {
  static const int QUIET = 0;
  static const int CAPTURE = 1;
  static const int BOTH = 2;

  static const List<int> ALL = [QUIET, CAPTURE, BOTH];
}

// Just shorthands for building variants
const int FILE_A = 0;
const int FILE_B = 1;
const int FILE_C = 2;
const int FILE_D = 3;
const int FILE_E = 4;
const int FILE_F = 5;
const int FILE_G = 6;
const int FILE_H = 7;
const int FILE_I = 8;
const int FILE_J = 9;
const int FILE_K = 10;
const int FILE_L = 11;
const int FILE_M = 12;
const int FILE_N = 13;
const int FILE_O = 14;
const int FILE_P = 15;

const int RANK_1 = 0;
const int RANK_2 = 1;
const int RANK_3 = 2;
const int RANK_4 = 3;
const int RANK_5 = 4;
const int RANK_6 = 5;
const int RANK_7 = 6;
const int RANK_8 = 7;
const int RANK_9 = 8;
const int RANK_10 = 9;
const int RANK_11 = 10;
const int RANK_12 = 11;
const int RANK_13 = 12;
const int RANK_14 = 13;
const int RANK_15 = 14;
const int RANK_16 = 15;

enum LogicGateType { and, or, nand, nor, xor }

extension LogicGateTypeExtension on LogicGateType {
  String get assetPath {
    return 'assets/images/logic_gate/cards/$name.svg';
  }

  int calculate(int input1, int input2) {
    switch (this) {
      case LogicGateType.and:
        return input1 & input2;
      case LogicGateType.or:
        return input1 | input2;
      case LogicGateType.nor:
        return (input1 | input2) == 0 ? 1 : 0;
      case LogicGateType.xor:
        return input1 ^ input2;
      case LogicGateType.nand:
        return (input1 & input2) == 0 ? 1 : 0;
    }
  }
}

enum LogicGateType { AND, OR, NAND, NOR, XOR }

extension LogicGateTypeExtension on LogicGateType {
  String get assetPath {
    return 'assets/images/logic_gate/${this.name}.svg';
  }

  int calculate(int input1, int input2) {
    switch (this) {
      case LogicGateType.AND:
        return input1 & input2;
      case LogicGateType.OR:
        return input1 | input2;
      case LogicGateType.NOR:
        return (input1 | input2) == 0 ? 1 : 0;
      case LogicGateType.XOR:
        return input1 ^ input2;
      case LogicGateType.NAND:
        return (input1 & input2) == 0 ? 1 : 0;
    }
  }
}

class HelperAcordeFormatter {
  static String formatListToString(List<int> data, {int trasteInicial = 1}) =>
      data.map((e) => e > 0 ? e - (trasteInicial - 1) : e).toList().join(" ");
}

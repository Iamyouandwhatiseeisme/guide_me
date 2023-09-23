String swapUnderScoreWithSpace(String type) {
  if (type.contains('_')) {
    type = type.replaceAll('_', ' ');
  }

  return type;
}

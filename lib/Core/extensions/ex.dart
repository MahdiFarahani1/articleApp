extension StringEx on String {
  String limitedTitle() {
    if (length > 50) {
      String newTitle = substring(0, 50);
      newTitle += "...";

      return newTitle;
    }
    return this;
  }
}

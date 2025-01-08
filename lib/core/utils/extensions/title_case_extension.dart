extension StringExtensions on String? {
  /// Converts the string to title case.
  /// - If the string is null, empty, or consists of only whitespace, it returns an empty string.
  /// - In a sentence, only the first word will be title cased (capitalized).
  String toTitleCase({
    String nullOrEmptyString = '',
  }) {
    // Check for null or empty string
    if (this == null || this!.trim().isEmpty) {
      return nullOrEmptyString;
    }

    // Trim the string to remove leading/trailing whitespace
    final String trimmedString = this!.trim();

    // Split the sentence by spaces
    final List<String> words = trimmedString.split(' ');

    // Capitalize the first word and leave the rest as they are
    final String firstWord = words[0].substring(0, 1).toUpperCase() +
        words[0].substring(1).toLowerCase();

    // Rejoin the rest of the sentence after the first word
    final String result = [firstWord, ...words.sublist(1)].join(' ');

    return result;
  }
}

class DormEmbed {
  final List<Map<String, String>> embeds;

  DormEmbed({
    required this.embeds,
  });

  Map<String, dynamic> toJson() => {
        'embed': embeds,
      };
}

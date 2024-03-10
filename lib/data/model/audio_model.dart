class AudioModel {
  String? id;
  String? url;
  int? duration;

  AudioModel({
    required this.id,
    required this.url,
    required this.duration
  });

  AudioModel.fromJson(String this.id);
}
class Model {
  String? image, url, source, label;
  Model({this.image, this.url, this.source, this.label});

  List toList() {
    return [image, url, source, label];
  }

  static Model parse(list) {
    return new Model(image: list[0], url: list[1], source: list[2], label: list[3]);
  }
}

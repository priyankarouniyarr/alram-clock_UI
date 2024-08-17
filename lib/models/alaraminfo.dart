class AlaramInfo{
  String? description;
  bool? isactive;
  DateTime? alramDatetime;

  AlaramInfo(
  this.alramDatetime, {this.description,
    this.isactive,
  }
  );

}
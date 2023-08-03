class MovieListModel {
  dynamic albumId;
  dynamic id;
  dynamic title;
  dynamic url;
  dynamic thumbnailUrl;

  MovieListModel(
      {this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  MovieListModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    dynamic data;
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}

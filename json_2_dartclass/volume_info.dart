import 'industry_identifiers.dart';
import 'reading_modes.dart';
import 'panelization_summary.dart';
import 'image_links.dart';

class VolumeInfo {
  String title;
  String subtitle;
  List<String> authors;
  String publisher;
  String publishedDate;
  String description;
  List<IndustryIdentifiers> industryIdentifiers;
  ReadingModes readingModes;
  int pageCount;
  String printType;
  List<String> categories;
  double averageRating;
  int ratingsCount;
  String maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  PanelizationSummary panelizationSummary;
  ImageLinks imageLinks;
  String language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;

  VolumeInfo(
      {this.title,
      this.subtitle,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.industryIdentifiers,
      this.readingModes,
      this.pageCount,
      this.printType,
      this.categories,
      this.averageRating,
      this.ratingsCount,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.panelizationSummary,
      this.imageLinks,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink});

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    authors = json['authors'].cast<String>();
    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    description = json['description'];
    if (json['industryIdentifiers'] != null) {
      industryIdentifiers = new List<IndustryIdentifiers>();
      json['industryIdentifiers'].forEach((v) {
        industryIdentifiers.add(new IndustryIdentifiers.fromJson(v));
      });
    }
    readingModes = json['readingModes'] != null
        ? new ReadingModes.fromJson(json['readingModes'])
        : null;
    pageCount = json['pageCount'];
    printType = json['printType'];
    categories = json['categories'].cast<String>();
    averageRating = json['averageRating'];
    ratingsCount = json['ratingsCount'];
    maturityRating = json['maturityRating'];
    allowAnonLogging = json['allowAnonLogging'];
    contentVersion = json['contentVersion'];
    panelizationSummary = json['panelizationSummary'] != null
        ? new PanelizationSummary.fromJson(json['panelizationSummary'])
        : null;
    imageLinks = json['imageLinks'] != null
        ? new ImageLinks.fromJson(json['imageLinks'])
        : null;
    language = json['language'];
    previewLink = json['previewLink'];
    infoLink = json['infoLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['authors'] = this.authors;
    data['publisher'] = this.publisher;
    data['publishedDate'] = this.publishedDate;
    data['description'] = this.description;
    if (this.industryIdentifiers != null) {
      data['industryIdentifiers'] =
          this.industryIdentifiers.map((v) => v.toJson()).toList();
    }
    if (this.readingModes != null) {
      data['readingModes'] = this.readingModes.toJson();
    }
    data['pageCount'] = this.pageCount;
    data['printType'] = this.printType;
    data['categories'] = this.categories;
    data['averageRating'] = this.averageRating;
    data['ratingsCount'] = this.ratingsCount;
    data['maturityRating'] = this.maturityRating;
    data['allowAnonLogging'] = this.allowAnonLogging;
    data['contentVersion'] = this.contentVersion;
    if (this.panelizationSummary != null) {
      data['panelizationSummary'] = this.panelizationSummary.toJson();
    }
    if (this.imageLinks != null) {
      data['imageLinks'] = this.imageLinks.toJson();
    }
    data['language'] = this.language;
    data['previewLink'] = this.previewLink;
    data['infoLink'] = this.infoLink;
    data['canonicalVolumeLink'] = this.canonicalVolumeLink;
    return data;
  }
}

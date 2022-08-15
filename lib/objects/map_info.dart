class MapInfo {
  final String placeId;
  final String addressName;
  final double latitude;
  final double longitude;

  const MapInfo(this.placeId, this.addressName, this.latitude, this.longitude);

  Map<String, dynamic> toMap() {
    return {
      "placeId": placeId,
      "addressName": addressName,
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}

const allLocations = [
  MapInfo(
      "1",
      "Sultantepe, Selmani Pak Cd. No:21C, 34674 Üsküdar/İstanbul, Turkey",
      41.0254069,
      29.0173281),
  MapInfo("2", "Şemsibey 1. SOk üsküdar istanbul", 41.0254069, 29.0173281),
  MapInfo("3", "yarrak mahallesi kürek/istanbul", 41.0254069, 29.0173281),
  MapInfo(
      "4", "ot sokağı bok mahallesi üsküdar istanbul", 41.0254069, 29.0173281),
  MapInfo("5", "ümraniye çöplükö hele dudullu leş gibi yer istanbul",
      41.0254069, 29.0173281),
  MapInfo("5", "ümraniye çöplükö hele dudullu leş gibi yer istanbul",
      41.0254069, 29.0173281),
];

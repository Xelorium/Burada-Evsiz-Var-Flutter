class Homeless {
  final String uID;
  final bool isApproved;
  final String address;
  final String postOwner;
  final String date;
  final String photoId;
  final String desc;

  const Homeless(this.address, this.postOwner, this.date, this.photoId,
      this.desc, this.uID, this.isApproved);
}

const allHomelesses = [
  Homeless("Küplüce mah.", "Mehmet Okuyan", "5",
      "https://1x.com/assets/img/pro08.jpg", "Su yoktu su verdim", "1", true),
  Homeless(
      "Şemsibey 1.",
      "Mehmet Okuyan",
      "5",
      "https://ichef.bbci.co.uk/news/976/cpsprodpb/A20B/production/_123138414_1ae36bae-44c9-4277-89a0-7b41aaca2cdb.jpg",
      "Su yoktu su verdim",
      "2",
      true),
  Homeless(
      "Ümraniye çakmak.",
      "Mehmet Okuyan",
      "5",
      "https://www.resimupload.org/images/2022/08/08/74e15825-cb45-45ae-b2ee-a632cc0f05d6.jpg",
      "Doritos çiğköfte yemek istiyordu onun yerine ağzına yarrağımı verdim.",
      "3",
      true),
  Homeless("Dudullu", "Mehmet Okuyan", "5",
      "https://1x.com/assets/img/pro08.jpg", "Su yoktu su verdim", "4", true),
  Homeless("Beylerbeyi", "Mehmet Okuyan", "5",
      "https://1x.com/assets/img/pro08.jpg", "Su yoktu su verdim", "5", true),
];

const allPosts = [
  Homeless("Yooo mah.", "Mehmet Okuyan", "5",
      "https://1x.com/assets/img/pro08.jpg", "Su yoktu su verdim", "1", true),
  Homeless(
      "Şemsibey 1.",
      "Mehmet Okuyan",
      "5",
      "https://ichef.bbci.co.uk/news/976/cpsprodpb/A20B/production/_123138414_1ae36bae-44c9-4277-89a0-7b41aaca2cdb.jpg",
      "Su yoktu su verdim",
      "2",
      true),
  Homeless(
      "Ümraniye çakmak.",
      "Mehmet Okuyan",
      "5",
      "https://www.resimupload.org/images/2022/08/08/74e15825-cb45-45ae-b2ee-a632cc0f05d6.jpg",
      "Doritos çiğköfte yemek istiyordu onun yerine ağzına yarrağımı verdim.",
      "3",
      true),
  Homeless("Kooppp", "Mehmet Okuyan", "5",
      "https://1x.com/assets/img/pro08.jpg", "Su yoktu su verdim", "4", true),
  Homeless("Beylerbeyi", "Mehmet Okuyan", "5",
      "https://1x.com/assets/img/pro08.jpg", "Su yoktu su verdim", "5", true),
];

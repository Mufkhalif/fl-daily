enum TypeFruit {
  cabbage,
  carrot,
  cauliflower,
  onion,
  potato,
  pumpkin,
  paprica,
  tomato,
}

String typeToStringFruit(TypeFruit type) {
  if (type == TypeFruit.cabbage) {
    return "cabbage";
  } else if (type == TypeFruit.carrot) {
    return "carrot";
  } else if (type == TypeFruit.cauliflower) {
    return "cauliflower";
  } else if (type == TypeFruit.onion) {
    return "onion";
  } else if (type == TypeFruit.potato) {
    return "potato";
  } else if (type == TypeFruit.pumpkin) {
    return "pumpkin";
  } else if (type == TypeFruit.paprica) {
    return "paprica";
  } else if (type == TypeFruit.tomato) {
    return "tomato";
  } else {
    return "tomato";
  }
}

TypeFruit stringToTypeFruit(String type) {
  if (type == "cabbage") {
    return TypeFruit.cabbage;
  } else if (type == "carrot") {
    return TypeFruit.carrot;
  } else if (type == "cauliflower") {
    return TypeFruit.cauliflower;
  } else if (type == "onion") {
    return TypeFruit.onion;
  } else if (type == "potato") {
    return TypeFruit.potato;
  } else if (type == "pumpkin") {
    return TypeFruit.pumpkin;
  } else if (type == "paprica") {
    return TypeFruit.paprica;
  } else if (type == "tomato") {
    return TypeFruit.tomato;
  } else {
    return TypeFruit.tomato;
  }
}

class TabItem {
  final String name;
  final TypeFruit typeFruit;

  TabItem({required this.name, required this.typeFruit});
}

List<TabItem> listTabItem = [
  TabItem(
    name: "Kentang",
    typeFruit: TypeFruit.potato,
  ),
  TabItem(
    name: "Kubis",
    typeFruit: TypeFruit.cabbage,
  ),
  TabItem(
    name: "Wortel",
    typeFruit: TypeFruit.carrot,
  ),
  TabItem(
    name: "Bawang",
    typeFruit: TypeFruit.onion,
  ),
  TabItem(
    name: "Kol",
    typeFruit: TypeFruit.cauliflower,
  ),
  TabItem(
    name: "Tomat",
    typeFruit: TypeFruit.tomato,
  ),
  TabItem(
    name: "Paprika",
    typeFruit: TypeFruit.paprica,
  ),
  TabItem(
    name: "Labu",
    typeFruit: TypeFruit.pumpkin,
  ),
];

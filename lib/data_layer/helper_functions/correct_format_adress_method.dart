String? correctFormattedAdress(String? adress) {
  int index = 0;
  if (adress != null && adress.contains(',')) {
    index = adress.indexOf(',');
    adress = adress.substring(0, index);
  }

  return adress;
}

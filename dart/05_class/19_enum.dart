enum Color {red, green, blue} 
void main(List<String> args) {
  print(Color.blue.index);

  List<Color> colors = Color.values;
  print(colors[0]);
  colors.forEach((element) {print(element);});
}
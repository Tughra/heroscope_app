
main(List<String> args) {
  List<Map<String, dynamic>> json = [
    {"name":null, "price": "60\$", "isEmpty": "false"}
  ];
  List<Product> products = [];
  for (final item in json) {
    products.add(Product.fromJson(item));
  }
  print("name:" +
      products[0].name +
      "  price:" +
      products[0].price +
      "  isEmpty:" +
      products[0].isEmpty);}


class Product{
  dynamic? name;
  dynamic? price;
  dynamic? isEmpty;

  Product.fromJson(Map<String,dynamic> json){

    name=json["name"];
    price=json["price"];
    isEmpty=json["isEmpty"];

  }
}
class PopularCars {
  final String name;
  final String transmission;
  final String price;
  final String image;

  PopularCars(
      {required this.name,
      required this.transmission,
      required this.price,
      required this.image});
}

class CarCategories {
  final String image;

  CarCategories({required this.image});
}

List<PopularCars> popularcars = [
  PopularCars(
    name: "Tesla Model Y",
    transmission: "Electric",
    price: "\$450/Day",
    image: "car_1.png",
  ),
  PopularCars(
    name: "Tesla Model S",
    transmission: "Electric",
    price: "\$158/Day",
    image: "car_2.png",
  ),
  PopularCars(
    name: "Tesla Model S",
    transmission: "Electric",
    price: "\$250/Day",
    image: "car_3.png",
  ),
  PopularCars(
    name: "Tesla Model X",
    transmission: "Electric",
    price: "\$350/Day",
    image: "car_4.png",
  ),
];
List<CarCategories> carsCategories = [
  CarCategories(
    image: "tesla.png",
  ),
  CarCategories(
    image: "bmw.png",
  ),
  CarCategories(
    image: "benz.png",
  ),
  CarCategories(
    image: "audi.png",
  ),
];

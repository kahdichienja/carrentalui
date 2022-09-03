class PopularCars {
  final String name;
  final String transmission;
  final String price;
  final String image;
  final String? description;
  final String? passengers;

  PopularCars(
      {required this.name,
      required this.transmission,
      required this.price,
      this.description,
      this.passengers,
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
    passengers: "5 seater",
    description: 'Model Y is a fully electric,\nmid-size SUV with unparalleled protection and\nversatile cargo space.\nSafety is the most important part of every Tesla.\nWe design our vehicles to exceed safety standards.'
  ),
  
  PopularCars(
    name: "Tesla Model S",
    transmission: "Electric",
    price: "\$158/Day",
    image: "car_2.png",
    passengers: "7 seater",
    description: ''
  ),
  PopularCars(
    name: "Tesla Model S",
    transmission: "Electric",
    price: "\$250/Day",
    image: "car_3.png",
    passengers: "7 seater",
    description: ''
  ),
  PopularCars(
    name: "Tesla Model X",
    transmission: "Electric",
    price: "\$350/Day",
    image: "car_4.png",
    passengers: "7 seater",
    description: ''
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

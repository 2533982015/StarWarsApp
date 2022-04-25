class VehicleModel {
  VehicleModel(
      {required this.name, required this.model, required this.manufacturer});

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
      name: json['name'],
      model: json['model'],
      manufacturer: json['manufacturer']);

  final String name;
  final String model;
  final String manufacturer;

  static List<VehicleModel> vehiclesFromJsonToList(List<dynamic> jsonList) =>
      jsonList.map((v) => VehicleModel.fromJson(v)).toList();
}

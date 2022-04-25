import 'package:startwar_app/common/utils.dart';
import 'package:startwar_app/service/vehicle.model.dart';

class StarWarsService {
  Future<List<VehicleModel>> getList() async {
    final response =
        await AppUtils.sendRequest(endpoint: 'https://swapi.dev/api/vehicles');
    return VehicleModel.vehiclesFromJsonToList(response['results']);
  }

  Future<List<VehicleModel>> search(String name) async {
    final response = await AppUtils.sendRequest(
        endpoint: 'https://swapi.dev/api/vehicles?search=$name');
    return VehicleModel.vehiclesFromJsonToList(response['results']);
  }
}

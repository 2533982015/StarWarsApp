import 'package:startwar_app/common/utils.dart';
import 'package:startwar_app/service/vehicule.model.dart';

class StarWarsService {
  Future<List<VehiculeModel>> getList() async {
    final response =
        await AppUtils.sendRequest(endpoint: 'https://swapi.dev/api/vehicles');
    return VehiculeModel.vehiculesFromJsonToList(response['results']);
  }

  Future<List<VehiculeModel>> search(String name) async {
    final response = await AppUtils.sendRequest(
        endpoint: 'https://swapi.dev/api/vehicles?search=$name');
    return VehiculeModel.vehiculesFromJsonToList(response['results']);
  }
}

import 'package:hypoapp/models/tray-model.dart';

class DeviceModel {
  String deviceCode;
  int currentWaterLevel;
  int maxWaterLevel;
  int currentNSLevel;
  int maxNSLevel;
  int currentPhUpLevel;
  int maxPhUplevel;
  int currentPhDownLevel;
  int maxPhDownLevel;
  TrayModel currentTray;
  List<TrayModel> traysList;
}
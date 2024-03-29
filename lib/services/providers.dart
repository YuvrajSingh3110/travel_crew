import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:travel_crew/services/auth_state.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => AuthState(),
    lazy: false,
  )
];
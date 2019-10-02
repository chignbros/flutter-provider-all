

import 'package:provider/provider.dart';
import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/core/services/authentication_service.dart';

List<SingleChildCloneableWidget> providers=[
  ...independentProvider,
  ...dependentProvider,
  ...uiconsumeraleProvider
];

List<SingleChildCloneableWidget> independentProvider=[
  Provider.value(value: Api(),)
];
List<SingleChildCloneableWidget> dependentProvider=[
  ProxyProvider<Api,AuthenticationService>(
    builder: (context, api,authenticationService)=>AuthenticationService(api: api),
  )
];
List<SingleChildCloneableWidget> uiconsumeraleProvider=[
  StreamProvider<User>(builder: (context)=>Provider.of<AuthenticationService>(context,listen: false).user,)
];
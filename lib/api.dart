
//api_key = 5b3ce3597851110001cf6248a4a4c7faadf6468aaafe21acfdd57c87& start = 8.681495,49.41461& end = 8.687872,49.420318
import 'package:flutter/cupertino.dart';

const String baseUrl=
   "https://api.openrouteservice.org/v2/directions/driving-car?";

const String apiKey="5b3ce3597851110001cf6248a4a4c7faadf6468aaafe21acfdd57c87";

getRouteUrl(String start,String end)
{
  return Uri.parse("https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf6248a4a4c7faadf6468aaafe21acfdd57c87&start=$start&end=$end");
}





class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {




  @override

  Widget build(BuildContext context) {




    return const Placeholder();
  }
}





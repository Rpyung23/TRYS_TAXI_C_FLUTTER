import 'package:app/bloc/monitoreo_bloc/monitoreo_bloc.dart';
import 'package:app/bloc/user_bloc/user_bloc.dart';
import 'package:app/bloc/user_bloc/user_event.dart';
import 'package:app/bloc/user_bloc/user_state.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/dimens.dart';
import 'package:app/utils/icons.dart';
import 'package:app/utils/strings.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:switch_it/switch_it.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bgLocation;

class PageHome extends StatefulWidget {
  PageHome({super.key});

  bool isOnLineConductor = false;
  int itemMenuSeleccionado = 0;
  BitmapDescriptor? iconoMonitoreo;

  GoogleMapController? controllerGoogleMaps;

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-1.6676309, -78.6609226),
    zoom: 17,
  );

  Marker? oMarkerMiPosition;
  String idMarkerOrigin = 'MyPosition';
  Set<Marker> _markers = Set();

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initLoadImg();

    BlocProvider.of<UserBloc>(context, listen: false)
        .add(UserOnOffLineStateUserEvent(false));

    bgLocation.BackgroundGeolocation.stop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: colorBlack),
        title: BlocBuilder<UserBloc, UserState>(
          builder: ((context, state) {
            /*if (state.onlineConductor) {
              AssetsAudioPlayer.newPlayer().open(
                  Audio("assets/audios/notification.mp3"),
                  autoStart: true,
                  showNotification: true,
                  volume: 1000.00);
            }*/

            if (state is UserOnOffLineState) {
              return Text(
                state.isOnline ? conductorOnline : conductorOffline,
                style:
                    TextStyle(color: colorBlack, fontWeight: FontWeight.bold),
              );
            }

            return Container();
          }),
        ),
        actions: [
          /*ElevatedButton(
              onPressed: () {
                if (isOnLineConductor) {
                  isOnLineConductor = false;
                } else {
                  isOnLineConductor = true;
                }

                BlocProvider.of<UserBloc>(context, listen: false)
                    .add(UserOnOffLineStateUserEvent(isOnLineConductor));
              },
              child: Text("+")),
          */

          BlocBuilder<UserBloc, UserState>(
            builder: ((context, state) {
              if (state is UserOnOffLineState) {
                return Switch(
                    value: state.isOnline,
                    activeColor: colorSecondary,
                    inactiveThumbColor: colorBlack,
                    onChanged: (value) {
                      BlocProvider.of<UserBloc>(context, listen: false)
                          .add(UserOnOffLineStateUserEvent(value));
                    });
              }

              return Container();
            }),
          )
        ],
      ),
      drawer: _getDrawerHome(),
      body: Stack(
        children: [_getBody(), _getBlocWidget()],
      ),
    ));
  }

  _getDrawerHome() {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 210,
            child: DrawerHeader(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.all(0),
                child: Container(
                  color: colorPrimary,
                  padding: EdgeInsets.only(
                      right: marginSmallSmall, left: marginSmallSmall),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: altoSmallSmall),
                      _ProfileAvatar(),
                      SizedBox(height: altoSmallSmall),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _itemHorasOnLine(),
                          _itemHorasDistancia(),
                          _itemHorasJob()
                        ],
                      )
                    ],
                  ),
                )),
          ),
          ListTile(
            leading:
                IconHome /*Image.asset(
              "assets/drawer/home.png",
              repeat: ImageRepeat.noRepeat,
              scale: 1,
              fit: BoxFit.cover,
            )*/
            ,
            title: Text("Home", style: TextStyle(fontSize: textMedium)),
          ),
          /*ListTile(
            leading:
                IconBilletera /*Image.asset(
              "assets/drawer/wallet.png",
            )*/
            ,
            title: Text("Mi Billetera", style: TextStyle(fontSize: textMedium)),
            onTap: () {},
          ),*/
          ListTile(
            leading:
                IconHistory /*Image.asset(
              "assets/drawer/history.png",
            )*/
            ,
            title: Text("Historial", style: TextStyle(fontSize: textMedium)),
            onTap: () {
              Navigator.of(context).pushNamed("history");
            },
          ),
          ListTile(
            leading: Badge(
              elevation: 1,
              alignment: Alignment.topRight,
              badgeContent: Text(
                '+1',
                style: TextStyle(color: Colors.white, fontSize: 9),
              ),
              child: IconNotification,
            ) /*Image.asset(
              "assets/drawer/notification.png",
            )*/
            ,
            title: Text(
              "Notificaciones",
              style: TextStyle(fontSize: textMedium),
            ),
          ),
          ListTile(
            leading:
                IconConfig /*Image.asset(
              "assets/drawer/setting.png",
            )*/
            ,
            title:
                Text("Configuraciones", style: TextStyle(fontSize: textMedium)),
          ),
          ListTile(
            leading:
                IconLogOut /*Image.asset(
              "assets/drawer/logout.png",
            )*/
            ,
            title:
                Text("Cerrar Sesión", style: TextStyle(fontSize: textMedium)),
          )
        ],
      ),
    );
  }

  _getOnLine() {
    return GestureDetector(
      child: Wrap(
        children: [
          Container(
            color: Colors.green,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(marginSmallSmall),
            child: Text(
              "Tienes 10 solicitudes nuevas.",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: textBigMedium, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      onTap: () {
        Navigator.of(context).pushNamed("jobs");
      },
    );
  }

  _getOffLine() {
    return Wrap(
      children: [
        Container(
          color: colorSecondary,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(marginSmallSmall),
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  "assets/icons/offline.png",
                ),
              ),
              SizedBox(
                width: marginSmallSmall,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Estas desconectado !",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: textBigMedium),
                  ),
                  Text(
                    "Conéctese para comenzar a aceptar trabajos.",
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
    ;
  }

  _ProfileAvatar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          minRadius: 40,
          backgroundImage: AssetImage("assets/user.jpeg"),
        ),
        SizedBox(
          width: marginSmallSmall,
        ),
        Column(
          children: [
            Text(
              "Nelson Yunga",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: textBigMedium),
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              itemSize: 20,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: colorBlack,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )
          ],
        )
      ],
    );
  }

  _itemHorasOnLine() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconClock
        /*Image.asset(
          "assets/icons/hourblack.png",
          scale: 1.7,
          fit: BoxFit.cover,
          repeat: ImageRepeat.noRepeat,
        )*/
        ,
        Text(
          "10.2",
          style:
              TextStyle(fontSize: textBigMedium, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  _itemHorasDistancia() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconVelocity /*
        Image.asset(
          "assets/icons/kmblack.png",
          scale: 1.7,
          fit: BoxFit.cover,
          repeat: ImageRepeat.noRepeat,
        )*/
        ,
        Text("30 KM",
            style: TextStyle(
                fontSize: textBigMedium, fontWeight: FontWeight.bold)),
      ],
    );
  }

  _itemHorasJob() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconTickets /*
        Image.asset(
          "assets/icons/jobblack.png",
          scale: 1.7,
          fit: BoxFit.cover,
          repeat: ImageRepeat.noRepeat,
        )*/
        ,
        Text("20",
            style: TextStyle(
                fontSize: textBigMedium, fontWeight: FontWeight.bold)),
      ],
    );
  }

  _getBody() {
    return BlocBuilder<MonitoreoBloc, MonitoreoState>(
        builder: (context, state) {
      Set<Marker> _markersAuxiliar = Set();

      if (state is UpdateMonitoreoState) {
        widget.oMarkerMiPosition = Marker(
            markerId: MarkerId(widget.idMarkerOrigin),
            position: state.LatLngMonitoreo,
            rotation: state.rumboMonitoreo,
            icon: widget.iconoMonitoreo == null
                ? BitmapDescriptor.defaultMarker
                : widget.iconoMonitoreo!);

        widget._markers.add(widget.oMarkerMiPosition!);

        if (widget.controllerGoogleMaps != null) {
          widget.controllerGoogleMaps!.moveCamera(
              CameraUpdate.newLatLngZoom(state.LatLngMonitoreo, 17));
        }
      }

      return GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        markers: widget._markers,
        initialCameraPosition: widget._kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          widget.controllerGoogleMaps = controller;
        },
      );
    });
  }

  _getBlocWidget() {
    return BlocBuilder<UserBloc, UserState>(
      builder: ((context, state) {
        //Navigator.of(context).pushNamed("gps"
        if (state is UserOnOffLineState) {
          if (state.isOnline) {
            _initLocationBackground();
            return _getOnLine();
          }
        }

        bgLocation.BackgroundGeolocation.stop();
        //widget._markers.clear();
        return _getOffLine();
      }),
    );
  }

  _initLocationBackground() {
    ////
    // 1.  Listen to events (See docs for all 12 available events).
    //

    // Fired whenever a location is recorded
    bgLocation.BackgroundGeolocation.onLocation((bgLocation.Location location) {
      //print('[location] - $location');

      BlocProvider.of<MonitoreoBloc>(context, listen: false).add(
          UpdateMonitoreoEvent(
              LatLng(location.coords.latitude, location.coords.longitude),
              (location.coords.heading)));

      /*_initMyPosition(
          LatLng(location.coords.latitude, location.coords.longitude));*/
    });

    // Fired whenever the plugin changes motion-state (stationary->moving and vice-versa)
    bgLocation.BackgroundGeolocation.onMotionChange(
        (bgLocation.Location location) {
      print('[motionchange] - $location');
    });

    // Fired whenever the state of location-services changes.  Always fired at boot
    bgLocation.BackgroundGeolocation.onProviderChange(
        (bgLocation.ProviderChangeEvent event) {
      print('[providerchange] - $event');
    });

    ////
    // 2.  Configure the plugin
    //
    bgLocation.BackgroundGeolocation.ready(bgLocation.Config(
            desiredAccuracy: bgLocation.Config.DESIRED_ACCURACY_HIGH,
            distanceFilter: 5.0,
            stopOnTerminate: false,
            startOnBoot: true,
            debug: false,
            logLevel: bgLocation.Config.LOG_LEVEL_VERBOSE))
        .then((bgLocation.State state) {
      if (!state.enabled) {
        ////
        // 3.  Start the plugin.
        //
        bgLocation.BackgroundGeolocation.start();
      }
    });
  }

  initLoadImg() async {
    widget.iconoMonitoreo = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.2), "assets/self_location.png");
  }
}

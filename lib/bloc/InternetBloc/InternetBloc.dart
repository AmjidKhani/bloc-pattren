import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'InternetEvent.dart';
import 'InternetState.dart';
class InternetBloc extends Bloc<InternetEvent,InternetState>{
  Connectivity _connectivity=Connectivity();
  InternetBloc():super(InternetInitialState())
  {
    on<InternetLostEvent>((event, emit) => {
      emit(InternetLostState())
    });
    on<InternetGainedEvent>((event, emit) => {
      emit(InternetGainedState())
    });
    _connectivity.onConnectivityChanged.listen((event) { 
      if (event==ConnectivityResult.wifi||event==ConnectivityResult.mobile) {
        return add(InternetGainedEvent());
      }  else{
        return add(InternetLostEvent());
      }
    }
    );
  }

  }


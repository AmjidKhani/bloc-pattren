import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internete/bloc/InternetBloc/InternetBloc.dart';
import 'package:internete/bloc/InternetBloc/InternetState.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home page')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          BlocBuilder<InternetBloc,InternetState>(

              builder: (BuildContext context, state) {
                if (state is InternetGainedState) {
return
  const Center(child: Text("Connected!"));
                }
                else if (state is InternetLostState) {
                  return const Center(child: Text(" Not Connected!"));
                }
                else{
                  return  const Center(child: Text("Loading...."));
                }


              },



          )
        ],
      ),
    );
  }
}

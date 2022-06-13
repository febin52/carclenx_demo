import 'package:carclenx_demo/bloc/addproductsbloc/addproductsbloc.dart';
import 'package:carclenx_demo/bloc/addproductsbloc/addproductsevent.dart';
import 'package:carclenx_demo/bloc/addproductsbloc/addproductstate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectBrands extends StatefulWidget {
  const SelectBrands({Key? key}) : super(key: key);

  @override
  State<SelectBrands> createState() => _SelectBrandsState();
}

class _SelectBrandsState extends State<SelectBrands> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetMakeBloc>(context).add(GetMake());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brands"),
      ),
      body: BlocBuilder<GetMakeBloc, MakeState>(builder: (context, state) {
        if (state is MakeSuccess) {
          return ListView.builder(
            itemCount: state.makesListModel!.resultData!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(onTap: (){
                Map data = {
                      "id":state.makesListModel!.resultData![index].id! ,
                      "name": state.makesListModel!.resultData![index].name,
                      
                    };

                    Navigator.of(context).pop(data);
              },
                  title: Text(state.makesListModel!.resultData![index].name!));
            },
          );
        } else if (state is MakeError) {
          return Center(
            child: Column(
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.redAccent,
                ),
                Text(state.error!)
              ],
            ),
          );
        } else {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
      }),
    );
  }
}

import 'package:carclenx_demo/bloc/fetchproductsbloc/fetchproductsbloc.dart';
import 'package:carclenx_demo/bloc/fetchproductsbloc/fetchproductsevent.dart';
import 'package:carclenx_demo/bloc/fetchproductsbloc/fetchproductstate.dart';
import 'package:carclenx_demo/products/addproduct.dart';
import 'package:carclenx_demo/utilities/appsizes.dart';
import 'package:carclenx_demo/widgets/container.dart';
import 'package:carclenx_demo/widgets/modal_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDashBoard extends StatefulWidget {
  const HomeDashBoard({Key? key}) : super(key: key);

  @override
  State<HomeDashBoard> createState() => _HomeDashBoardState();
}

class _HomeDashBoardState extends State<HomeDashBoard> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetProductsBloc>(context).add(GetProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black87,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const AddProducts())));
          },
          child: const Icon(
            Icons.add,
            color: Color(0xffFFCC00),
          ),
        ),
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                    icon: const Icon(
                      CupertinoIcons.settings_solid,
                      size: 25,
                    ),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return HelperComponent().showModal(context);
                        },
                      );
                    }))
          ],
        ),
        body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(14.0),
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Text("Hello Vendor",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'Kumbh',
                      )),
                ],
              ),
              SizedBox(
                height: AppSize.height(context) / 26,
              ),
              Wrap(
                spacing: 5.0,
                alignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CommonContainer.commonContainer(
                      context,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            CupertinoIcons.search,
                            color: Color(0xffFFCC00),
                            size: 35,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Analysis',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'Kumbh',
                              ))
                        ],
                      ),
                      2.2,
                      8.0,
                      Colors.black),
                  CommonContainer.commonContainer(
                      context,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            CupertinoIcons.star,
                            color: Color(0xffFFCC00),
                            size: 35,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Ratings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'Kumbh',
                              ))
                        ],
                      ),
                      2.2,
                      8.0,
                      Colors.black),
                ],
              ),
              SizedBox(
                height: AppSize.height(context) / 26,
              ),
              Row(
                children: const <Widget>[
                  Text("Products",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Kumbh',
                      )),
                ],
              ),
              BlocBuilder<GetProductsBloc, ProductsState>(
                  builder: (context, state) {
                if (state is ProductsSuccess) {
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 0,
                        endIndent: 0,
                        indent: 0,
                        color: Colors.black45,
                        thickness: 1,
                      );
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.productsListModel!.resultData!.length,
                    itemBuilder: ((context, index) {
                      return CommonContainer.commonContainer(
                          context,
                          Row(
                            children: [
                              SizedBox(
                                  height: AppSize.height(context) / 8,
                                  width: AppSize.height(context) / 12,
                                  child: state.productsListModel!
                                          .resultData![index].imageURL!.isEmpty
                                      ? const Icon(Icons.broken_image)
                                      : Image.network(
                                          state.productsListModel!
                                              .resultData![index].imageURL![0],
                                          fit: BoxFit.cover,
                                          // width: AppSize.width(context) / 26,
                                          height: AppSize.height(context) / 8,
                                        )),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      state.productsListModel!
                                          .resultData![index].name!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Kumbh',
                                      )),
                                  const SizedBox(height: 10),
                                  Text(
                                      'Rs ${state.productsListModel!.resultData![index].offerPrice!} ',
                                      style: TextStyle(
                                        color: Colors.green.shade400,
                                        fontSize: 15,
                                        fontFamily: 'Kumbh',
                                      )),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(Icons.edit),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.delete),
                                ],
                              ),
                            ],
                          ),
                          2.2,
                          8.0,
                          Colors.white);
                    }),
                  );
                } else if (state is ProductsError) {
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
              })
            ]));
  }
}

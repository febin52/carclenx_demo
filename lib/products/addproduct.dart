import 'package:carclenx_demo/products/selectbrand.dart';
import 'package:carclenx_demo/utilities/appsizes.dart';

import 'package:carclenx_demo/widgets/textfield.dart';
import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  String? dropdownValue, brandVal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(14.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          height: AppSize.height(context) / 12,
          child: SizedBox(
            width: AppSize.width(context),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green[400])),
              child: const Text(
                "Submit",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text("Enter Product Details"),
        ),
        body: Form(
          child: ListView(
            //   itemExtent: 80.0,
            // padding: const EdgeInsets.all(14.0),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldWidget.commonField(context, "Product Name"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    TextFieldWidget.commonField(context, "Original Price/MRP"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldWidget.commonField(context, "Offer Price"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldWidget.commonField(context, "In Stock Count"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldWidget.commonField(context, "Description"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Brand"),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Container(
                            height: 60,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border:
                                    Border.all(width: 1.0, color: Colors.grey)),
                            width: AppSize.width(context) / 2.25,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () async {
                                    Map data = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SelectBrands()));
                                    brandVal = data['name'];
                                  },
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      brandVal != null
                                          ? brandVal!
                                          : "--Select--",
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.black54),
                                    ),
                                  )),
                            )),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Model"),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border:
                                  Border.all(width: 1.0, color: Colors.grey)),
                          width: AppSize.width(context) / 2.25,
                          child: DropdownButton<String>(
                            icon: const SizedBox.shrink(),
                            underline: const DropdownButtonHideUnderline(
                                child: SizedBox.shrink()),
                            hint: const Text("--Select--"),
                            value: dropdownValue,
                            elevation: 16,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['One', 'Two', 'Free', 'Four']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Category"),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border:
                                  Border.all(width: 1.0, color: Colors.grey)),
                          width: AppSize.width(context) / 2.25,
                          child: DropdownButton<String>(
                            icon: const SizedBox.shrink(),
                            underline: const DropdownButtonHideUnderline(
                                child: SizedBox.shrink()),
                            hint: const Text("--Select--"),
                            alignment: Alignment.center,
                            value: dropdownValue,
                            elevation: 16,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['One', 'Two', 'Free', 'Four']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Sub-Category"),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border:
                                  Border.all(width: 1.0, color: Colors.grey)),
                          width: AppSize.width(context) / 2.25,
                          child: DropdownButton<String>(
                            icon: const SizedBox.shrink(),
                            underline: const DropdownButtonHideUnderline(
                                child: SizedBox.shrink()),
                            hint: const Text("--Select--"),
                            alignment: Alignment.center,
                            value: dropdownValue,
                            elevation: 16,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['One', 'Two', 'Free', 'Four']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldWidget.commonField(context, "In Stock Count"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldWidget.commonField(context, "Description"),
              ),
            ],
          ),
        ));
  }
}

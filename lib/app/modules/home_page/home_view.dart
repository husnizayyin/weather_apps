import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_apps/app/core/value/colors.dart';
import 'package:weather_apps/app/widgets/base_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = [
    'Jawa Barat',
    'Jawa Tengah',
    'Jawa Timur',
  ];

  String? selectedValue;
  String? selectedKotaJabar;
  String? selectedKotaJateng;
  String? selectedKotaJatim;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          ),
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }

  final namaController = TextEditingController();
  final provController = TextEditingController();
  final kotaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: baseColor,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    label: Text('Nama Lengkap'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Isi Nama Lengkap';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField2(
                  isExpanded: true,
                  decoration:
                      const InputDecoration(label: Text('Pilih Provinsi')),
                  value: selectedValue,
                  items: <String>['Jawa Barat', 'Jawa Tengah', 'Jawa Timur']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      provController.text = selectedValue!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      selectedValue = value as String;
                      provController.text = selectedValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih Provinsi';
                    }

                    return null;
                  },
                  dropdownMaxHeight: 200,
                  buttonWidth: Get.width,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
                const SizedBox(height: 10),
                if (selectedValue == 'Jawa Barat')
                  DropdownButtonFormField2(
                    isExpanded: true,
                    decoration:
                        const InputDecoration(label: Text('Pilih Kota')),
                    value: selectedKotaJabar,
                    items: <String>[
                      'Bandung',
                      'Kab. Tasikmalaya',
                      'Kab. Bandung'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedKotaJabar = value as String;
                        kotaController.text = selectedKotaJabar!;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        selectedKotaJabar = value as String;
                        kotaController.text = selectedKotaJabar!;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Pilih Kota';
                      }

                      return null;
                    },
                    dropdownMaxHeight: 200,
                    buttonWidth: Get.width,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                if (selectedValue == 'Jawa Tengah')
                  DropdownButtonFormField2(
                    isExpanded: true,
                    decoration:
                        const InputDecoration(label: Text('Pilih Kota')),
                    value: selectedKotaJateng,
                    items: <String>[
                      'Semarang',
                      'Solo',
                      'Purwokerto'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedKotaJateng = value as String;
                        kotaController.text = selectedKotaJateng!;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        selectedKotaJateng = value as String;
                        kotaController.text = selectedKotaJateng!;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Pilih Kota';
                      }

                      return null;
                    },
                    dropdownMaxHeight: 200,
                    buttonWidth: Get.width,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                if (selectedValue == 'Jawa Timur')
                  DropdownButtonFormField2(
                    isExpanded: true,
                    decoration:
                        const InputDecoration(label: Text('Pilih Kota')),
                    value: selectedKotaJatim,
                    items: <String>[
                      'Surabaya',
                      'Malang',
                      'Ponorogo'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedKotaJatim = value as String;
                        kotaController.text = selectedKotaJatim!;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        selectedKotaJatim = value as String;
                        kotaController.text = selectedKotaJatim!;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Pilih Kota';
                      }

                      return null;
                    },
                    dropdownMaxHeight: 200,
                    buttonWidth: Get.width,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                const SizedBox(height: 50),
                SizedBox(
                  width: Get.width,
                  child: BaseButton(
                    buttonText: 'Submit',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // Get.to(
                        //   DetailWeather2(
                        //     nama: namaController.text,
                        //     kota: kotaController.text,
                        //     provinsi: provController.text,
                        //   ),
                        // );
                        Get.toNamed('/detail', arguments: [namaController.text, kotaController.text, provController.text]);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

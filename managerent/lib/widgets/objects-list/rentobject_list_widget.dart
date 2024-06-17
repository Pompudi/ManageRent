import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:managerent/models/rentobject_model.dart';
import 'package:managerent/router/router.dart';
import 'package:managerent/widgets/objects-list/rentobject_button.dart';


class RentObjectListWidget extends StatelessWidget {
  final List<RentObjectModel> rentObjects;

  final Function onEditPressed;

  const RentObjectListWidget({
        Key? key,
        required this.rentObjects,
        required this.onEditPressed,
  }) : super(key: key);

  void _handleEditPressed(RentObjectModel object) {
    onEditPressed(object);
  }

  @override
  Widget build(BuildContext context) {
    rentObjects.sort((a, b) {
      if (a.status == 'occupied' && b.status != 'occupied') {
        return -1;
      } else if (a.status != 'occupied' && b.status == 'occupied') {
        return 1;
      } else {
        return a.name.compareTo(b.name);
      }
    });

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: rentObjects.length,
            itemBuilder: (context, index) {
              final object = rentObjects[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RentObjectButton(
                    status: rentObjects[index].status,
                    name: rentObjects[index].name,
                    object: object,
                    function: (){AutoRouter.of(context).push(RentObjectPageRoute(rentObject: object));},
                    showEditImage: true,
                    onEditPressed: () => _handleEditPressed(object) ,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

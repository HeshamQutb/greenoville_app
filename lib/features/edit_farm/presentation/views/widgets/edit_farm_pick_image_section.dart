import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/default_text_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../create_farm/data/models/farm_model.dart';
import '../../view_model/edit_farm_cubit/edit_farm_cubit.dart';

class EditFarmPickImageSection extends StatelessWidget {
  const EditFarmPickImageSection({
    super.key,
    required this.editFarmCubit,
    required this.farm,
  });
  final FarmModel farm;
  final EditFarmCubit editFarmCubit;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: editFarmCubit.farmImage != null ? 190 : 140,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (editFarmCubit.farmImage != null)
                      ListTile(
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -2),
                        leading: const Icon(Icons.no_photography),
                        title: Text(S.of(context).removeImage),
                        onTap: () {
                          editFarmCubit.removeFarmImage();
                          Navigator.pop(context);
                        },
                      ),
                    if (editFarmCubit.farmImage != null)
                      const Divider(
                        height: 1.0,
                      ),
                    ListTile(
                      visualDensity: const VisualDensity(
                        horizontal: 0,
                        vertical: -2,
                      ),
                      leading: const Icon(Icons.camera_alt),
                      title: Text(S.of(context).takePhoto),
                      onTap: () {
                        editFarmCubit.getFarmImage(
                          source: ImageSource.camera,
                          context: context,
                        );
                        Navigator.pop(context);
                      },
                    ),
                    const Divider(
                      height: 1.0,
                    ),
                    ListTile(
                      visualDensity: const VisualDensity(
                        horizontal: 0,
                        vertical: -4,
                      ),
                      leading: const Icon(Icons.image),
                      title: Text(S.of(context).chooseFromGallery),
                      onTap: () {
                        editFarmCubit.getFarmImage(
                          source: ImageSource.gallery,
                          context: context,
                        );
                        Navigator.pop(context);
                      },
                    ),
                    const Divider(
                      height: 1.0,
                    ),
                    DefaultTextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: S.of(context).cancel,
                      size: 15,
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 60,
              backgroundImage: editFarmCubit.farmImage == null
                  ? CachedNetworkImageProvider(farm.farmImage!)
                  : FileImage(editFarmCubit.farmImage!) as ImageProvider,
            ),
            const CircleAvatar(
              backgroundColor: Colors.green,
              radius: 13,
              child: Icon(
                Icons.add,
                size: 24,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

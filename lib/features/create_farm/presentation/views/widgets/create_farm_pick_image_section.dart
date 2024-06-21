import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/default_text_button.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/add_farm_cubit/create_farm_cubit.dart';

class CreateFarmPickImageSection extends StatelessWidget {
  const CreateFarmPickImageSection({
    super.key,
    required this.createFarmCubit,
  });
  final CreateFarmCubit createFarmCubit;
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
                height: createFarmCubit.farmImage != null ? 190 : 140,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (createFarmCubit.farmImage != null)
                      ListTile(
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -2),
                        leading: const Icon(Icons.no_photography),
                        title: Text(S.of(context).removeImage),
                        onTap: () {
                          createFarmCubit.removeFarmImage();
                          Navigator.pop(context);
                        },
                      ),
                    if (createFarmCubit.farmImage != null)
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
                        createFarmCubit.getFarmImage(
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
                        createFarmCubit.getFarmImage(
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
              backgroundImage: createFarmCubit.farmImage == null
                  ? const AssetImage(AssetsData.unknownUser)
                  : FileImage(createFarmCubit.farmImage!) as ImageProvider,
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

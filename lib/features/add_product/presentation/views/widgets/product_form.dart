import 'dart:io';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/widgets/default_text_form_field.dart';
import 'package:greenoville_app/generated/l10n.dart';
import 'product_image_section.dart';
import 'product_quantity_section.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.priceController,
    required this.descriptionController,
    this.image,
    required this.quantity,
    required this.onImageSelected,
    required this.onQuantityChanged,
    this.onRemove,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final File? image;
  final int quantity;
  final Function(File?) onImageSelected;
  final Function(int) onQuantityChanged;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).productImage),
              const SizedBox(height: 8),
              ProductImageSection(
                image: image,
                onImageSelected: onImageSelected,
              ),
              const SizedBox(height: 16),
              DefaultTextFormField(
                type: TextInputType.text,
                controller: nameController,
                label: S.of(context).productName,
                validate: (value) => value == null || value.isEmpty
                    ? S.of(context).pleaseEnterProductName
                    : null,
              ),
              const SizedBox(height: 16),
              DefaultTextFormField(
                controller: descriptionController,
                label: S.of(context).productDescription,
                validate: (value) => null,
                maxLines: 4,
                helperText: '(${S.of(context).optional})*',
                type: TextInputType.text,
              ),
              const SizedBox(height: 24),
              DefaultTextFormField(
                controller: priceController,
                label: S.of(context).productPrice,
                validate: (value) => value == null || value.isEmpty
                    ? S.of(context).pleaseEnterProductPrice
                    : null,
                prefixIcon: Icons.attach_money,
                type: TextInputType.number,
              ),
              const SizedBox(height: 8),
              QuantitySection(
                quantity: quantity,
                onQuantityChanged: onQuantityChanged,
              ),
              if (onRemove != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: onRemove,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

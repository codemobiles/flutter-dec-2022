part of 'management_bloc.dart';

abstract class ManagementEvent extends Equatable {
  const ManagementEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ManagementEvent_Submit extends ManagementEvent {
  final Product? product;
  final File? image;
  final bool? isEditMode;
  final GlobalKey<FormState>? form;

  ManagementEvent_Submit({
    this.product,
    this.image,
    this.isEditMode,
    this.form,
  });
}

class ManagementEvent_Delete extends ManagementEvent {
  final int productId;
  ManagementEvent_Delete(this.productId);

}

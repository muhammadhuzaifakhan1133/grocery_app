import 'package:flutter/material.dart';
import 'package:grocery_app/ui/profile/profile/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ProfileViewModel>();
    return ListView.builder(
      itemCount: viewModel.options.length,
      itemBuilder: (context, index) {
        final option = viewModel.options[index];
        return ListTile(
          onTap:() {
            viewModel.onOptionTapped(index, context);
          },
          leading: Image.asset(option.icon),
          title: Text(option.title),
          trailing:
              index == viewModel.options.length - 1
                  ? null
                  : Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }
}


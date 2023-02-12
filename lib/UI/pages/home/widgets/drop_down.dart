import 'package:assignment/UI/pages/home/bloc/category/category_bloc.dart';
import 'package:assignment/UI/pages/home/bloc/category/category_events.dart';
import 'package:assignment/UI/pages/home/bloc/category/category_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({Key? key}) : super(key: key);

  @override
  State<CategoryDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    var catBloc = context.read<CategoryBloc>();
    return BlocBuilder<CategoryBloc, CategoryStates>(
      builder: (context, states) {
        if (states is CategoryLoaded){
          catBloc.add(const CategoryChange(''));
          context.loaderOverlay.hide();
        }

        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          height: 50,
          child: DropdownButton(
            icon: const Icon(Icons.arrow_downward),
            isExpanded: true,
            value: _selectedValue,
            underline: Container(
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
            menuMaxHeight: 300,
            items: catBloc.categories.map((category) => DropdownMenuItem(
                value: category,
                child: Text(category)
            )).toList(),
            onChanged: (String? value) {
              catBloc.add(CategoryChange(value ?? ''));
              setState(() {
                _selectedValue = value;
              });
            }
          ),
        );
      }
    );
  }
}

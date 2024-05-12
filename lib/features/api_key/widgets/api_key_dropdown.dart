import 'package:admin/components/custom_dropdown_field.dart';
import 'package:admin/features/api_key/bloc/api_key_bloc.dart';
import 'package:admin/repositories/api_key/api_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiKeyDropdown extends StatefulWidget {
  final Function onChanged;
  const ApiKeyDropdown({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ApiKeyDropdown> createState() => _ApiKeyDropdownState();
}

class _ApiKeyDropdownState extends State<ApiKeyDropdown> {
  ApiKeyEntity? selectedApiKey;

  @override
  void initState() {
    context.read<ApiKeyBloc>().add(LoadApiKeysList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ApiKeyBloc, ApiKeyState>(
        builder: (context, state) {
          if (state is ApiKeyLoaded) {
            return CustomDropdown<ApiKeyEntity>(
              hintText: "Выберите API ключ",
              currentValue: selectedApiKey,
              items: state.apiKeysList,
              getLabel: (apiKey) => apiKey
                  .name, // Предполагая, что у ApiKeyEntity есть свойство name
              onChanged: (newValue) {
                setState(() {
                  selectedApiKey = newValue;
                });
                if (newValue != null) {
                  widget.onChanged();
                }
                // Вы можете добавить вызов другого Bloc или метода для передачи выбранного ключа
              },
            );
          } else if (state is ApiKeyLoading) {
            return CircularProgressIndicator();
          } else {
            return Text("Не удалось загрузить ключи API");
          }
        },
      ),
    );
  }
}

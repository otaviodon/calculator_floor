import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/calculator_controller.dart';
import 'package:flutter_application_1/core/constants.dart';
import 'package:flutter_application_1/widgets/header_text.dart';
import 'package:flutter_application_1/widgets/number_input_field.dart';
import 'package:flutter_application_1/widgets/primary_button.dart';
import 'package:flutter_application_1/widgets/result_dialog.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: _buildForm()),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: EdgeInsets.all(kPadding),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              HeaderText(label: kRoomHeader),
              SizedBox(height: kSmallSpace),
              NumberInputField(
                  label: '$kWidth ($kMeters)',
                  onSaved: _controller.setRoomWidth),
              SizedBox(height: kSmallSpace),
              NumberInputField(
                  label: '$kLength ($kMeters)',
                  onSaved: _controller.setRoomLength),
              SizedBox(height: kSpace),
              HeaderText(label: kFloorHeader),
              SizedBox(height: kSmallSpace),
              NumberInputField(
                  label: '$kWidth ($kMeters)',
                  onSaved: _controller.setFloorWidth),
              SizedBox(height: kSmallSpace),
              NumberInputField(
                  label: '$kLength ($kMeters)',
                  onSaved: _controller.setFloorLength),
              SizedBox(height: kSmallSpace),
              NumberInputField(
                  label: '$kPrice', onSaved: _controller.setPricePiece),
              SizedBox(height: kSmallSpace),
              PrimaryButton(label: kCalculate, onPressed: _onCalculate),
              SizedBox(height: kSmallSpace),
              PrimaryButton(label: kClean, onPressed: _onClean),
            ],
          )),
    );
  }

  void _onCalculate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //calcular os dados do piso
      final result = _controller.calculate();
      ResultDialog.show(context, result);
    }
  }

  void _onClean() {
    _formKey.currentState.reset();
  }
}

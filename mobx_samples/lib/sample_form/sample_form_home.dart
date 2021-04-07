import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_samples/sample_form/stores/sample_form_store.dart';

// Form -> Create a Statefull Widget!
class SampleFormHome extends StatefulWidget {

  @override
  _SampleFormHomeState createState() => _SampleFormHomeState();
}

class _SampleFormHomeState extends State<SampleFormHome> {

  // Pay attention on how we use the MobX store values
  final SampleFormStore _sampleFormStore = SampleFormStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário com MobX'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Observer(
                builder: (_) => TextField(
                  onChanged: _sampleFormStore.setName,
                  decoration: InputDecoration(
                    enabled: !_sampleFormStore.isLoading,
                    errorText: _sampleFormStore.nameError,
                    isDense: true, // Reduce the field size
                    border: OutlineInputBorder(),
                    labelText: 'Nome'
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Observer(
                builder: (_) => TextField(
                  onChanged: _sampleFormStore.setEmail,
                  decoration: InputDecoration(
                      enabled: !_sampleFormStore.isLoading,
                      errorText: _sampleFormStore.emailError,
                      isDense: true, // Reduce the field size
                      border: OutlineInputBorder(),
                      labelText: 'E-Mail'
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              SizedBox(height: 20,),

              Observer(
                builder: (_) => ElevatedButton(
                  onPressed: _sampleFormStore.getSubmitFunction,
                  child: _sampleFormStore.isLoading ?
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                    )
                    : Text('Submit')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

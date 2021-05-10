import 'package:flutter/material.dart';

class BinaryLogicSelectHome extends StatefulWidget {
  @override
  _BinaryLogicSelectHomeState createState() => _BinaryLogicSelectHomeState();
}

class _BinaryLogicSelectHomeState extends State<BinaryLogicSelectHome> {

  // Here, we declare the types.
  static const SPORT_TYPE_SOCCER       = 1 << 0;
  static const SPORT_TYPE_BASKETBALL   = 1 << 1;
  static const SPORT_TYPE_TABLE_TENNIS = 1 << 2;
  static const SPORT_TYPE_VOLLEYBALL   = 1 << 3;

  // This variable store the sport types
  int sportType = 0;

  // Functions to edit types
  void unsetAllSportTypes() => setState((){
    sportType = 0;
  });
  void setSportType(int type) => setState((){
    sportType = sportType | type;
  });
  void resetSportType(int type) => setState((){
    sportType = sportType & ~type;
  });
  bool isTypeSet(int type) => sportType & type != 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionando Elementos'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            runSpacing: 10.0,
            spacing: 10,
            alignment: WrapAlignment.center,
            children: [
              _renderOption(
                  title: 'Futebol',
                  type: SPORT_TYPE_SOCCER,
                  isActive: isTypeSet(SPORT_TYPE_SOCCER)
              ),
              _renderOption(
                  title: 'Basquete',
                  type: SPORT_TYPE_BASKETBALL,
                  isActive: isTypeSet(SPORT_TYPE_BASKETBALL)
              ),
              _renderOption(
                  title: 'Tênis De Mesa',
                  type: SPORT_TYPE_TABLE_TENNIS,
                  isActive: isTypeSet(SPORT_TYPE_TABLE_TENNIS)
              ),
              _renderOption(
                  title: 'Vôlei',
                  type: SPORT_TYPE_VOLLEYBALL,
                  isActive: isTypeSet(SPORT_TYPE_VOLLEYBALL)
              ),
            ],
          ),

          SizedBox(height: 20,),

          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: unsetAllSportTypes,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.undo),
                    Text(
                      '  Reset'
                    )
                  ],
                ),
              ),

              SizedBox(width: 40,),
            ],
          )
        ],
      ),
    );
  }

  Widget _renderOption({@required String title, @required int type, @required bool isActive}){
    return GestureDetector(
      onTap: (){
        setState(() {
          if(isActive)
            return resetSportType(type);
          setSportType(type);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: isActive ? Colors.blue : Colors.grey,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? Icons.check : Icons.close,
              color: Colors.white,
            ),
            SizedBox(width: 10,),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14
              ),
            ),
          ],
        ),
      ),
    );
  }
}

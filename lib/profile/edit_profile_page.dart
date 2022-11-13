import 'package:flutter/material.dart';
import 'package:Patient_App/profile/user.dart';
import 'package:Patient_App/profile/user_preferences.dart';
import 'package:Patient_App/profile/widget/appbar_widget.dart';
import 'package:Patient_App/profile/widget/profilepicture_widget.dart';
import 'package:Patient_App/profile/widget/save_confirmation.dart';
import 'package:Patient_App/profile/widget/textfield_widget.dart';

import '../server/ProfileData.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool tappedYes = false;
  final _formKey = GlobalKey<FormState>();

  List? userList;
  late List<String> editable;
  Future DBLoad() async{
    userList = await ProfileData.reconnect("P1001");
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
        future: DBLoad(),
        builder: (context, snapshot){
          if(userList != null){
            editable = ["","","","","",""];
            return Scaffold(
              appBar: buildAppBar(context),
              body:ListView(
                padding: EdgeInsets.symmetric(horizontal: 32),
                physics: BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 24),
                  ProfilePictureWidget(
                    imagePath: userList![0]["Image"],
                    isEdit: true,
                    onClicked: () async {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    key: _formKey,
                    label: 'Full Name',
                    text: userList![0]["Name"],
                    onChanged: (name) {
                      editable[0] = name;
                      editable[1] = userList![0]["Name"];
                      print("value found : $name");
                      //name = user.Name;
                      //print(name);
                    },
                  ),

                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Email',
                    text: userList![0]["Email"],
                    onChanged: (email) {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Weight',
                    text: userList![0]["Weight"].toString(),
                    onChanged: (weight) {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Age',
                    text: userList![0]["Age"].toString(),
                    onChanged: (weight) {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Gender',
                    text: userList![0]["Gender"],
                    onChanged: (gender) {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Fitbit Token',
                    text: userList![0]["Token"],
                    onChanged: (fitbitToken) {},
                  ),

                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: ()async {
                      final action = await SaveConfirmation.yesCancelDialog(context, 'Save Changes', 'Do you want to proceed with saving changes?');
                      if(action == DialogsAction.yes) {
                        //if(_formKey.currentState.)
                        print("return value check");
                        print(_formKey);
                        print("return value check also");
                        print(editable[1]);
                        setState(() => tappedYes = true);
                      } else {
                        setState(() => tappedYes = false);
                      }
                    },
                    child: Center(
                      child: Text('Save',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            );
          }
          else{
            return const Scaffold(
                body:Center(child: CircularProgressIndicator())
            );//
          }
        }
    );
  }



}
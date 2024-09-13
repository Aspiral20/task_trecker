import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:task_trecker/router/router.gr.dart';
import 'package:task_trecker/utils/finals/global/form.dart';
import 'package:task_trecker/utils/finals/global/styles.dart';
import 'package:task_trecker/utils/finals/images.dart';

@RoutePage()
class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        leading: IconButton(
            onPressed: () {
              context.navigateTo(ProfileRoute());
            },
            icon: Icon(LineAwesomeIcons.angle_left_solid)),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(pageDefaultSize),
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Image(image: AssetImage(defaultProfileImage)),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: theme.primaryColor),
                          child: const Icon(
                            LineAwesomeIcons.pencil_alt_solid,
                            size: 35 / 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text(userFormLabelFields['fullName']['label']),
                        icon: Icon(userFormLabelFields['fullName']['icon'])),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text(userFormLabelFields['email']['label']),
                        icon: Icon(userFormLabelFields['email']['icon'])),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text(userFormLabelFields['phone']['label']),
                        icon: Icon(userFormLabelFields['phone']['icon'])),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text(userFormLabelFields['password']['label']),
                        icon: Icon(userFormLabelFields['password']['icon'])),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          // context.navigateTo(EditRoute());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor),
                        child: Text('Save')),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text.rich(TextSpan(
                          text: 'Joined 29 August 2024',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold))),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent.withOpacity(0.1),
                            elevation: 0,
                            foregroundColor: Colors.red,
                            shape: const StadiumBorder(),
                            side: BorderSide.none,
                          ),
                          child: const Text('Delete'))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

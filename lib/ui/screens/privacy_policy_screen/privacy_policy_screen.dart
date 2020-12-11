import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:iCovid/core/helpers/responsiver.dart';
import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';
import 'package:iCovid/ui/shared/ic_buttons.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final String bodyText = '''
In using the iCOVID mobile application, you, the user, are agreeing to the following terms and conditions. We collect information entered by users anonymously to provide the features in the application. Only you, the user, can access or identify your own data. No sensor data is recorded or used by the application. The iCOVID application is hosted through Vultr.com where anonymous information is stored and processed. Any collected information is transmitted through secure HTTPS channels using LetsEncrypt encryption provided by Certbot. The following sections describe privacy details regarding each component of the application that stores information remotely.

1 - Account Information:
By signing up to use our application online services, a user submits a unique e-mail and password pair. This information is stored securely on the Vultr cloud server. This information is only used as a method for login authentication and to notify the user of privacy policy updates.

2 - Data Synchronization:
The application stores co-morbidity, lifestyle, travel, demographic, and social distancing information. Information collected is limited to information that the user explicitly provides by operating the application. The primary use of this information is to provide data synchronization services between multiple mobile devices. This information is stored securely. The information is available only to the user and no other users may access this information. Although the information is secure, we advise you to never submit sensitive information using the application.

3 - Machine Learning:
The application uses machine learning techniques to provide useful predictions for the user by using co-morbidity, lifestyle, travel, demographic, and social distancing information. Machine learning is performed on the Vultr cloud server. All data is anonymized and aggregated before performing machine learning. The user’s prediction data will never be available to others during or after this process.
  
  ''';

  @override
  Widget build(BuildContext context) {
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);
    Responsiver responsiver = Responsiver(context: context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: responsiver.generalPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("iCOVID",
                      style: kheadline4.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 29,
                          color: kBlue)),
                  Container(
                    height: responsiver.privacyContainerHeight,
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: responsiver.mediumVertical,
                        ),
                        Text("Privacy Policy",
                            style: kheadline3.copyWith(color: kBlue)),
                        SizedBox(
                          height: responsiver.smallVertical,
                        ),
                        Text(bodyText,
                            style: kBodyText2.copyWith(
                                fontSize: 14, color: kBlue)),
                      ],
                    )),
                  ),
                  buildButtons(context, model),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Row buildButtons(BuildContext context, QuizViewmodel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
            child: ICSecondaryButton(
          onPressed: () {
            showDialog(context: context, builder: (_) => buildDialog(context));
          },
          text: "Decline",
        )),
        Flexible(
            child: ICMainButton(
                onPressed: () async {
                  final snackbar = SnackBar(
                      content: Text(
                          "Something wrong happened. Please, try again later."));

                  User _user = await model.signInAnon();

                  if (_user != null) {
                    Navigator.pushNamed(context, "/");
                  } else {
                    Scaffold.of(context).showSnackBar(snackbar);
                  }
                },
                text: "Accept")),
      ],
    );
  }

  AlertDialog buildDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
          "If you want to continue, you have to accept this policy agreement"),
      actions: [
        FlatButton(
          child: Text("Ok"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}

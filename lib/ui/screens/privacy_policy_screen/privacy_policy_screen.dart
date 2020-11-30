import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:iCovid/core/constants.dart';
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
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("iCOVID",
                  style: kheadline4.copyWith(
                      fontWeight: FontWeight.w800, fontSize: 29, color: kBlue)),
              Container(
                height: size.height * 0.75,
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text("Privacy Policy",
                        style: kheadline3.copyWith(color: kBlue)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(bodyText,
                        style: kBodyText2.copyWith(fontSize: 14, color: kBlue)),
                  ],
                )),
              ),
              buildButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Row buildButtons(BuildContext context) {
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
                onPressed: () {
                  Navigator.pushNamed(context, "/");
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

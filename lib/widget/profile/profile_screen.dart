import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopora/utils/constant.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key, required this.size});

  final Size size;

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(100),
                child: Container(
                  width: widget.size.width * 0.4,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset("images/avatar.jpg", fit: BoxFit.cover),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  "Mohamed",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: kcolor2),
                ),
                Text("Hanafi", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            Text(
              "mohamed1234@",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontSize: 15),
            ),
            TextFieldWidget(
              hint: "First Name",
              message: "Enter Your First Name",
              defaultValue: "Mohamed",
              setupValueChaneg: (value) {},
            ),
            TextFieldWidget(
              hint: "Last Name",
              message: "Enter Your Last Name",
              defaultValue: "Hanafi",
              setupValueChaneg: (value) {},
            ),
            TextFieldWidget(
              hint: "Email",
              message: "Enter Your Email",
              defaultValue: "princeyt8708@gmail.com",
              setupValueChaneg: (value) {},
            ),
            TextFieldWidget(
              hint: "Phone",
              message: "Enter Your Phone",
              defaultValue: "01273059762",
              setupValueChaneg: (value) {},
            ),
            TextFieldWidget(
              hint: "Password",
              message: "Enter Your Password",
              defaultValue: "princeyt8708@gmail.com",
              setupValueChaneg: (value) {},
            ),
            TextFieldWidget(
              hint: "Confirm Password",
              message: "Enter Your Password",
              defaultValue: "princeyt8708@gmail.com",
              setupValueChaneg: (value) {},
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(5),
                ),
                backgroundColor: kcolor2,
              ),
              child: Text(
                "Save",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hint,
    required this.message,
    required this.defaultValue,
    required this.setupValueChaneg,
  });

  final String hint;
  final String message;
  final String defaultValue;
  final Function(String) setupValueChaneg;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: defaultValue),
      style: Theme.of(
        context,
      ).textTheme.titleMedium!.copyWith(color: Colors.black87),
      decoration: InputDecoration(
        label: Text(
          hint,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 20,
            color: const Color.fromARGB(171, 0, 0, 0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        hint: Text(
          message,
          style: TextStyle(
            fontSize: 18.0,
            color: const Color.fromARGB(99, 0, 0, 0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onChanged: setupValueChaneg,
    );
  }
}

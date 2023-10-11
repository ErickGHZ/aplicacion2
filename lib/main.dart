import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController motherLastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late bool nameExist = false;
  late bool lastNameExist = false;
  late bool motherLastExist = false;
  late bool phoneExist = false;
  late bool emailExist = false;
  late bool ageExist = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  saveData() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("name", nameController.text.trim());
    prefs.setString("lastName", lastNameController.text.trim());
    prefs.setString("motherLastName", motherLastNameController.text.trim());
    prefs.setString("phone", phoneController.text.trim());
    prefs.setString("email", emailController.text.trim());
    prefs.setString("age", ageController.text.trim());

  }

  readData() async {
    final SharedPreferences prefs = await _prefs;
    final String? name = prefs.getString("name");
    final String? lastName = prefs.getString("lastName");
    final String? motherLastName = prefs.getString("motherLastName");
    final String? phone = prefs.getString("phone");
    final String? email = prefs.getString("email");
    final String? age = prefs.getString("age");

    if (name != null &&
        lastName != null &&
        motherLastName != null &&
        phone != null &&
        email != null &&
        age != null) {
      setState(() {
        nameExist = true;
        lastNameExist = true;
        motherLastExist = true;
        phoneExist = true;
        emailExist = true;
        ageExist = true;
      });
      if (nameExist &&
          lastNameExist &&
          motherLastExist &&
          phoneExist &&
          emailExist &&
          ageExist) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LandingPage(
              userName: name,
              userLastName: lastName,
              userMotherLastName: motherLastName,
              userPhone: phone,
              userEmail: email,
              userAge: age,
            ),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulation Page",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text("Formulation Page", style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: "Enter your name",
                  labelText: "Name"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your last name";
                }
                return null;
              },
              controller: lastNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: "Enter your last Name",
                  labelText: "Last Name"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your mother's last name";
                }
                return null;
              },
              controller: motherLastNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: "Enter your mother's last name",
                  labelText: "Mother's Last Name"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your phone";
                }
                if (value.length != 10) {
                  return "Phone number must have exactly 10 digits";
                }
                return null;
              },
              keyboardType: TextInputType.number,
              controller: phoneController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: "Enter your phone",
                  labelText: "Phone"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return "Please enter a correct email";
                  }
                  return null;
                },
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText: "Enter a correct email",
              labelText: "Email"),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your age";
            }
            int age = int.tryParse(value) ?? -1;
            if (age < 1 || age > 120) {
              return "Please enter a valid age between 0 and 120";
            }
            return null;
          },
          keyboardType: TextInputType.number,
          controller: ageController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText: "Enter your age",
              labelText: "Age"),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: ElevatedButton(
              onPressed: () {
                _submit();
                saveData();
                final isValid = _formKey.currentState!.validate() ?? false;
                if (isValid) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LandingPage(
                        userName: nameController.text.trim(),
                        userLastName: lastNameController.text.trim(),
                        userMotherLastName: motherLastNameController.text.trim(),
                        userPhone: phoneController.text.trim(),
                        userEmail: emailController.text.trim(),
                        userAge: ageController.text.trim(),
                      ),
                    ),
                  ).then((res) {
                    nameController.clear();
                    lastNameController.clear();
                    motherLastNameController.clear();
                    phoneController.clear();
                    emailController.clear();
                    ageController.clear();
                  });
                }
              },
              child: const Text(
                "Send",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          ],
        ),
        ),
        ),
        );
      }
    }

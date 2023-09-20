import 'package:flutter/material.dart';
import 'package:flutter_cep_lookup/widgets/social_button_link.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informações do App"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage:
                    NetworkImage("https://github.com/br-adriel.png"),
              ),
              SizedBox(height: 8),
              Text(
                "Desenvolvido por",
                style: TextStyle(color: Colors.black45),
              ),
              Text(
                "Adriel Santos",
                style: TextStyle(fontSize: 32),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButtonLink(
                    "https://www.svgrepo.com/show/512317/github-142.svg",
                    "https://github.com/br-adriel",
                    title: "Github",
                  ),
                  SocialButtonLink(
                    "https://www.svgrepo.com/show/473701/linkedin.svg",
                    "https://linkedin.com/in/adriel-fsantos",
                    title: "LinkedIn",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

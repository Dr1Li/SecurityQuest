import 'package:flutter/material.dart';

class SourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sources',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 40, // Adjust the size if needed
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSourceCard(context, 'CTF Platforms', Icons.flag, Colors.grey, CTFPlatformsPage()),
                _buildSourceCard(context, 'Practice with Challenges', Icons.track_changes, Colors.grey, PracticeChallengesPage()),
              ],
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSourceCard(context, 'Online Courses', Icons.school, Colors.grey, OnlineCoursesPage()),
                _buildSourceCard(context, 'Other Resources', Icons.list, Colors.grey, OtherResourcesPage()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSourceCard(BuildContext context, String title, IconData icon, Color color, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 150, // Fixed width
        height: 220, // Fixed height
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CTFPlatformsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CTF Platforms',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 40, // Adjust the size if needed
            color: Colors.blue,
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('CTFd'  ,style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('An open-source CTF platform.'),
            ),
            ListTile(
              title: Text('CTFtime' ,  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('A public directory of all CTFs organized currently or in the past.'),
            ),
            ListTile(
              title: Text('CTF Field Guide',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('An online book about preparing for CTFs.'),
            ),
          ],
        ),
      ),
    );
  }
}

class PracticeChallengesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenges',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 40, // Adjust the size if needed
            color: Colors.blue,
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Avatao',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Challenges to practice cybersecurity skills.'),
            ),
            ListTile(
              title: Text('Crackmes.One',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Challenges to practice reverse engineering.'),
            ),
            ListTile(
              title: Text('D.V.W.A',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Damn Vulnerable Web Application: A PHP/MySQL web application containing various vulnerabilities.'),
            ),
            ListTile(
              title: Text('Exploit Exercises',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Virtual machines and challenges to practice security exploits.'),
            ),
            ListTile(
              title: Text('Hack Me',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('A community platform for building, hosting and sharing vulnerable web app code.'),
            ),
            ListTile(
              title: Text('Hack The Box',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('A community platform with hacking challenges.'),
            ),
            ListTile(
              title: Text('Hack This Site',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Training ground for hackers including a community forum.'),
            ),
            ListTile(
              title: Text('Hack This!!',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Challenges to practice cryptography, forensics, JavaScript, SQL, and more.'),
            ),
            ListTile(
              title: Text('Hacker Test',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Challenges to practice JavaScript, PHP, HTML and graphic thinking.'),
            ),
            ListTile(
              title: Text('Root Me',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Challenges to practice hacking skills.'),
            ),
            ListTile(
              title: Text('Secure Code Warrior',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Security learning resources and challenges.'),
            ),
            ListTile(
              title: Text('Wargames',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Games for practicing hacking skills.'),
            ),
          ],
        ),
      ),
    );
  }
}

class OnlineCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Courses',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 40, // Adjust the size if needed
            color: Colors.blue,
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Cybrary',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Free online security courses.'),
            ),
            ListTile(
              title: Text('Cyber Security Degrees',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Lists of scholarships, degree programs, and certifications in the USA.'),
            ),
            ListTile(
              title: Text('eLearnSecurity',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Paid online security courses.'),
            ),
            ListTile(
              title: Text('ENISA Training Resources',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Educational resources.'),
            ),
            ListTile(
              title: Text('Exploit Database',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Archive of exploits.'),
            ),
            ListTile(
              title: Text('Hacker101',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Free, open-source video lessons on web security.'),
            ),
            ListTile(
              title: Text('Hacksplaining',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Vulnerabilities explained simply.'),
            ),
            ListTile(
              title: Text('Open Security Training',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Free, open-source materials for computer security classes.'),
            ),
            ListTile(
              title: Text('PortSwigger',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Free, online web security training with basic and advanced topics and hands-on labs.'),
            ),
            ListTile(
              title: Text('SANS',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Professional paid information security training.'),
            ),
            ListTile(
              title: Text('SANS Cyber Aces',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Video tutorials with handouts and quizzes.'),
            ),
            ListTile(
              title: Text('Teaching Security',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('Ready-made materials for classrooms.'),
            ),
          ],
        ),
      ),
    );
  }
}

class OtherResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Resources',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 40, // Adjust the size if needed
            color: Colors.blue,
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Awesome Security List',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('A major list on everything security-related.'),
            ),
            ListTile(
              title: Text('Penetest Practice Lab',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('A roadmap for vulnerable apps and systems.'),
            ),
            ListTile(
              title: Text('Practice CTF List',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('CTF practice sites and tools.'),
            ),
            ListTile(
              title: Text('TeachCyber',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('A list of free online resources.'),
            ),
            ListTile(
              title: Text('WeChall',  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
              subtitle: Text('A list of web challenges and practice sites.'),
            ),
          ],
        ),
      ),
    );
  }
}

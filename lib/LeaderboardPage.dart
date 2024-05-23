import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Leaderboard',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 40, // Matching the Home page title size
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopThreeUsers(),
              _buildUserRank(4, 'Mikko Hyppönen', 4123),
              _buildUserRank(5, 'Kevin Mitnick', 3756),
              _buildUserRank(6, 'Troy Hunt', 3421),
              _buildUserRank(7, 'Wendy Nather', 3120),
              _buildUserRank(8, 'Dan Kaminsky', 2678),
              _buildUserRank(9, 'Whitfield Diffie', 2345),
              _buildUserRank(10, 'Martin Hellman', 2103),
              SizedBox(height: 20),
              _buildYourRankText(),
              SizedBox(height: 20),
              _buildUserRank(56, 'Mr Cat', 590, isHighlighted: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopThreeUsers() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTopUserCard('Eva Galperin', 4678, 2, Colors.red),
            _buildTopUserCard('Bruce Schneier', 4987, 1, Colors.yellow),
            _buildTopUserCard('Brian Krebs', 4389, 3, Colors.orange),
          ],
        ),
      ],
    );
  }

  Widget _buildTopUserCard(String name, int score, int rank, Color color) {
    return Expanded(
      child: Column(
        children: [
          if (rank == 1)
            Icon(
              Icons.emoji_events,
              color: Colors.amber,
              size: 30,
            ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Text(
            '$score',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$rank',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserRank(int rank, String name, int score, {bool isHighlighted = false}) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          '$rank',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: isHighlighted ? Color(0xFF006FB4) : Colors.black,
        ),
      ),
      trailing: Text(
        '$score',
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: isHighlighted ? Color(0xFF006FB4) : Colors.black,
        ),
      ),
      contentPadding: isHighlighted ? EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0) : null,
      tileColor: isHighlighted ? Color(0xFFC2C2C2) : null,
      shape: isHighlighted ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ) : null,
    );
  }

  Widget _buildYourRankText() {
    return Text(
      'Your Rank !',
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 24,
        color: Colors.black,
      ),
    );
  }
}
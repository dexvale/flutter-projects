import 'package:flutter/material.dart';

class SpotifyClonePAge extends StatelessWidget {
  const SpotifyClonePAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Spotify Dark Background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildTopGrid(),
              const SizedBox(height: 32),
              _buildSectionTitle('Recently played'),
              const SizedBox(height: 16),
              _buildRecentlyPlayed(),
              const SizedBox(height: 32),
              _buildSectionTitle('New episodes'),
              const SizedBox(height: 16),
              _buildNewEpisodes(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Good afternoon',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.settings_outlined, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTopGrid() {
    final List<String> gridItems = [
      'Fantastic Beats',
      'Discover Weekly',
      'Release Radar',
      'Daft Punk',
      '2021',
      'The Joe Rogan Experience'
    ];

    return GridView.builder(
      shrinkWrap: true, // Important: allows GridView to live inside a scrollable column
      physics: const NeverScrollableScrollPhysics(), // Disables inner scrolling
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 3, // Makes the cards wide and short
      ),
      itemCount: gridItems.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A), // Dark grey card color
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                decoration: const BoxDecoration(
                  color: Colors.grey, // Placeholder for album art
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(4)),
                ),
                child: const Icon(Icons.music_note, color: Colors.white54),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  gridItems[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildRecentlyPlayed() {
    final List<String> recentItems = ['Fantastic Beats', 'Discover Weekly', '2021'];

    return SizedBox(
      height: 160, // Fixed height required for horizontal ListViews inside Columns
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recentItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SizedBox(
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    color: Colors.grey[800], // Placeholder for album art
                    child: const Icon(Icons.album, color: Colors.white54, size: 40),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    recentItems[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewEpisodes() {
    return SizedBox(
      height: 180, 
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildPodcastCard('The Joe Rogan Experience', 'Podcast • Joe Rogan'),
          const SizedBox(width: 16),
          _buildPodcastCard('Browse podcasts', 'Find something new'),
        ],
      ),
    );
  }

  Widget _buildPodcastCard(String title, String subtitle) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF181818), // Slightly lighter background for the card
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.mic, color: Colors.white54, size: 40),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
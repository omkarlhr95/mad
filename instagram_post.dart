import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstagramPostScreen extends StatelessWidget {
  const InstagramPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Column(
          children: [
            // Header section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Instagram',
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.favorite_border),
                      SizedBox(width: 16),
                      Icon(Icons.send),
                    ],
                  ),
                ],
              ),
            ),

            // Post card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Post header
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/avatar.jpg'),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'johndoe',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Post image
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1501973801540-537f08ccae7b',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Action buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: const [
                        Icon(Icons.favorite_border),
                        SizedBox(width: 16),
                        Icon(Icons.comment),
                        SizedBox(width: 16),
                        Icon(Icons.send),
                        Spacer(),
                        Icon(Icons.bookmark_border),
                      ],
                    ),
                  ),

                  // Likes and caption
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1,234 likes',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.roboto(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'johndoe ',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const TextSpan(
                                text: 'Beautiful sunset today! 📸 #photography #nature',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

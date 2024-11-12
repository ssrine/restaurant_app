class UnbordingContent {
  final String image;
  final String title;
  final String discription;

  // Making the fields required
  UnbordingContent({
    required this.image,
    required this.title,
    required this.discription,
  });
}

// Updated content list with simpler, professional titles and descriptions
List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Gourmet Quality',
    image: 'assets/images/loogo.jpg',
    discription: "Experience the best in dining with restaurant-quality food. From appetizers to desserts, "
                 "every dish is crafted to deliver exceptional taste and quality right to you. Enjoy fine dining at your convenience.",
  ),
  UnbordingContent(
    title: 'Nearby Spots',
    image: 'assets/images/mapresto2.png',
    discription: "Use our interactive map to find nearby dining options. Discover popular restaurants around you, "
                 "explore new spots, and enjoy seamless navigation to satisfy your cravings wherever you are.",
  ),
  UnbordingContent(
    title: 'Smart Chatbot',
    image: 'assets/images/aichatboot.png',
    discription: "Need a recommendation? Our AI chatbot is here to help! Chat for personalized restaurant suggestions "
                 "and make reservations at top-rated spots, tailored to your tastes. Enjoy instant, intelligent assistance.",
  ),
];
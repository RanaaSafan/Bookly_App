class onboardingInfo{
  String image;
  String title;
  String description;
  onboardingInfo({required this.title,required this.image,required this.description});
}
List<onboardingInfo>contents=[
  onboardingInfo(
      title: "  Discover Your Next Favorite Book",
      image:"assets/images/5965543900531769584.jpg",
      description:"With Bookly, finding the perfect book is easy! Browse through recommendations, bestsellers, and new releases across a variety of genres."
  ),
  onboardingInfo(
      title: "Track Your Reading Journey",
      image: "assets/images/5965543900531769582.jpg",
      description:"Stay motivated by tracking your reading habits. Set daily, weekly, or monthly goals and keep an eye on your reading stats."
  ),
  onboardingInfo(
      title: "Personalized Book Recommendations",
      image: "assets/images/5965543900531769586.jpg",
      description: "Tell us what you like, and we’ll recommend books tailored to your tastes. Discover books that match your unique style."),
];
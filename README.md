# 🃏 Flutter Deck of Cards App
This Flutter application simulates a deck of cards experience by consuming a RESTful API. The app allows users to shuffle a deck, draw cards, and reset the game, all through sleek UI and responsive interactions.

## ✨ Features
🎴 Shuffle and draw cards from a full 52-card deck

🔁 Reset and reshuffle functionality

🌐 RESTful API integration using http package

📱 Clean, responsive, and intuitive UI

📦 Tech Stack
Flutter (Dart)

RESTful API: Deck of Cards API

State Management: setState (can be replaced with Provider/Bloc if scaling)

HTTP Client: http package

## 🚀 Getting Started
Prerequisites
Flutter SDK installed

An IDE like VS Code or Android Studio

Internet access (for API calls)

Installation
Clone the repository:

bash
Copy
Edit
git clone https://github.com/MuhammadalixRaza/flutter-deck-of-cards.git
cd flutter-deck-of-cards
Get dependencies:

bash
Copy
Edit
flutter pub get
Run the app:

bash
Copy
Edit
flutter run
## 🛠️ API Endpoints Used
This app uses the Deck of Cards API:

Create new deck:
GET https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1

Draw a card:
GET https://deckofcardsapi.com/api/deck/{deck_id}/draw/?count=1

Reshuffle existing deck:
GET https://deckofcardsapi.com/api/deck/{deck_id}/shuffle/

## 📸 Screenshots
<p align="center">
  <img src="https://github.com/user-attachments/assets/1be3ec82-8dc2-4a98-b647-c8a9b546a9e8" width="200"/>
  <img src="https://github.com/user-attachments/assets/7dc047a5-f4dc-464d-9bb1-faedd3fe34f2" width="200"/>
  <img src="https://github.com/user-attachments/assets/e1fd1375-6b60-49f7-9fa7-f4bd6dab5cb7" width="200"/>
  <img src="https://github.com/user-attachments/assets/5e73a724-a15e-4a1e-8cc9-d8a95b16f32c" width="200"/>
</p>

## 🔧 Customization Ideas

Add jokers or multiple decks

View Cards Of Each Player

Add animations

Implement multiplayer drawing game logic



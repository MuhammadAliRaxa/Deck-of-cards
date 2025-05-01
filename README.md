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
git clone https://github.com/yourusername/flutter-deck-of-cards.git
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
  <img src="https://github.com/user-attachments/assets/66fed3f3-c209-486d-8188-c5886589079c" width="200"/>
  <img src="https://github.com/user-attachments/assets/1c526d1b-bfb1-4466-b04a-460ad13452dd" width="200"/>
  <img src="https://github.com/user-attachments/assets/9051fc69-e2df-41fb-8dc6-faac7f42596b" width="200"/>
  <img src="https://github.com/user-attachments/assets/1f87b11f-d40a-4450-8a83-63563c6612f7" width="200"/>
</p>

## 🔧 Customization Ideas

Add jokers or multiple decks

View Cards Of Each Player

Add animations

Implement multiplayer drawing game logic



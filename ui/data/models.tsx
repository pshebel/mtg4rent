// Type representing a card
interface Card {
    id: number;
    name: string;
    small_image_uri: string;
    large_image_uri: string;
    created_at: string; // ISO string format of timestamp
  }
  
  // Type representing a card in a deck (with copies)
  interface DeckCard {
    deck_id: number;
    card_id: number;
    copies: number;
    created_at: string; // ISO string format of timestamp
  }
  
  // Type representing a deck (includes an array of cards)
  interface Deck {
    id: number;
    name: string;
    created_at: string; // ISO string format of timestamp
    cards: DeckCard[]; // Cards in the deck
  }
  
  // Type representing a game card (card played during a game by hero or opponent)
  interface GameCard {
    game_id: number;
    hero: boolean; // True if the card was played by the hero
    card_id: number; // The ID of the card played
  }
  
  // Type representing a game within a match
  interface Game {
    game_id: number;
    match_id: number;
    win: boolean;
    created_at: string; // ISO string format of timestamp
    cards: GameCard[]; // Cards played in this game
  }
  
  // Type representing a match
  interface Match {
    match_id: number;
    op_name: string;
    op_deck: string;
    hero_deck: string;
    win: boolean; // Match result: true = hero wins, false = hero loses
    game_wins: number; // Number of games the hero won
    created_at: string; // ISO string format of timestamp
    games: Game[]; // Array of games in this match
  }
  
  // Root structure representing the entire data model
  interface Database {
    cards: Card[]; // List of cards
    decks: Deck[]; // List of decks
    matches: Match[]; // List of matches
  }
  
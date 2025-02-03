CREATE TABLE cards (
	id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    small_image_uri VARCHAR(255),
    large_image_uri VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE deck (
	id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE deck_card (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    deck_id INT NOT NULL,
    card_id INT NOT NULL,
    copies INT DEFAULT 1,   
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (deck_id, card_id),
    FOREIGN KEY (deck_id) REFERENCES decks(deck_id) ON DELETE CASCADE,
    FOREIGN KEY (card_id) REFERENCES cards(card_id) ON DELETE CASCADE
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    op_name VARCHAR(255) NOT NULL,
    op_deck VARCHAR(255) NOT NULL,
    hero_deck VARCHAR(255) NOT NULL,
    win BOOLEAN NOT NULL,
    game_wins INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    match_id INT NOT NULL,
    win BOOLEAN NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (match_id) REFERENCES matches(match_id) ON DELETE CASCADE
);

CREATE TABLE game_cards (
    game_card_id SERIAL PRIMARY KEY,
    game_id INT NOT NULL,
    hero BOOLEAN NOT NULL,
    card_id INT NOT NULL,
    FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE
    FOREIGN KEY (card_id) REFERENCES cards(card_id) ON DELETE CASCADE
);
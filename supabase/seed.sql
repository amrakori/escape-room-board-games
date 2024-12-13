-- Insert sample publishers
INSERT INTO publishers (name, website) VALUES
    ('Thames & Kosmos', 'https://www.thamesandkosmos.com'),
    ('Space Cowboys', 'https://www.spacecowboys.fr'),
    ('Spin Master Games', 'https://www.spinmaster.com');

-- Insert sample games
INSERT INTO games (
    title,
    description,
    difficulty,
    min_players,
    max_players,
    duration_min,
    duration_max,
    rating,
    image_url,
    price,
    publisher
) VALUES
    (
        'Exit: The Abandoned Cabin',
        'During a hiking trip, you seek shelter in an abandoned cabin. But the door locks behind you, and you must solve various puzzles to escape.',
        'Medium',
        1,
        4,
        60,
        120,
        4.5,
        'https://images.unsplash.com/photo-1518780664697-55e3ad937233',
        14.99,
        (SELECT id FROM publishers WHERE name = 'Thames & Kosmos')
    ),
    (
        'Unlock!: The House on the Hill',
        'Explore a mysterious haunted house filled with supernatural puzzles and hidden secrets.',
        'Hard',
        1,
        6,
        45,
        60,
        4.3,
        'https://images.unsplash.com/photo-1513977055326-8ae6272d90a7',
        29.99,
        (SELECT id FROM publishers WHERE name = 'Space Cowboys')
    ),
    (
        'Escape Room: The Game',
        'A collection of four unique scenarios with real-time pressure and physical components.',
        'Medium',
        3,
        5,
        60,
        60,
        4.0,
        'https://images.unsplash.com/photo-1614332287897-cdc485fa562d',
        39.99,
        (SELECT id FROM publishers WHERE name = 'Spin Master Games')
    );

-- Add categories to games
INSERT INTO games_categories (game_id, category_id)
SELECT g.id, c.id
FROM games g, game_categories c
WHERE g.title = 'Exit: The Abandoned Cabin'
AND c.name IN ('Mystery', 'Puzzle', 'Adventure');

INSERT INTO games_categories (game_id, category_id)
SELECT g.id, c.id
FROM games g, game_categories c
WHERE g.title = 'Unlock!: The House on the Hill'
AND c.name IN ('Horror', 'Mystery', 'Puzzle');

INSERT INTO games_categories (game_id, category_id)
SELECT g.id, c.id
FROM games g, game_categories c
WHERE g.title = 'Escape Room: The Game'
AND c.name IN ('Adventure', 'Puzzle', 'Detective');
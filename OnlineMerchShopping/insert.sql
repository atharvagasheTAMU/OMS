create table authors(
	author_id serial primary key,
	authon_name varchar
);
CREATE TABLE IF NOT EXISTS public.users
(
    user_id serial primary key,
	username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    password character varying(50) COLLATE pg_catalog."default",
    first_name character varying(50) COLLATE pg_catalog."default",
    last_name character varying(50) COLLATE pg_catalog."default",
    age integer,
    activity character varying(100) COLLATE pg_catalog."default"
);

create table books(
	book_id serial primary key,
	book_name varchar,
	book_description varchar,
	book_price decimal,
	author_id varchar,
	genre varchar,
	quantity integer
	);
create table orders(
	order_id serial primary key,
	book_id integer,
	user_id integer,
	order_date date,
	due_date date,
	
	foreign key(book_id) references books(book_id),
	foreign key(user_id) references users(user_id)

);

INSERT INTO books (book_name, book_description, book_price, author_id, genre, quantity)
VALUES
    ('The Shadow of the Wind', 'Mystery novel set in post-war Barcelona about a young boy who discovers a mysterious book.', 21.99, 'Carlos Ruiz Zafón', 'Mystery', 30),
    ('The Pillars of the Earth', 'Historical novel about the building of a cathedral in the fictional town of Kingsbridge.', 27.50, 'Ken Follett', 'Historical', 45),
    ('The Fault in Our Stars', 'Young adult novel about two teenagers with cancer who fall in love.', 16.75, 'John Green', 'Young Adult', 50),
    ('A Man Called Ove', 'Heartwarming novel about a grumpy old man whose life takes unexpected turns.', 18.95, 'Fredrik Backman', 'Fiction', 35),
    ('The Grapes of Wrath', 'Classic novel about the Joad family''s journey during the Great Depression.', 19.50, 'John Steinbeck', 'Classic', 55),
    ('The Girl with All the Gifts', 'Post-apocalyptic novel about a young girl with unique abilities in a world overrun by zombies.', 15.25, 'M.R. Carey', 'Science Fiction', 40),
    ('The White Tiger', 'Darkly comedic novel about a driver''s rise from poverty to success in modern-day India.', 23.20, 'Aravind Adiga', 'Fiction', 28),
    ('The Thirteenth Tale', 'Gothic mystery novel about a reclusive author and the secrets she reveals.', 17.80, 'Diane Setterfield', 'Mystery', 42),
    ('The Stand', 'Post-apocalyptic horror novel about the battle between good and evil after a global pandemic.', 24.50, 'Stephen King', 'Horror', 33),
    ('The Nightingale', 'Historical novel about two sisters in Nazi-occupied France during World War II.', 20.99, 'Kristin Hannah', 'Historical', 37),
    ('The Martian Chronicles', 'Science fiction novel that presents a series of vignettes about the colonization of Mars.', 22.75, 'Ray Bradbury', 'Science Fiction', 25),
    ('The Outsiders', 'Coming-of-age novel about the rivalry between two groups of teenagers, the Greasers and the Socs.', 16.50, 'S.E. Hinton', 'Young Adult', 48),
    ('The Immortalists', 'Novel that follows four siblings who, as children, learn the dates of their deaths from a fortune teller.', 19.20, 'Chloe Benjamin', 'Fiction', 34),
    ('The Godfather', 'Crime novel that tells the story of the powerful Italian-American Mafia family, the Corleones.', 25.99, 'Mario Puzo', 'Crime', 29),
    ('The Three-Body Problem', 'Science fiction novel that explores contact with an alien civilization.', 21.45, 'Liu Cixin', 'Science Fiction', 40),
    ('The Picture of Dorian Gray', 'Philosophical novel about a man whose portrait ages while he remains young and indulges in a life of hedonism.', 18.75, 'Oscar Wilde', 'Classic', 37),
    ('The Power of One', 'Coming-of-age novel set in South Africa during World War II about a young English boy named Peekay.', 17.90, 'Bryce Courtenay', 'Historical', 33),
    ('The Rosie Project', 'Romantic comedy novel about a socially awkward genetics professor who designs a scientific survey to find the perfect wife.', 16.25, 'Graeme Simsion', 'Romance', 45),
    ('The Road Less Traveled', 'Self-help book that explores love, growth, and spiritual development.', 14.50, 'M. Scott Peck', 'Self-Help', 50),
    ('The Color of Magic', 'Comic fantasy novel that is the first book in the Discworld series by Terry Pratchett.', 19.99, 'Terry Pratchett', 'Fantasy', 38);
INSERT INTO books (book_name, book_description, book_price, author_id, genre, quantity)
VALUES
    ('The Silent Patient', 'Psychological thriller about a woman who shoots her husband and then stops speaking.', 20.99, 'Alex Michaelides', 'Mystery', 40),
    ('The Night Circus', 'Fantasy novel about a magical competition between two illusionists.', 18.50, 'Erin Morgenstern', 'Fantasy', 35),
    ('Educated', 'Memoir about a woman who grows up in a strict and abusive household but eventually earns a PhD from Cambridge.', 25.00, 'Tara Westover', 'Non-Fiction', 25),
    ('The Goldfinch', 'Coming-of-age novel about a young boy who survives a terrorist attack at an art museum.', 22.75, 'Donna Tartt', 'Fiction', 30),
    ('The Martian', 'Science fiction novel about an astronaut stranded on Mars and his struggle for survival.', 16.99, 'Andy Weir', 'Science Fiction', 50),
    ('The Girl on the Train', 'Psychological thriller about a woman who becomes entangled in a missing person investigation.', 19.25, 'Paula Hawkins', 'Mystery', 45),
    ('The Immortal Life of Henrietta Lacks', 'Non-fiction book about the life and impact of Henrietta Lacks, whose cells were used for medical research.', 23.45, 'Rebecca Skloot', 'Non-Fiction', 20),
    ('Circe', 'Fantasy novel that retells the story of the Greek mythological witch Circe.', 17.80, 'Madeline Miller', 'Fantasy', 55),
    ('Where the Crawdads Sing', 'Mystery novel about a young woman living in the marshes of North Carolina accused of murder.', 21.50, 'Delia Owens', 'Mystery', 60),
    ('The Underground Railroad', 'Historical novel about a young slave''s journey to freedom using a secret network of underground railways.', 26.20, 'Colson Whitehead', 'Historical', 38),
    ('The Handmaid''s Tale', 'Dystopian novel set in a theocratic society where women are subjugated and used for reproduction.', 24.99, 'Margaret Atwood', 'Dystopian', 28),
    ('The Book Thief', 'Historical novel narrated by Death, telling the story of a young girl living in Nazi Germany.', 19.95, 'Markus Zusak', 'Historical', 33),
    ('Norwegian Wood', 'Coming-of-age novel that explores themes of love and loss in 1960s Japan.', 15.80, 'Haruki Murakami', 'Fiction', 42),
    ('The Road to Wigan Pier', 'Non-fiction work by George Orwell examining the living conditions of the working class in England during the 1930s.', 14.75, 'George Orwell', 'Non-Fiction', 36),
    ('The Glass Castle', 'Memoir about the unconventional and poverty-stricken upbringing of the author.', 18.20, 'Jeannette Walls', 'Memoir', 48),
    ('A Clockwork Orange', 'Dystopian novel following the violent exploits of a teenage delinquent in a future society.', 20.45, 'Anthony Burgess', 'Dystopian', 26),
    ('The Secret History', 'Psychological thriller that explores the consequences of a group of students studying ancient Greek at an elite college.', 22.90, 'Donna Tartt', 'Thriller', 32),
    ('The Color Purple', 'Novel that explores the lives of African American women in the early 20th century.', 16.30, 'Alice Walker', 'Fiction', 22),
    ('The Brothers Karamazov', 'Philosophical novel that explores morality, faith, and the consequences of personal actions.', 28.75, 'Fyodor Dostoevsky', 'Classic', 18),
    ('The Hound of the Baskervilles', 'Classic mystery novel that follows Sherlock Holmes and Dr. Watson as they investigate the legend of a supernatural hound.', 25.99, 'Arthur Conan Doyle', 'Mystery', 44);

INSERT INTO books (book_name, book_description, book_price, author_id, genre, quantity)
VALUES
    ('The Secret Garden', 'Children''s classic about a young girl who discovers a hidden, neglected garden.', 14.99, 'Frances Hodgson Burnett', 'Children''s', 60),
    ('The Great Alone', 'Drama novel about a family''s struggle for survival in the wilds of Alaska.', 23.50, 'Kristin Hannah', 'Drama', 40),
    ('The Catcher in the Rye', 'Coming-of-age novel following Holden Caulfield in New York City.', 18.99, 'J.D. Salinger', 'Fiction', 30),
    ('The Da Vinci Code', 'Mystery thriller that follows a symbologist''s quest to solve a murder in the Louvre Museum.', 21.95, 'Dan Brown', 'Mystery', 50),
    ('The Shining', 'Horror novel about a family''s winter stay at an isolated and haunted hotel.', 19.75, 'Stephen King', 'Horror', 45),
    ('The Help', 'Historical novel set in Mississippi during the early 1960s, narrated by African American maids.', 17.20, 'Kathryn Stockett', 'Historical', 30),
    ('The Road to Character', 'Self-help book that explores the concept of moral and personal development.', 16.45, 'David Brooks', 'Self-Help', 35),
    ('The Art of Racing in the Rain', 'Contemporary novel narrated by a dog, exploring themes of love and loyalty.', 18.80, 'Garth Stein', 'Fiction', 40),
    ('The Girl with the Pearl Earring', 'Historical novel inspired by the painting of the same name by Johannes Vermeer.', 15.25, 'Tracy Chevalier', 'Historical', 55),
    ('The Immigrant', 'Saga novel about a young immigrant''s journey to America and the challenges faced in the new world.', 22.99, 'Manju Kapur', 'Historical', 30),
    ('The Wind-Up Bird Chronicle', 'Surreal novel that follows a man''s search for his missing wife and the strange characters he encounters.', 20.50, 'Haruki Murakami', 'Fiction', 28),
    ('The Hunger Games', 'Dystopian series where teenagers fight in a televised event for survival.', 18.50, 'Suzanne Collins', 'Dystopian', 55),
    ('The Joy Luck Club', 'Multigenerational novel that explores the relationships between Chinese-American immigrant mothers and their daughters.', 17.99, 'Amy Tan', 'Fiction', 35),
    ('The Silence of the Girls', 'Historical novel that retells the events of the Iliad from the perspective of a female slave.', 24.20, 'Pat Barker', 'Historical', 32),
    ('The Lost Symbol', 'Mystery thriller featuring the Harvard symbologist Robert Langdon.', 21.75, 'Dan Brown', 'Mystery', 40),
    ('The Poisonwood Bible', 'Drama novel that follows a missionary family in the Congo during the turbulent 1960s.', 19.30, 'Barbara Kingsolver', 'Drama', 37),
    ('The Rosie Effect', 'Sequel to "The Rosie Project," continuing the story of Don Tillman and his unique approach to life and love.', 16.50, 'Graeme Simsion', 'Romance', 38),
    ('The Invention of Wings', 'Historical novel about the abolitionist movement in the United States, focusing on the lives of two women.', 23.99, 'Sue Monk Kidd', 'Historical', 33),
    ('The Hobbit', 'Fantasy novel that follows the journey of Bilbo Baggins as he accompanies a group of dwarves on a quest.', 18.25, 'J.R.R. Tolkien', 'Fantasy', 45),
    ('The Joy of Cooking', 'Classic cookbook that has been a staple in American kitchens for generations.', 25.50, 'Irma S. Rombauer', 'Cookbook', 50),
    ('The Tipping Point', 'Non-fiction book that explores how small actions can lead to big changes in society.', 20.95, 'Malcolm Gladwell', 'Non-Fiction', 40),
    ('The Lovely Bones', 'Drama novel narrated by a young girl who watches from her personal Heaven as her family copes with her murder.', 19.40, 'Alice Sebold', 'Drama', 30),
    ('The Martian', 'Science fiction novel about an astronaut stranded on Mars and his struggle for survival.', 16.99, 'Andy Weir', 'Science Fiction', 50),
    ('The Da Vinci Code', 'Mystery thriller that follows a symbologist''s quest to solve a murder in the Louvre Museum.', 21.95, 'Dan Brown', 'Mystery', 40);
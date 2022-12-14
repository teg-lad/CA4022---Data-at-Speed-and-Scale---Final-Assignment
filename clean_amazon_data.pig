
--books = LOAD 'amazon/amazon_reviews/amazon_books.tsv' using PigStorage('\t') as (marketplace:chararray, customer_id:chararray, review_id:chararray, product_id:chararray, product_parent:int, product_title:chararray, product_category:chararray, star_rating:int, helpful_votes:int, total_votes:int, vine:chararray, verified_purchase:chararray, review_headline:chararray, review_body:chararray, review_date:chararray); 

movies = LOAD 'amazon/amazon_reviews/amazon_movies.tsv' using PigStorage('\t') as (marketplace:chararray, customer_id:chararray, review_id:chararray, product_id:chararray, product_parent:int, product_title:chararray, product_category:chararray, star_rating:int, helpful_votes:int, total_votes:int, vine:chararray, verified_purchase:chararray, review_headline:chararray, review_body:chararray, review_date:chararray); 

--videogames = LOAD 'amazon/amazon_reviews/amazon_videogames.tsv' using PigStorage('\t') as (marketplace:chararray, customer_id:chararray, review_id:chararray, product_id:chararray, product_parent:int, product_title:chararray, product_category:chararray, star_rating:int, helpful_votes:int, total_votes:int, vine:chararray, verified_purchase:chararray, review_headline:chararray, review_body:chararray, review_date:chararray); 

--books = DISTINCT books;
movies = DISTINCT movies;
--videogames = DISTINCT videogames;

--small_movies = limit movies 5;
--DUMP small_movies;

--books_clean = FILTER books by IsEmpty(marketplace);

--books_clean = FILTER books by ($0 is not null) AND ($1 is not null) AND ($2 is not null) AND ($3 is not null) AND ($4 is not null) AND ($5 is not null) AND ($6 is not null) AND ($7 is not null) AND ($8 is not null) AND ($9 is not null) and ($10 is not null) AND ($11 is not null) AND ($12 is not null) AND ($13 is not null) AND ($14 is not null);


--new_books_clean = FOREACH books_clean GENERATE .. $9;


movies_clean = FILTER movies by ($0 is not null) AND ($1 is not null) AND ($2 is not null) AND ($3 is not null) AND ($4 is not null) AND ($5 is not null) AND ($6 is not null) AND ($7 is not null) AND ($8 is not null) AND ($9 is not null) and ($10 is not null) AND ($11 is not null) AND ($12 is not null) AND ($13 is not null) AND ($14 is not null);

new_movies_clean = FOREACH movies_clean GENERATE .. $9;

--videogames_clean = FILTER videogames by ($0 is not null) AND ($1 is not null) AND ($2 is not null) AND ($3 is not null) AND ($4 is not null) AND ($5 is not null) AND ($6 is not null) AND ($7 is not null) AND ($8 is not null) AND ($9 is not null) and ($10 is not null) AND ($11 is not null) AND ($12 is not null) AND ($13 is not null) AND ($14 is not null);

--new_videogames_clean = FOREACH videogames_clean GENERATE .. $9;


--tmp = UNION new_books_clean, new_movies_clean;
--all_ratings = UNION tmp, new_videogames_clean;

--new_tmp = LIMIT all_ratings 5;

--DUMP new_tmp;
STORE new_movies_clean INTO 'amazon/amazon_reviews/clean_moviess.tsv' using PigStorage('\t');


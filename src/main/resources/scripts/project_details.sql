CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL
);

CREATE TABLE single_reviews (
	single_review_id serial PRIMARY KEY,
	user_id serial,
	score decimal not null,
	review_text text,
	FOREIGN KEY (user_id) REFERENCES accounts (user_id)
);

create table reviews (
	reviews_id serial primary key,
	single_review_id serial,
	total_reviews int not null,
	total_score decimal not null,
	total_reviews_text int not null,
	foreign key (single_review_id) references single_reviews (single_review_id)
);

create table categories (
	category_id serial primary key,
	category_description varchar(255) not null
);

create table illustrations (
	illustration_id serial primary key,
	illustration_title varchar(255) not null,
	illustration_category_id serial,
	illustration_image_url text not null,
	illustration_mature_content boolean not null,
	reviews_id serial,
	foreign key (illustration_category_id) references categories (category_id),
	foreign key (reviews_id) references reviews (reviews_id)
);

create table tales (
	tale_id serial primary key,
	tale_title varchar(100) not null,
	tale_category_id serial,
	tale_image_url text not null,
	tale_mature_content boolean not null,
	tale_short_description text not null,
	tale_long_description text not null,
	tale_text text not null,
	reviews_id serial,
	foreign key (tale_category_id) references categories (category_id),
	foreign key (reviews_id) references reviews (reviews_id)
);

create table novel_chapters(
	novel_chapter_id serial primary key,
	novel_chapter_title varchar(255) not null,
	novel_short_description text not null,
	novel_long_description text not null,
	novel_chapter_text text not null,
	reviews_id serial,
	foreign key (reviews_id) references reviews (reviews_id)
);

create table novels(
	novel_id serial primary key,
	novel_status_complete boolean not null,
	novel_mature_content boolean not null,
	novel_image_url text not null,
	novel_category_id serial,
	novel_chapter_id serial,
	short_description text not null,
	long_description text not null,
	novel_last_update TIMESTAMP NOT NULL,
	reviews_id serial,
	foreign key (novel_category_id) references categories (category_id),
	foreign key (novel_chapter_id) references novel_chapters (novel_chapter_id),
	foreign key (reviews_id) references reviews (reviews_id)
);

create table comic_pages(
	comic_page_id serial primary key,
	comic_page_chapter_id serial,
	comic_id serial,
	comic_page_url text not null,
	comic_page_number int not null,
	reviews_id serial,
	foreign key (reviews_id) references reviews (reviews_id)
);

create table comic_chapters (
	comic_chapter_id serial primary key,
	comic_id serial, 
	comic_chapter_status_complete boolean not null,
	comic_chapter_last_update TIMESTAMP NOT NULL,
	comic_chapter_image_url text not null,
	comic_short_description text not null,
	comic_long_description text not null,
	comic_page_id serial,
	reviews_id serial,
	foreign key (comic_page_id) references comic_pages(comic_page_id),
	foreign key (reviews_id) references reviews (reviews_id)
);

create table comics(
	comic_id serial primary key,
	comic_status_complete boolean not null,
	comic_mature_content boolean not null,
	comic_image_url text not null,
	comic_short_description text not null,
	comic_long_description text not null,
	comic_category_id serial,
	comic_chapter_id serial,
	comic_last_update TIMESTAMP NOT NULL,
	reviews_id serial,
	foreign key (comic_category_id) references categories (category_id),
	foreign key (comic_chapter_id) references comic_chapters (comic_chapter_id),
	foreign key (reviews_id) references reviews (reviews_id)
)
CREATE TABLE "authors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "name" varchar(255), "birth" date, "address" text, "ctype" varchar(255), "photo" blob, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "authors_books" ("author_id" integer NOT NULL, "book_id" integer NOT NULL);
CREATE TABLE "books" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "isbn" varchar(255), "title" varchar(255), "price" integer, "publish" varchar(255), "published" date, "cd" boolean, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "fan_comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "author_no" integer, "name" varchar(255), "body" text, "deleted" boolean, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "members" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "email" varchar(255), "lock_version" integer DEFAULT 0, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "memos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "memoable_type" varchar(255), "memoable_id" integer, "body" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "reviews" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "book_id" integer, "user_id" integer, "body" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(255), "password" varchar(255), "salt" varchar(255), "email" varchar(255), "dm" boolean, "roles" varchar(255), "reviews_count" integer DEFAULT 0, "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_authors_on_user_id" ON "authors" ("user_id");
CREATE INDEX "index_reviews_on_book_id" ON "reviews" ("book_id");
CREATE INDEX "index_reviews_on_user_id" ON "reviews" ("user_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20130913051910');

INSERT INTO schema_migrations (version) VALUES ('20130914060842');

INSERT INTO schema_migrations (version) VALUES ('20130914060904');

INSERT INTO schema_migrations (version) VALUES ('20130914060920');

INSERT INTO schema_migrations (version) VALUES ('20130914060936');

INSERT INTO schema_migrations (version) VALUES ('20130915061456');

INSERT INTO schema_migrations (version) VALUES ('20131005063736');

INSERT INTO schema_migrations (version) VALUES ('20140118053815');

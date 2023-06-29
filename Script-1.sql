CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS bands (
	band_id SERIAL PRIMARY KEY,
	band_name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_band (
	genre_id INTEGER REFERENCES genre(genre_id),
	band_id INTEGER REFERENCES bands(band_id),
	CONSTRAINT pk_genre_band PRIMARY KEY (genre_id, band_id)
);


CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(40) unique NOT NULL,
	year_of_release INTEGER check(year_of_release>1900)
);


CREATE TABLE IF NOT EXISTS band_album (
	album_id INTEGER REFERENCES album(album_id),
	band_id INTEGER REFERENCES bands(band_id),
	CONSTRAINT pk_band_album PRIMARY KEY (album_id, band_id)
);


CREATE TABLE IF NOT EXISTS tracks (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(50) NOT NULL,
	track_duration INTEGER,
	album_id INTEGER REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS collection (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(40) unique NOT NULL,
	year_of_release INTEGER check(year_of_release>1900)
);

CREATE TABLE IF NOT EXISTS track_collection (
	track_id INTEGER REFERENCES tracks(track_id),
	collection_id INTEGER REFERENCES collection(collection_id),
	CONSTRAINT pk_track_collection PRIMARY KEY (track_id, collection_id)
);
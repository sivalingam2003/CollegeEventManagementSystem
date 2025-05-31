SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';
-- AND table_type = 'BASE TABLE';

create table college(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) UNIQUE NOT NULL
);

-- select * from college

create table college(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) UNIQUE NOT NULL
);

create table dept(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL
);

create table venue(
	id SERIAL primary key,
	name VARCHAR(255) UNIQUE NOT NULL,
	location TEXT NOT NULL,
	capacity INT NOT NULL
);
create type role_type AS enum ('admin', 'staff', 'student');

create table users (
	id SERIAL primary key,
	email VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(255) UNIQUE NOT NULL,
	role role_type,
	dob DATE NOT NULL,
	year_of_study INT, check((role = 'student' AND year_of_study is not null) or (role IN ('admin','staff') AND year_of_study is null)),
	dept_id INT NOT NULL,
	Foreign Key (dept_id) references dept(id),
	college_id INT NOT NULL,
	Foreign Key (college_id) references college(id),
	phone TEXT UNIQUE NOT NULL,
	address TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select * from users;
drop table users;

create table events(
	id SERIAL primary key,
	name VARCHAR(20) UNIQUE NOT NULL,
	start_time TIME NOT NULL,
	date DATE NOT NULL,
	venue_id INT,
	foreign key (venue_id) references venue(id),
	description TEXT NOT NULL,
	max_allowed INT NOT NULL,
	organizing_staff_id INT,
	foreign key (organizing_staff_id) references users(id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by INT,
	foreign key (created_by) references users(id)
);

CREATE TABLE student_event(
	student_id INT,
	event_id INT,
	isPresent BOOLEAN DEFAULT false,
	PRIMARY KEY(student_id, event_id),
	FOREIGN KEY(student_id) REFERENCES users(id),
	FOREIGN KEY(event_id) REFERENCES events(id)
);
DROP TABLE 
CREATE TYPE prize_position_type AS ENUM ('first', 'second', 'third');
CREATE TYPE prize_status_type AS ENUM ('distributed', 'pending');
CREATE TABLE prizes(
	id SERIAL (PK)
	student_id INT,
	event_id INT,
	position prize_position_type,
	status prize_status_type,

)
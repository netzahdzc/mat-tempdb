GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'password_fiware_server';

# TODO insert into data table...
CREATE DATABASE matest;
USE matest;

CREATE TABLE controls
(
id INTEGER AUTO_INCREMENT,
participant_id INTEGER,
weight TEXT,
height TEXT,
waist_size TEXT,
heart_rate TEXT,
systolic_blood TEXT,
diastolic_blood TEXT,
created TEXT COMMENT 'Should be on bellow format:
YYYY-MM-DDTHH:MM:SSZ+HH:MM

For instance:
2016-01-27T00:25:51Z+02:00

Reference: ISO 8601',
PRIMARY KEY (id)
);

CREATE TABLE participants
(
id INTEGER AUTO_INCREMENT,
name TEXT,
surname TEXT,
gender INTEGER COMMENT '1 = Men
2 = Women

Reference: ISO/IEC 5218',
birthday TEXT COMMENT 'Should be on bellow format:
YYYY-MM-DDTHH:MM:SSZ+HH:MM

For instance:
2016-01-27T00:25:51Z+02:00

Reference: ISO 8601',
photo BLOB,
trash INTEGER COMMENT '1 = (true) has been deleted
2 = (false) visible to all users

Note: we never delete data, we hide them.',
created TEXT COMMENT 'Should be on bellow format:
YYYY-MM-DDTHH:MM:SSZ+HH:MM

For instance:
2016-01-27T00:25:51Z+02:00

Reference: ISO 8601',
last_updated TEXT COMMENT 'Should be on bellow format:
YYYY-MM-DDTHH:MM:SSZ+HH:MM

For instance:
2016-01-27T00:25:51Z+02:00

Reference: ISO 8601',
PRIMARY KEY (id)
);

CREATE TABLE tests
(
id INTEGER AUTO_INCREMENT,
participant_id INTEGER,
type_test INTEGER COMMENT 'Test types defined on this database:

1 = Walking test
2 = Strength test
3 = Balance test',
test_option INTEGER COMMENT 'This find will be used only for Balance test, which has a variety of 4 options:

1 = Feet together
2 = Sem-tandem
3 = Tandem
4 = One leg',
beginning_sensor_collection_timestamp TEXT COMMENT 'Should be on bellow format:
YYYY-MM-DDTHH:MM:SSZ+HH:MM

For instance:
2016-01-27T00:25:51Z+02:00

Reference: ISO 8601',
finishing_sensor_collection_timestamp TEXT COMMENT 'Should be on bellow format:
YYYY-MM-DDTHH:MM:SSZ+HH:MM

For instance:
2016-01-27T00:25:51Z+02:00

Reference: ISO 8601',
q1 TEXT,
q2 TEXT,
q3 TEXT,
q4 TEXT,
q5 TEXT,
q6 TEXT,
q7 TEXT,
q8 TEXT,
q9 TEXT,
q10 TEXT,
data_evaluation_score INTEGER,
data_evaluation_description TEXT,
status TEXT COMMENT 'sensorStarted: The user started a test by pressing respective button at CountDownActivity.

sensorStopped: The user stopped the test by pressing respective button at CountDownActivity.

sensorRestarted: The user restarted the test by pressing respective b',
last_updated TEXT COMMENT 'Should be on bellow format:
YYYY-MM-DDTHH:MM:SSZ+HH:MM

For instance:
2016-01-27T00:25:51Z+02:00

Reference: ISO 8601',
PRIMARY KEY (id)
);

CREATE TABLE technicals
(
id INTEGER AUTO_INCREMENT,
participant_id INTEGER,
test_id INTEGER,
mobile_model TEXT,
mobile_brand TEXT,
mobile_android_api TEXT,
app_version TEXT,
created TEXT COMMENT 'Should be on bellow format:
YYYY-MM-DDTHH:MM:SSZ+HH:MM

For instance:
2016-01-27T00:25:51Z+02:00

Reference: ISO 8601',
PRIMARY KEY (id)
);

CREATE TABLE users
(
id INTEGER AUTO_INCREMENT,
name TEXT,
surname TEXT,
gender INTEGER COMMENT '1 = Men
2 = Women

Reference: ISO/IEC 5218',
email TEXT,
password TEXT COMMENT 'Encrypted with MD5',
activation_code TEXT,
activation_status INTEGER COMMENT '1 = (true) activated
2 = (false) unactivated',
trash INTEGER DEFAULT false COMMENT '1 = (true) has been deleted
2 = (false) visible to all users

Note: we never delete data, we hide them.',
created TEXT COMMENT 'Should be on bellow format:
YYYY-MM-DDTHH:MM:SSZ+HH:MM

For instance:
2016-01-27T00:25:51Z+02:00

Reference: ISO 8601',
last_updated TEXT COMMENT 'Should be on bellow format:
YYYY-MM-DDTHH:MM:SSZ+HH:MM

For instance:
2016-01-27T00:25:51Z+02:00

Reference: ISO 8601',
PRIMARY KEY (id)
);

CREATE TABLE sensor_linear_acceleration
(
participant_id INTEGER,
test_id INTEGER,
accuracy TEXT COMMENT 'Accuracy of the event (http://developer.android.com/reference/android/hardware/SensorManager.html#SENSOR_STATUS_ACCURACY_HIGH)',
x TEXT,
y TEXT,
z TEXT,
created TEXT COMMENT 'Should be on bellow format:
YYYY-MM-DDTHH:MM:SSZ+HH:MM

For instance:
2016-01-27T00:25:51Z+02:00

Reference: ISO 8601'
);

CREATE TABLE sensor_orientation
(
participant_id INTEGER,
test_id INTEGER,
azimuth TEXT,
pitch TEXT,
roll TEXT,
created TEXT COMMENT 'Should be on bellow format:
YYYY-MM-DDTHH:MM:SSZ+HH:MM

For instance:
2016-01-27T00:25:51Z+02:00

Reference: ISO 8601'
);

CREATE TABLE sessions
(
id INTEGER AUTO_INCREMENT,
user_id INTEGER,
created TEXT COMMENT 'Should be on bellow format:
YYYY-MM-DDTHH:MM:SSZ+HH:MM

For instance:
2016-01-27T00:25:51Z+02:00

Reference: ISO 8601',
PRIMARY KEY (id)
);

INSERT INTO participants (name, surname, gender, birthday, trash, created, last_updated) VALUES ('PlaceholderName1', 'PlaceholderSurname1', 1, '2090-01-27T00:25:51Z+02:00', 2, '2010-01-27T00:25:51Z+02:00', '2018-01-27T00:25:51Z+02:00');
INSERT INTO participants (name, surname, gender, birthday, trash, created, last_updated) VALUES ('PlaceholderName2', 'PlaceholderSurname2', 2, '2090-01-27T00:25:51Z+02:00', 2, '2010-01-27T00:25:51Z+02:00', '2018-01-27T00:25:51Z+02:00');

DROP TABLE IF EXISTS user_infini;
create table IF NOT EXISTS user_infini(
`user_id` varchar(10) NOT NULL ,
`password` varchar(20) NOT NULL ,
`created_date` timestamp NOT NULL ,
`last_updated_date` timestamp NOT NULL 
,PRIMARY KEY(`user_id`));

DROP TABLE IF EXISTS user_agent;
create table IF NOT EXISTS user_agent(
`agent_id` varchar(10) NOT NULL ,
`agent_name` varchar(10) NOT NULL ,
`store_name` nvarchar(255) NOT NULL ,
`pcc` nvarchar(255) NOT NULL ,
`password` varchar(20) NULL ,
`mail_address` varchar(50) NOT NULL ,
`delete_flg` varchar(255) NOT NULL  COMMENT '0: 有効
1: 削除済',
`created_date` timestamp NOT NULL ,
`last_updated_date` timestamp NOT NULL 
,PRIMARY KEY(`agent_id`));

DROP TABLE IF EXISTS user_corporate;
create table IF NOT EXISTS user_corporate(
`agent_id` varchar(10) NOT NULL ,
`coporate_id` varchar(10) NOT NULL ,
`coporate_name` nvarchar(255) NULL ,
`agent_name` nvarchar(255) NOT NULL ,
`password` varchar(20) NOT NULL ,
`mail_address` varchar(50) NOT NULL ,
`referrer_url` varchar(255) NOT NULL ,
`logo_path` varchar(255) NOT NULL ,
`background_path` varchar(255) NOT NULL ,
`search_valid_date` int NOT NULL ,
`lcc_airline_list` varchar(255) NOT NULL ,
`display_hotel` int NOT NULL  COMMENT '0: 非表示
1: 表示',
`display_rental_car` int NOT NULL  COMMENT '0: 非表示
1: 表示',
`display_local_transportation` int NOT NULL  COMMENT '0: 非表示
1: 表示',
`display_visa_service` int NOT NULL  COMMENT '0: 非表示
1: 表示',
`display_wifi` int NOT NULL  COMMENT '0: 非表示
1: 表示',
`display_insurance` int NOT NULL  COMMENT '0: 非表示
1: 表示',
`display_other1` nvarchar(20) NOT NULL ,
`display_other2` nvarchar(20) NOT NULL ,
`footer_html` varchar(255) NOT NULL  COMMENT 'HTMLフォーマット',
`norification_html` varchar(255) NULL ,
`to` varchar(255) NOT NULL ,
`bcc` varchar(255) NOT NULL ,
`signature` varchar(255) NOT NULL ,
`delete_flg` int NOT NULL  COMMENT '0: 有効
1: 無効',
`created_date` timestamp NOT NULL ,
`last_updated_date` timestamp NOT NULL 
,PRIMARY KEY(`agent_id`,`coporate_id`));

DROP TABLE IF EXISTS user_secret_question;
create table IF NOT EXISTS user_secret_question(
`agent_id` varchar(10) NOT NULL ,
`corporate_id` varchar(10) NOT NULL ,
`question_id` int NULL ,
`question` nvarchar(255) NOT NULL  COMMENT '0: 権限なし
1: 権限あり',
`answer` nvarchar(255) NOT NULL ,
`created_date` timestamp NOT NULL ,
`last_updated_date` timestamp NOT NULL 
,PRIMARY KEY(`agent_id`,`corporate_id`,`question_id`));

DROP TABLE IF EXISTS request_item;
create table IF NOT EXISTS request_item(
`request_id` varchar(30) NOT NULL ,
`agent_id` varchar(10) NOT NULL ,
`corporate_id` varchar(10) NOT NULL ,
`requestor_name` nvarchar(30) NOT NULL ,
`requestor_phone` varchar(15) NOT NULL ,
`to` varchar(50) NOT NULL ,
`cc` varchar(255) NOT NULL ,
`num_of_adt` int NOT NULL ,
`num_of_cnn` int NOT NULL ,
`num_of_ins` int NOT NULL ,
`num_of_inf` int NOT NULL ,
`request_type` int NULL  COMMENT '0: 見積もり
1: 予約
9: その他',
`prefer_condition` int NOT NULL  COMMENT '0: 料金
1: 日程
2: 航空会社
9: 特になし',
`prefer_class` int NOT NULL  COMMENT '0: エコノミー
1: プレミアムエコノミー
2: ビジネス
3: ファースト',
`prefer_fare` int NOT NULL  COMMENT '0: 特になし
1: 最安運賃
2: 条件優先',
`changeable` int NOT NULL  COMMENT '0: チェックなし
1: チェックあり',
`refundable` int NOT NULL  COMMENT '0: チェックなし
1: チェックあり',
`other_request` nvarchar(50) NULL ,
`free_text` nvarchar(255) NULL ,
`created_date` timestamp NOT NULL ,
`last_updated_date` timestamp NOT NULL 
,PRIMARY KEY(`request_id`));

DROP TABLE IF EXISTS request_passenger;
create table IF NOT EXISTS request_passenger(
`request_id` varchar(30) NOT NULL ,
`passenger_no` int NOT NULL ,
`full_name_kanji` nvarchar(30) NOT NULL ,
`full_name_romaji` varchar(50) NOT NULL ,
`gender` varchar(1) NOT NULL  COMMENT 'M:男性
F:女性',
`mileage_number` int NULL ,
`date_of_birth` date NULL ,
`seat_request` varchar(10) NULL  COMMENT '1: 特になし
2: 窓側
3: 通路側',
`meal_reaquest` date NULL  COMMENT '1: 特にな
2: 野菜職(乳製品、卵を含まない)',
`passport_number` varchar(3) NULL ,
`passport_valid_date` date NULL ,
`nationality` varchar(10) NULL ,
`issued_country` varchar(10) NULL ,
`created_date` timestamp NULL ,
`last_updated_date` timestamp NULL 
,PRIMARY KEY(`request_id`,`passenger_no`));

DROP TABLE IF EXISTS request_flight;
create table IF NOT EXISTS request_flight(
`request_id` varchar(30) NOT NULL ,
`segment_no` int NOT NULL ,
`carrier` varchar(2) NOT NULL ,
`flight_number` varchar(4) NOT NULL ,
`departure_airport` varchar(3) NOT NULL ,
`departure_date` date NOT NULL ,
`departure_time` varchar(4) NOT NULL ,
`arrival_airport` varchar(3) NOT NULL ,
`arrival_date` varchar(4) NOT NULL ,
`arrival_time` date NOT NULL ,
`connection_indicator` int NOT NULL  COMMENT '0:インジケータ無し
1:ConnectionInd=""Y"" ',
`prefer_flight` int NOT NULL  COMMENT '0: チェックなし
1: チェックあり',
`created_date` timestamp NOT NULL ,
`last_updated_date` timestamp NOT NULL 
,PRIMARY KEY(`request_id`,`segment_no`));

DROP TABLE IF EXISTS mst_alliance;
create table IF NOT EXISTS mst_alliance(
`id` int NOT NULL ,
`carrier_code` varchar(2) NOT NULL ,
`alliance_code` varchar(1) NOT NULL  COMMENT 'A: Star Alliance
O: One World
S: Sky Team',
`delete_flg` int NOT NULL  COMMENT '0: 有効
1: 無効',
`created_date` timestamp NULL ,
`last_updated_date` timestamp NULL 
,PRIMARY KEY(`id`,`carrier_code`));


DROP TABLE IF EXISTS mst_city;
create table IF NOT EXISTS mst_city(
`id` int NOT NULL ,
`city_code` varchar(3) NOT NULL ,
`country_code` varchar(2) NOT NULL ,
`city_name_jp` nvarchar(50) NULL ,
`city_name_en` nvarchar(50) NULL ,
`yobi1` nvarchar(50) NULL ,
`yobi2` nvarchar(50) NULL ,
`yobi3` nvarchar(50) NULL ,
`yobi4` nvarchar(50) NULL ,
`yobi5` nvarchar(50) NULL ,
`delete_flg` int NOT NULL  COMMENT '0: 有効
1: 無効',
`created_date` timestamp NULL ,
`last_updated_date` timestamp NULL 
,PRIMARY KEY(`id`,`city_code`));

DROP TABLE IF EXISTS mst_airport;
create table IF NOT EXISTS mst_airport(
`id` int NOT NULL ,
`airport_code` varchar(3) NOT NULL ,
`city_code` varchar(3) NOT NULL ,
`airport_name_jp` nvarchar(50) NULL ,
`airport_name_en` nvarchar(50) NULL ,
`yobi1` nvarchar(50) NULL ,
`yobi2` nvarchar(50) NULL ,
`yobi3` nvarchar(50) NULL ,
`yobi4` nvarchar(50) NULL ,
`yobi5` nvarchar(50) NULL ,
`delete_flg` int NOT NULL  COMMENT '0: 有効
1: 無効',
`created_date` timestamp NULL ,
`last_updated_date` timestamp NULL 
,PRIMARY KEY(`id`,`airport_code`));

DROP TABLE IF EXISTS mst_carrier;
create table IF NOT EXISTS mst_carrier(
`id` int NOT NULL ,
`carrier_code` varchar(2) NOT NULL ,
`country_code` varchar(2) NOT NULL ,
`carrier_name_jp` nvarchar(50) NULL ,
`carrier_name_en` nvarchar(50) NULL ,
`yobi1` nvarchar(50) NULL ,
`yobi2` nvarchar(50) NULL ,
`yobi3` nvarchar(50) NULL ,
`yobi4` nvarchar(50) NULL ,
`yobi5` nvarchar(50) NULL ,
`delete_flg` int NOT NULL  COMMENT '0: 有効
1: 無効',
`created_date` timestamp NULL ,
`last_updated_date` timestamp NULL 
,PRIMARY KEY(`id`,`carrier_code`));

DROP TABLE IF EXISTS mst_country;
create table IF NOT EXISTS mst_country(
`id` int NOT NULL ,
`carrier_code` varchar(2) NOT NULL ,
`country_name_jp` nvarchar(50) NOT NULL ,
`carrier_name_en` nvarchar(50) NOT NULL ,
`yobi1` nvarchar(50) NULL ,
`yobi2` nvarchar(50) NULL ,
`yobi3` nvarchar(50) NULL ,
`yobi4` nvarchar(50) NULL ,
`yobi5` nvarchar(50) NULL ,
`delete_flg` int NOT NULL  COMMENT '0: 有効
1: 無効',
`created_date` timestamp NULL ,
`last_updated_date` timestamp NULL 
,PRIMARY KEY(`id`,`carrier_code`));

DROP TABLE IF EXISTS mst_equipment;
create table IF NOT EXISTS mst_equipment(
`id` int NOT NULL ,
`equipment_code` varchar(3) NOT NULL ,
`equipment_name_jp` nvarchar(50) NOT NULL ,
`equipment_name_en` nvarchar(50) NOT NULL ,
`yobi1` nvarchar(50) NULL ,
`yobi2` nvarchar(50) NULL ,
`yobi3` nvarchar(50) NULL ,
`yobi4` nvarchar(50) NULL ,
`yobi5` nvarchar(50) NULL ,
`delete_flg` int NOT NULL  COMMENT '0: 有効
1: 無効',
`created_date` timestamp NULL ,
`last_updated_date` timestamp NULL 
,PRIMARY KEY(`id`,`equipment_code`));

DROP TABLE IF EXISTS mst_question;
create table IF NOT EXISTS mst_question(
`id` int NOT NULL ,
`question_code` varchar(4) NOT NULL ,
`question_content_jp` nvarchar(100) NOT NULL ,
`question_content_en` nvarchar(100) NOT NULL ,
`yobi1` nvarchar(100) NULL ,
`yobi2` nvarchar(100) NULL ,
`yobi3` nvarchar(100) NULL ,
`yobi4` nvarchar(100) NULL ,
`yobi5` nvarchar(100) NULL ,
`delete_flg` int NOT NULL  COMMENT '0: 有効
1: 無効',
`created_date` timestamp NULL ,
`last_updated_date` timestamp NULL 
,PRIMARY KEY(`id`,`question_code`));

DROP TABLE IF EXISTS mst_holiday;
create table IF NOT EXISTS mst_holiday(
`id` int NOT NULL ,
`holiday_date` varchar(8) NOT NULL ,
`holiday_name_jp` nvarchar(50) NOT NULL ,
`yobi1` nvarchar(50) NOT NULL ,
`yobi2` nvarchar(50) NULL ,
`yobi3` nvarchar(50) NULL ,
`yobi4` nvarchar(50) NULL ,
`yobi5` nvarchar(50) NULL ,
`delete_flg` int NULL  COMMENT '0: 有効
1: 無効',
`created_date` timestamp NOT NULL ,
`last_updated_date` timestamp NULL 
,PRIMARY KEY(`id`,`holiday_date`));













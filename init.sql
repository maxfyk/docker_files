--
-- Database: `youpar`
--

-- --------------------------------------------------------

CREATE DATABASE IF NOT EXISTS youpar;

USE youpar;

CREATE TABLE IF NOT EXISTS `channels`
(
 `id`                 varchar(20) NOT NULL ,
 `title`             varchar(20) NOT NULL ,
 `description`        varchar(5000) NOT NULL ,
 `custom_url`         varchar(100) NOT NULL ,
 `published_at`       datetime NOT NULL ,
 `default_language`   varchar(100) NOT NULL ,
 `views`              int NULL ,
 `subscribers`        int NULL ,
 `hidden_subscribers` bit NOT NULL ,
 `videos`             int NOT NULL ,
 `keywords`           varchar(5000) NOT NULL ,
 `country`            varchar(100) NOT NULL ,

PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `videos`
(
 `id`               varchar(20) NOT NULL ,
 `title`            varchar(100) NOT NULL ,
 `views`            int NOT NULL ,
 `likes`            int NULL ,
 `dislikes`         int NULL ,
 `comments`         int NULL ,
 `description`      varchar(5000) NULL ,
 `channel_id`       varchar(20) NOT NULL ,
 `duration`         int NOT NULL ,
 `published_at`     datetime NOT NULL ,
 `tags`             varchar(5000) NULL ,
 `default_language` varchar(100) NOT NULL ,
 `made_for_kids`    bit NOT NULL ,
 `time`             datetime NOT NULL ,

PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `videos_history`
(
 `id`          int NOT NULL ,
 `clip_id`     varchar(20) NOT NULL ,
 `views`       int NOT NULL ,
 `likes`       int NOT NULL ,
 `dislikes`    int NOT NULL ,
 `comments`    int NOT NULL ,
 `change_date` datetime NOT NULL ,
 `time`        datetime NOT NULL ,

PRIMARY KEY (`id`)
);
CREATE TABLE IF NOT EXISTS `comments`
(
 `id`                varchar(20) NOT NULL ,
 `video_id`          varchar(20) NOT NULL ,
 `channel_id`        varchar(20) NOT NULL ,
 `author_name`       varchar(100) NOT NULL ,
 `author_channel_id` varchar(20) NOT NULL ,
 `text`              varchar(10000) NOT NULL ,
 `parent_id`         varchar(20) NULL ,
 `can_rate`          bit NOT NULL ,
 `likes`             int NULL ,
 `viewer_rating`     varchar(50) NOT NULL ,
 `published_at`      datetime NOT NULL ,
 `updated_at`        datetime NULL ,
 `time`              datetime NOT NULL ,

PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `run_logs`
(
 `id`            int NOT NULL ,
 `table_version` varchar(100) NOT NULL ,
 `code_version`  varchar(100) NOT NULL ,
 `time`          datetime NOT NULL ,

PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS  `tasks`
(
 `id`         int NOT NULL ,
 `channel_id` varchar(20) NOT NULL ,
 `added_on` datetime NOT NULL ,

PRIMARY KEY (`id`)
);

INSERT INTO  tasks (id, channel_id, added_on) VALUES   (2, 'sadsadsad', NOW());

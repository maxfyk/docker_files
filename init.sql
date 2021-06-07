--
-- Database: `youpar`
--

-- --------------------------------------------------------

CREATE DATABASE IF NOT EXISTS youpar;

USE youpar;

SELECT CONCAT( 'DROP TABLE ', GROUP_CONCAT(table_name) , ';' )
    AS statement FROM information_schema.tables
    WHERE table_name LIKE '_tmp%';

CREATE TABLE IF NOT EXISTS `channels`
(
 `id`                varchar(30)  NOT NULL,
 `title`             varchar(30)  ,
 `description`        varchar(5000)  ,
 `custom_url`         varchar(100)  ,
 `published_at`       datetime  ,
 `default_language`   varchar(100)  ,
 `views`              int,
 `subscribers`        int,
 `hidden_subscribers` bit  ,
 `videos`             int  ,
 `keywords`           varchar(5000)  ,
 `country`            varchar(100)  ,

PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `videos`
(
 `id`               varchar(30) NOT NULL,
 `title`            varchar(100)  ,
 `views`            int  ,
 `likes`            int ,
 `dislikes`         int ,
 `comments`         int  ,
 `description`      varchar(5000) ,
 `channel_id`       varchar(30)  ,
 `duration`         int  ,
 `published_at`     datetime  ,
 `tags`             varchar(5000)  ,
 `default_language` varchar(100)  ,
 `made_for_kids`    bit  ,
 `time`             datetime  ,

PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `videos_history`
(
 `id`          int  NOT NULL,
 `clip_id`     varchar(30)  ,
 `views`       int  ,
 `likes`       int  ,
 `dislikes`    int  ,
 `comments`    int  ,
 `change_date` datetime  ,
 `time`        datetime  ,

PRIMARY KEY (`id`)
);
CREATE TABLE IF NOT EXISTS `comments`
(
 `id`                varchar(30)  NOT NULL,
 `video_id`          varchar(30)  ,
 `channel_id`        varchar(30)  ,
 `author_name`       varchar(100)  ,
 `author_channel_id` varchar(30)  ,
 `text`              varchar(10000)  ,
 `parent_id`         varchar(30)  ,
 `can_rate`          bit  ,
 `likes`             int  ,
 `viewer_rating`     varchar(50)  ,
 `published_at`      datetime  ,
 `updated_at`        datetime  ,
 `time`              datetime  ,

PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `run_logs`
(
 `id`            int NOT NULL ,
 `table_version` varchar(100)  ,
 `code_version`  varchar(100)  ,
 `time`          datetime  ,

PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS  `tasks`
(
 `id`         int  NOT NULL,
 `channel_id` varchar(30)  ,
 `added_on` datetime  ,

PRIMARY KEY (`id`)
);

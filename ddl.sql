DROP TABLE IF EXISTS `all_streams`;
DROP TABLE IF EXISTS `streams`;
DROP TABLE IF EXISTS `events`;
DROP TABLE IF EXISTS `channels`;

CREATE TABLE `channels` (
  `id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `events` (
  `id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `something` varchar(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `streams` (
  `id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `link` varchar(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `all_streams` (
  `event_id` int(11),
  `stream_id` int(11),
  `channel_id` int(11),
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `fk_streams` (`stream_id`),
  KEY `fk_events` (`event_id`),
  KEY `fk_channels` (`channel_id`),
  CONSTRAINT `fk_channels` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_events` FOREIGN KEY (`event_id`) REFERENCES `events` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_streams` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- seed data
INSERT INTO `channels` (`name`)      VALUES ('channel 1');
INSERT INTO `events`   (`something`) VALUES ('event   1');

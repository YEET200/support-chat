CREATE DATABASE IF NOT EXISTS `phpsupportchat_advanced` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `phpsupportchat_advanced`;

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `role` enum('Guest','Operator','Admin') NOT NULL,
  `secret` varchar(255) NOT NULL DEFAULT '',
  `last_seen` datetime NOT NULL,
  `status` enum('Occupied','Waiting','Idle','Away') NOT NULL DEFAULT 'Idle',
  `photo_url` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(255) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `accounts` (`id`, `email`, `password`, `full_name`, `role`, `secret`, `last_seen`, `status`, `photo_url`, `ip`, `user_agent`, `registered`) VALUES
(1, 'admin@example.com', '$2y$10$ZU7Jq5yZ1U/ifeJoJzvLbenjRyJVkSzmQKQc.X0KDPkfR3qs/iA7O', 'Admin', 'Admin', '', '2022-06-14 12:00:00', 'Idle', '', '', '', '2022-06-14 12:00:00'),
(2, 'operator@example.com', '$2y$10$thE7hIJF/EJvKjmJy7hd5uH3a/BNgSUepkYoES0q80YEzi7VqWsRG', 'Operator', 'Operator', '', '2022-06-14 12:00:00', 'Idle', '', '', '', '2022-06-14 12:00:00');

CREATE TABLE IF NOT EXISTS `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_sender_id` int(11) NOT NULL,
  `account_receiver_id` int(11) NOT NULL,
  `submit_date` datetime NOT NULL,
  `status` enum('Open','Archived') NOT NULL DEFAULT 'Open',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `attachments` text NOT NULL,
  `submit_date` datetime NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `presets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `presets` (`id`, `msg`) VALUES
(1, 'Thank you for choosing our website! If there is anything else you need, don\'t hesitate to contact us!'),
(2, 'Hi {name}, how may I help you today?');

CREATE TABLE IF NOT EXISTS `word_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) NOT NULL,
  `replacement` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
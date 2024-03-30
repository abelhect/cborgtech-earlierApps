
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `status`;
DROP TABLE IF EXISTS `workflow_item`;
DROP TABLE IF EXISTS `workflow`;
DROP TABLE IF EXISTS `texts`;
DROP TABLE IF EXISTS `langtexts`;
DROP TABLE IF EXISTS `user_ref`;
DROP TABLE IF EXISTS `directories`;
DROP TABLE IF EXISTS `shared_directories`;
DROP TABLE IF EXISTS `attachments`;
DROP TABLE IF EXISTS `attachment_thumbnail`;
DROP TABLE IF EXISTS `event_attachment`;
DROP TABLE IF EXISTS `attachments_meta`;
DROP TABLE IF EXISTS `bundles`;
DROP TABLE IF EXISTS `categories`;

DROP TABLE IF EXISTS `page_form_field_value`;
DROP TABLE IF EXISTS `page_form_field_name`;
DROP TABLE IF EXISTS `page_label_value`;
DROP TABLE IF EXISTS `page_label_name`;
DROP TABLE IF EXISTS `page_text_value`;
DROP TABLE IF EXISTS `page_text_name`;
DROP TABLE IF EXISTS `page_option_value`;
DROP TABLE IF EXISTS `page_option_name`;
DROP TABLE IF EXISTS `page_name`;

DROP TABLE IF EXISTS `activities`;
DROP TABLE IF EXISTS `acquaintances`;
DROP TABLE IF EXISTS `invites`;
DROP TABLE IF EXISTS `email_invites`;
DROP TABLE IF EXISTS `images`;
DROP TABLE IF EXISTS `videos`;
DROP TABLE IF EXISTS `menus`;
DROP TABLE IF EXISTS `menu_items`;
DROP TABLE IF EXISTS `menu_item_values`;
DROP TABLE IF EXISTS `events`;
DROP TABLE IF EXISTS `social_groups`;
DROP TABLE IF EXISTS `social_groups_app_user`;
DROP TABLE IF EXISTS `social_group_discussions`;
DROP TABLE IF EXISTS `social_group_discussion_comments`;
DROP TABLE IF EXISTS `social_group_private_invite`;
DROP TABLE IF EXISTS `social_group_public_request`;
DROP TABLE IF EXISTS `messages`;
DROP TABLE IF EXISTS `notes`;
DROP TABLE IF EXISTS `note_catagory`;
DROP TABLE IF EXISTS `watch_groups`;
DROP TABLE IF EXISTS `watch_group_members`;	
DROP TABLE IF EXISTS `language`;
DROP TABLE IF EXISTS `locations`;
DROP TABLE IF EXISTS `fu_exercise`;
DROP TABLE IF EXISTS `service_class`;

	
CREATE TABLE `texts`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`default_text` text,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `langtexts`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`text_id` bigint(20) NOT NULL,
	`lang` varchar(5) NOT NULL,
	`text` text,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_text_lang` (`text_id`,`lang`),
	FOREIGN KEY (`text_id`) REFERENCES `texts` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `user_ref`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`ref_id` bigint(20) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_ref_id` (`ref_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

	
CREATE TABLE `category`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name_id` bigint(20) NOT NULL,
	`code` varchar(100) NOT NULL,
	`category_group` varchar(200) NOT NULL,
	`category_order` INT NOT NULL DEFAULT 1,
	`parent_id` bigint(20) DEFAULT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_code` (`category_group`,`code`),
	FOREIGN KEY (`name_id`) REFERENCES `texts` (`id`),
	FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `status`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name_id` bigint(20) NOT NULL,
	`code` varchar(100) NOT NULL,
	`status_group` varchar(200) NOT NULL,
	`status_order` INT NOT NULL DEFAULT 1,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_code` (`status_group`,`code`),
	FOREIGN KEY (`name_id`) REFERENCES `texts` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `workflow`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name_id` bigint(20) NOT NULL,
	`code` varchar(100) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_code` (`code`),
	FOREIGN KEY (`name_id`) REFERENCES `texts` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `workflow_item`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name_id` bigint(20) NOT NULL,
	`code` varchar(100) NOT NULL,
	`flow_order` INT NOT NULL DEFAULT 1,
	`workflow_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_code` (`code`),
	FOREIGN KEY (`name_id`) REFERENCES `texts` (`id`),
	FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `directories`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`owner_id` bigint(20) NOT NULL,
	`parent_id` bigint(20),
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`parent_id`) REFERENCES `directories` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `shared_directories`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`receiver_id` bigint(20) NOT NULL,
	`directory_id` bigint(20) NOT NULL,
	`permission` varchar(4) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`directory_id`) REFERENCES `directories` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `attachments`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`data` longblob NOT NULL,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `attachment_thumbnail`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`data` mediumblob NOT NULL,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `attachments_meta`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`user_id` bigint(20) NOT NULL,
	`title` varchar(512) NOT NULL,
	`file_name` varchar(1024) NOT NULL,
	`file_path` varchar(2048),
	`comment` varchar(2048),
	`size` bigint(20),
	`content_type` varchar(50),
	`data_id` bigint(20) NOT NULL,
	`thumbnail_id` bigint(20),
	`directory_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`data_id`) REFERENCES `attachments` (`id`),
	FOREIGN KEY (`thumbnail_id`) REFERENCES `attachment_thumbnail` (`id`),
	FOREIGN KEY (`directory_id`) REFERENCES `directories` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `bundles`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`domain` varchar(50) NOT NULL,
	`appuser_id` bigint(20) NOT NULL,
	`limit_one` INT DEFAULT 1,
	`limit_two` INT DEFAULT 1,
	`limit_three` INT DEFAULT 1,
	`limit_four` INT DEFAULT 1,
	`limit_five` INT DEFAULT 1,
	`limit_six` INT DEFAULT 1,
	`limit_seven` INT DEFAULT 1,
	`limit_eight` INT DEFAULT 1,
	`limit_nine` INT DEFAULT 1,
	`limit_ten` INT DEFAULT 1,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_bundle_key` (`name`,`domain`,`appuser_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `categories`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name_id` bigint(20) NOT NULL,
	`code` varchar(40) NOT NULL,
	`parent_id` bigint(20),
	`sort_order` INT NOT NULL DEFAULT 0,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`name_id`) REFERENCES `texts` (`id`),
	FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;	

CREATE TABLE `page_name`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(120) NOT NULL,
	`text_id` bigint(20) NOT NULL,
	`category` varchar(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_page_name` (`name`),
	FOREIGN KEY (`text_id`) REFERENCES `texts` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
			
CREATE TABLE `page_form_field_name`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`page_name_id` bigint(20) NOT NULL,
	`name` varchar(120) NOT NULL,
	`text_id` bigint(20) NOT NULL,
	`field_type` varchar(25) NOT NULL,
	`html_type` varchar(25),
	`tab_index` int DEFAULT 1,
	`row_count` int,
	`column_count` int,
	`group_name` varchar(48),
	`sub_group_name` varchar(48),
	`class_name` varchar(120),
	`optional_params` text DEFAULT NULL,
	`class_model` text DEFAULT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_page_form_field_name` (`name`),
	FOREIGN KEY (`text_id`) REFERENCES `texts` (`id`),
	FOREIGN KEY (`page_name_id`) REFERENCES `page_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
			
CREATE TABLE `page_form_field_value`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`page_form_field_name_id` bigint(20) NOT NULL,
	`field_value` text DEFAULT NULL,
	`field_label` varchar(512) DEFAULT NULL,
	`lang` varchar(5) NOT NULL,
	`rendered` bit(1) NOT NULL DEFAULT 1,
	`required` bit(1) NOT NULL DEFAULT 0,
	`sort_order` bigint(20) NOT NULL DEFAULT 0,
	`validation` text DEFAULT NULL,
	`image_path` varchar(512) DEFAULT NULL,
	`sub_element_id` bigint(20) DEFAULT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`page_form_field_name_id`) REFERENCES `page_form_field_name` (`id`),
	FOREIGN KEY (`sub_element_id`) REFERENCES `page_form_field_value` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `page_label_name`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`page_name_id` bigint(20) NOT NULL,
	`name` varchar(120) NOT NULL,
	`text_id` bigint(20) NOT NULL,
	`class_name` varchar(120),
	`tab_index` int DEFAULT 1,
	`optional_params` text DEFAULT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_page_label_name` (`name`),
	FOREIGN KEY (`text_id`) REFERENCES `texts` (`id`),
	FOREIGN KEY (`page_name_id`) REFERENCES `page_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `page_label_value`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`page_label_name_id` bigint(20) NOT NULL,
	`label_value` varchar(120) DEFAULT NULL,
	`lang` char(5) NOT NULL,
	`rendered` bit(1) NOT NULL DEFAULT 1,
	`sort_order` bigint(20) NOT NULL DEFAULT 0,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`page_label_name_id`) REFERENCES `page_label_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `page_text_name`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`page_name_id` bigint(20) NOT NULL,
	`name` varchar(120) NOT NULL,
	`text_id` bigint(20) NOT NULL,
	`class_name` varchar(120),
	`tab_index` int DEFAULT 1,
	`optional_params` text DEFAULT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_page_text_name` (`name`),
	FOREIGN KEY (`text_id`) REFERENCES `texts` (`id`),
	FOREIGN KEY (`page_name_id`) REFERENCES `page_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `page_text_value`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`page_text_name_id` bigint(20) NOT NULL,
	`text_value` longtext,
	`lang` varchar(5) NOT NULL,
	`rendered` bit(1) NOT NULL DEFAULT 1,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`page_text_name_id`) REFERENCES `page_text_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `page_option_name`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`page_name_id` bigint(20) NOT NULL,
	`name` varchar(120) NOT NULL,
	`text_id` bigint(20) NOT NULL,
	`optional_params` text DEFAULT NULL,
	`value_type` varchar(120) DEFAULT NULL,
	`default_value` varchar(120) DEFAULT NULL,
	`use_default` bit(1) NOT NULL DEFAULT 0,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_page_option_name` (`name`),
	FOREIGN KEY (`text_id`) REFERENCES `texts` (`id`),
	FOREIGN KEY (`page_name_id`) REFERENCES `page_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `page_option_value` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`page_option_name_id` bigint(20) NOT NULL,
	`option_value` longtext,
	`lang` varchar(5) NOT NULL,
	`rendered` bit(1) NOT NULL DEFAULT 1,
	`validation` text,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`page_option_name_id`) REFERENCES `page_option_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
			
CREATE TABLE `activities` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`message_short` varchar(255) NOT NULL,
	`message` varchar(4096),
	`user_id` bigint(20) NOT NULL,
	`status_color` varchar(50) DEFAULT "#999999",
	`status_icon` varchar(50) DEFAULT "green_status.png",
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `acquaintances` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`user_id` bigint(20) NOT NULL,
	`acquaintance_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_acquaintance` (`user_id`,`acquaintance_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
			
CREATE TABLE `invites` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`sender_id` bigint(20) NOT NULL,
	`receiver_id` bigint(20) NOT NULL,
	`subject` varchar(255) NOT NULL,
	`message` varchar(2048) NOT NULL,
	`status` varchar(4) NOT NULL DEFAULT "PEND",
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `email_invites` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`sender_id` bigint(20) NOT NULL,
	`receiver_email` varchar(255) NOT NULL,
	`subject` varchar(255) NOT NULL,
	`message` varchar(2048) NOT NULL,
	`status` varchar(4) NOT NULL DEFAULT "PEND",
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `images` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`image` MEDIUMBLOB NOT NULL,
	`name` varchar(255) NOT NULL,
	`ext` varchar(4) NOT NULL,
	`url_link` varchar(256),
	`user_id` bigint(20) NOT NULL,
	`lang` varchar(5) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_imagename` (`name`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `videos` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`ext` varchar(4) NOT NULL,
	`lang` varchar(5) NOT NULL,
	`user_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `menus` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`code` varchar(255) NOT NULL,
	`category` varchar(20) NOT NULL,
	`title_id` bigint(20) NOT NULL,
	`api_version` varchar(20) NOT NULL,
	`app_version` varchar(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_menu` (`code`,`api_version`,`app_version`),
	FOREIGN KEY (`title_id`) REFERENCES `texts` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `menu_items` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`code` varchar(255) NOT NULL,
	`menu_id` bigint(20) NOT NULL,
	`parent_id` bigint(20),
	`permission_code` varchar(255),
	`sort_order` INT NOT NULL DEFAULT 0,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
	FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `menu_item_values`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`menu_item_id` bigint(20) NOT NULL,
	`menu_value` varchar(100),
	`href` varchar(512),
	`image` varchar(512),
	`lang` varchar(5) NOT NULL,
	`rendered` bit(1) NOT NULL DEFAULT 1,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `events` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`code` varchar(100),
	`message` varchar(4096),
	`user_id` bigint(20) NOT NULL,
	`status_color` varchar(50) DEFAULT "#999999",
	`status_icon` varchar(50) DEFAULT "green_status.png",
	`latitude` double,
	`longitude` double,
	`accuracy` float,
	`altitude` double,
	`provider` varchar(50),
	`s1` varchar(100),
	`s2` varchar(100),
	`s3` varchar(100),
	`s4` varchar(100),
	`s5` varchar(100),
	`b1` bit(1) DEFAULT 0,
	`b2` bit(1) DEFAULT 0,
	`b3` bit(1) DEFAULT 0,
	`i1` int,
	`i2` int,
	`i3` int,
	`d1` double,
	`d2` double,
	`d3` double,
	`l1` BIGINT,
	`l2` BIGINT,
	`l3` BIGINT,
	`f1` float,
	`f2` float,
	`f3` float,
	`bd1` decimal,
	`bd2` decimal,
	`bd3` decimal,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `event_attachment`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`event_id` bigint(20) NOT NULL,
	`attachment_id` bigint(20) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_event_attachment` (`event_id`,`attachment_id`),
	FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
	FOREIGN KEY (`attachment_id`) REFERENCES `attachments_meta` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `social_groups` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`description` varchar(2048),
	`owner_id` bigint(20) NOT NULL,
	`status_color` varchar(50) DEFAULT "#999999",
	`status_icon` varchar(50) DEFAULT "green_status.png",
	`access` varchar(4),
	`rating` int DEFAULT 0,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `social_groups_user_ref`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`user_ref_id` bigint(20) NOT NULL,
	`social_group_id` bigint(20) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_user_ref_social_groups` (`user_ref_id`,`social_group_id`),
	FOREIGN KEY (`user_ref_id`) REFERENCES `user_ref` (`id`),
	FOREIGN KEY (`social_group_id`) REFERENCES `social_groups` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;	

CREATE TABLE `social_group_discussions` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`subject` varchar(255) NOT NULL,
	`message_short` varchar(255) NOT NULL,
	`message` varchar(4096),
	`owner_id` bigint(20) NOT NULL,
	`group_id` bigint(20) NOT NULL,
	`rating` INT DEFAULT 0,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`group_id`) REFERENCES `social_groups` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `social_group_discussion_comments` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`message_short` varchar(255) NOT NULL,
	`message` varchar(4096),
	`owner_id` bigint(20) NOT NULL,
	`discussion_id` bigint(20) NOT NULL,
	`rating` INT DEFAULT 0,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`discussion_id`) REFERENCES `social_group_discussions` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `social_group_private_invite` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`status` varchar(4) NOT NULL DEFAULT "PEND",
	`message` varchar(2048),
	`receiver_id` bigint(20) NOT NULL,
	`group_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`group_id`) REFERENCES `social_groups` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `social_group_public_request` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`status` varchar(4) NOT NULL DEFAULT "PEND",
	`message` varchar(2048),
	`sender_id` bigint(20) NOT NULL,
	`group_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`group_id`) REFERENCES `social_groups` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `messages` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`subject` varchar(255) NOT NULL,
	`message` varchar(2048),
	`receiver_id` bigint(20) NOT NULL,
	`sender_id` bigint(20) NOT NULL,
	`status_color` varchar(50) DEFAULT "#999999",
	`status_icon` varchar(50) DEFAULT "green_status.png",
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `note_catagory`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
INSERT INTO `note_catagory` (`name`,`created`) VALUES ('Default',null);

CREATE TABLE `notes`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`page` int(11) NOT NULL DEFAULT 0,
	`seq` int(11) NOT NULL DEFAULT 0,
	`note` text,
	`cat_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`cat_id`) REFERENCES `note_catagory` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `watch_groups` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`description` varchar(2048),
	`owner_id` bigint(20) NOT NULL,
	`status_color` varchar(50) DEFAULT "#999999",
	`status_icon` varchar(50) DEFAULT "green_status.png",
	`access` varchar(4),
	`rating` int DEFAULT 0,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `watch_group_user_ref`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`watch_group_id` bigint(20) NOT NULL,
	`user_ref_id` bigint(20) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_watch_group_user_ref` (`watch_group_id`,`user_ref_id`),
	FOREIGN KEY (`watch_group_id`) REFERENCES `watch_groups` (`id`),
	FOREIGN KEY (`user_ref_id`) REFERENCES `user_ref` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `language` 
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
  	`code` varchar(10) NOT NULL,
  	`text_id` bigint(20) NOT NULL,
  	`def_lang` bit(1) DEFAULT b'0',
  	`dir` varchar(3) DEFAULT 'ltr',
  	`is_active` bit(1) DEFAULT 1,
  	`is_archive` bit(1) DEFAULT b'0',
  	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
  	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
  	`version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`),
  FOREIGN KEY (`text_id`) REFERENCES `texts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE `locations`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`user_id` bigint(20) NOT NULL,
	`latitude` double NOT NULL,
	`longitude` double NOT NULL,
	`accuracy` float,
	`altitude` double,
	`provider` varchar(50),
	`message` varchar(100),
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `fu_exercise`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`user_id` bigint(20) NOT NULL,
	`start_time` bigint(20) NOT NULL,
	`end_time` bigint(20) NOT NULL,
	`elapse_time` bigint(20) NOT NULL,
	`distance` double NOT NULL,
	`units` INT DEFAULT 0 NOT NULL,
	`exercise_type` INT DEFAULT 0 NOT NULL,
	`path` longtext,
	`is_draft` bit(1) DEFAULT 0,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `service_class`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`service_name` varchar(100) NOT NULL,
	`api_version` varchar(20) NOT NULL,
	`app_version` varchar(20) NOT NULL,
	`class_name` varchar(512) NOT NULL,
	`category` varchar(100) NOT NULL,
	`location` varchar(100) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_service_name` (`service_name`,`api_version`,`app_version`,`category`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
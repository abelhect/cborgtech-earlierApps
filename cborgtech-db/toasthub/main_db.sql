DROP TABLE IF EXISTS `texts`;
DROP TABLE IF EXISTS `langtexts`;
DROP TABLE IF EXISTS `user_application`;
DROP TABLE IF EXISTS `application_role`;
DROP TABLE IF EXISTS `role_permission`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `role`;
DROP TABLE IF EXISTS `permission`;
DROP TABLE IF EXISTS `application`;

DROP TABLE IF EXISTS `clients`;
DROP TABLE IF EXISTS `clientdomains`;

DROP TABLE IF EXISTS `login_log`;
DROP TABLE IF EXISTS `sys_page_category`;

DROP TABLE IF EXISTS `sys_page_form_field_value`;
DROP TABLE IF EXISTS `sys_page_form_field_name`;
DROP TABLE IF EXISTS `sys_page_label_value`;
DROP TABLE IF EXISTS `sys_page_label_name`;
DROP TABLE IF EXISTS `sys_page_text_value`;
DROP TABLE IF EXISTS `sys_page_text_name`;
DROP TABLE IF EXISTS `sys_page_option_value`;
DROP TABLE IF EXISTS `sys_page_option_name`;
DROP TABLE IF EXISTS `sys_page_name`;



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
	
CREATE TABLE `users`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`username` varchar(128) NOT NULL,
	`password` varchar(32),
	`salt` varchar(32),
	`firstname` varchar(128) NOT NULL,
	`middlename` varchar(128),
	`lastname` varchar(128) NOT NULL,
	`zipcode` varchar(50),
	`email` varchar(128) NOT NULL,
	`challengephase1` varchar(255),
	`challengephaseanswer1` varchar(255),
	`challengephase2` varchar(255),
	`challengephaseanswer2` varchar(255),
	`challengephase3` varchar(255),
	`challengephaseanswer3` varchar(255),
	`alternateEmail` varchar(128),
	`session_token` varchar(32),
	`email_token` varchar(32),
	`email_confirm` bit(1) DEFAULT 0,
	`force_reset` bit(1) DEFAULT 0,
	`lang` varchar(10) NOT NULL,
	`log_level` varchar(10) DEFAULT 'OFF',
	`use_token` bit(1) DEFAULT 0,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`last_pass_change` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_userpass` (`username`),
	UNIQUE KEY `uk_useremail` (`email`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `application`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`code` varchar(100) NOT NULL,
	`title_id` bigint(20) NOT NULL,
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
	FOREIGN KEY (`title_id`) REFERENCES `texts` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `role`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`code` varchar(100) NOT NULL,
	`title_id` bigint(20) NOT NULL,
	`application_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_role_application` (`code`, `application_id`),
	FOREIGN KEY (`title_id`) REFERENCES `texts` (`id`),
	FOREIGN KEY (`application_id`) REFERENCES `application` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `permission`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`code` varchar(100) NOT NULL,
	`title_id` bigint(20) NOT NULL,
	`can_read` bit(1) DEFAULT 0,
	`can_write` bit(1) DEFAULT 0,
	`application_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_permission_application` (`code`, `application_id`),
	FOREIGN KEY (`title_id`) REFERENCES `texts` (`id`),
	FOREIGN KEY (`application_id`) REFERENCES `application` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `user_role`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`user_id` bigint(20) NOT NULL,
	`role_id` bigint(20) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_user_role` (`user_id`,`role_id`),
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
	FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `role_permission`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`role_id` bigint(20) NOT NULL,
	`permission_id` bigint(20) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_role_permission` (`role_id`,`permission_id`),
	FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
	FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `clientdomains`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`title_id` bigint(20) NOT NULL,
	`url_domain` varchar(125) NOT NULL,
	`app_domain` varchar(64) NOT NULL,
	`app_name` varchar(64) NOT NULL,
	`html_prefix` varchar(64) NOT NULL,
	`public_layout` varchar(128),
	`admin_layout` varchar(128),
	`member_layout` varchar(128),
	`sysadmin_layout` varchar(128),
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_url_domain` (`url_domain`),
	UNIQUE KEY `uk_url_app` (`url_domain`,`app_domain`),
	FOREIGN KEY (`title_id`) REFERENCES `texts` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `login_log`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`user_id` bigint(20) DEFAULT NULL,
	`appname` varchar(64) NOT NULL,
	`success` bit(1) DEFAULT 1,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `sys_page_category`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(120) NOT NULL,
	`text_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_sys_page_category` (`name`),
	FOREIGN KEY (`text_id`) REFERENCES `texts` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `sys_page_name`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(120) NOT NULL,
	`text_id` bigint(20) NOT NULL,
	`category_id` bigint(20) NOT NULL,
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
	FOREIGN KEY (`text_id`) REFERENCES `texts` (`id`),
	FOREIGN KEY (`category_id`) REFERENCES `sys_page_category` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `sys_page_form_field_name`
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
	`jfield_name` varchar(48) DEFAULT NULL,
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
	FOREIGN KEY (`page_name_id`) REFERENCES `sys_page_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `sys_page_form_field_value`
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
	FOREIGN KEY (`page_form_field_name_id`) REFERENCES `sys_page_form_field_name` (`id`),
	FOREIGN KEY (`sub_element_id`) REFERENCES `sys_page_form_field_value` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
		
CREATE TABLE `sys_page_label_name`
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
	FOREIGN KEY (`page_name_id`) REFERENCES `sys_page_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `sys_page_label_value`
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
	FOREIGN KEY (`page_label_name_id`) REFERENCES `sys_page_label_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
			
CREATE TABLE `sys_page_text_name`
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
	FOREIGN KEY (`page_name_id`) REFERENCES `sys_page_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
			
CREATE TABLE `sys_page_text_value`
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
	FOREIGN KEY (`page_text_name_id`) REFERENCES `sys_page_text_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
			
CREATE TABLE `sys_page_option_name`
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
	FOREIGN KEY (`page_name_id`) REFERENCES `sys_page_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
		
CREATE TABLE `sys_page_option_value` 
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
	FOREIGN KEY (`page_option_name_id`) REFERENCES `sys_page_option_name` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

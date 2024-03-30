
DROP TABLE IF EXISTS `fa_question`;
DROP TABLE IF EXISTS `fa_test_case`;
DROP TABLE IF EXISTS `fa_user_story`;
DROP TABLE IF EXISTS `fa_test_suite`;

DROP TABLE IF EXISTS `fa_feature_attachment`;
DROP TABLE IF EXISTS `fa_issue_attachment`;
DROP TABLE IF EXISTS `fa_requirement_attachment`;
DROP TABLE IF EXISTS `fa_attachments_meta`;
DROP TABLE IF EXISTS `fa_attachments`;
DROP TABLE IF EXISTS `fa_attachment_thumbnail`;
DROP TABLE IF EXISTS `fa_shared_directories`;
DROP TABLE IF EXISTS `fa_directories`;
DROP TABLE IF EXISTS `fa_requirement`;

DROP TABLE IF EXISTS `fa_issue_assignee`;
DROP TABLE IF EXISTS `fa_issue_comment`;
DROP TABLE IF EXISTS `fa_issue_hours`;
DROP TABLE IF EXISTS `fa_issue_score`;
DROP TABLE IF EXISTS `fa_issue`;

DROP TABLE IF EXISTS `fa_feature_assignee`;
DROP TABLE IF EXISTS `fa_feature_comment`;
DROP TABLE IF EXISTS `fa_feature_hours`;
DROP TABLE IF EXISTS `fa_feature_score`;
DROP TABLE IF EXISTS `fa_requirement`;
DROP TABLE IF EXISTS `fa_feature`;

DROP TABLE IF EXISTS `fa_codebranch`;
DROP TABLE IF EXISTS `fa_backlog_assignee`;
DROP TABLE IF EXISTS `fa_backlog`;
DROP TABLE IF EXISTS `fa_blueprint`;
DROP TABLE IF EXISTS `fa_release`;

CREATE TABLE `fa_blueprint`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`title` varchar(150) NOT NULL,
	`description` varchar(150),
	`owner_id` bigint(20) NOT NULL,
	`status` varchar(100) NOT NULL,
	`product_version` int DEFAULT 1,
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
	FOREIGN KEY (`parent_id`) REFERENCES `fa_blueprint` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `fa_backlog`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`title` varchar(150) NOT NULL,
	`description` varchar(150),
	`owner_id` bigint(20) NOT NULL,
	`status` varchar(100) NOT NULL,
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
	
CREATE TABLE `fa_backlog_assignee`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`notify_change` bit(1) DEFAULT 1,
	`assignee_id` bigint(20) NOT NULL,
	`backlog_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`backlog_id`) REFERENCES `fa_backlog` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	

CREATE TABLE `fa_code_branch`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(150) NOT NULL,
	`branch_ref` varchar(200),
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
	
CREATE TABLE `fa_release`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(150) NOT NULL,
	`description` varchar(150),
	`owner_id` bigint(20) NOT NULL,
	`start_date` timestamp DEFAULT '1970-01-01 00:00:01',
	`end_date` timestamp DEFAULT '1970-01-01 00:00:01',
	`deploy_date` timestamp DEFAULT '1970-01-01 00:00:01',
	`actual_start_date` timestamp DEFAULT '1970-01-01 00:00:01',
	`actual_end_date` timestamp DEFAULT '1970-01-01 00:00:01',
	`actual_deploy_date` timestamp DEFAULT '1970-01-01 00:00:01',
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

CREATE TABLE `fa_feature`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`title` varchar(150) NOT NULL,
	`description` varchar(150),
	`owner_id` bigint(20) DEFAULT NULL,
	`hour_estimate` double,
	`actual_hours` double,
	`start_date` timestamp DEFAULT '1970-01-01 00:00:01',
	`end_date` timestamp DEFAULT '1970-01-01 00:00:01',
	`creator_id` bigint(20) NOT NULL,
	`workflow_id` bigint(20) DEFAULT NULL,
	`category` varchar(100),
	`blueprint_id` bigint(20) DEFAULT NULL,
	`code_branch_id` bigint(20) DEFAULT NULL,
	`backlog_id` bigint(20) DEFAULT NULL,
	`release_id` bigint(20) DEFAULT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`id`),
	FOREIGN KEY (`blueprint_id`) REFERENCES `fa_blueprint` (`id`),
	FOREIGN KEY (`code_branch_id`) REFERENCES `fa_code_branch` (`id`),
	FOREIGN KEY (`backlog_id`) REFERENCES `fa_backlog` (`id`),
	FOREIGN KEY (`release_id`) REFERENCES `fa_release` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	

CREATE TABLE `fa_feature_assignee`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`notify_change` bit(1) DEFAULT 1,
	`assignee_id` bigint(20) NOT NULL,
	`feature_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`feature_id`) REFERENCES `fa_feature` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;


CREATE TABLE `fa_feature_comment`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`title` varchar(150) NOT NULL,
	`short_text` varchar(255) NOT NULL,
	`full_text` varchar(4096),
	`owner_id` bigint(20) NOT NULL,
	`feature_id` bigint(20) NOT NULL,
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
	FOREIGN KEY (`feature_id`) REFERENCES `fa_feature` (`id`),
	FOREIGN KEY (`parent_id`) REFERENCES `fa_feature_comment` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	

CREATE TABLE `fa_feature_hours`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`start_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`end_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`hours` double,
	`owner_id` bigint(20) NOT NULL,
	`feature_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`feature_id`) REFERENCES `fa_feature` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;	


CREATE TABLE `fa_feature_score`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`item_value` int DEFAULT 1,
	`owner_id` bigint(20) NOT NULL,
	`feature_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`feature_id`) REFERENCES `fa_feature` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `fa_question`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`title` varchar(150) NOT NULL,
	`short_text` varchar(255) NOT NULL,
	`full_text` varchar(4096),
	`owner_id` bigint(20) NOT NULL,
	`feature_id` bigint(20) DEFAULT NULL,
	`requirement_id` bigint(20) DEFAULT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`feature_id`) REFERENCES `fa_feature` (`id`),
	FOREIGN KEY (`requirement_id`) REFERENCES `fa_question` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `fa_issue`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`title` varchar(150) NOT NULL,
	`description` varchar(150),
	`owner_id` bigint(20) DEFAULT NULL,
	`creator_id` bigint(20) NOT NULL,
	`hour_estimate` double,
	`actual_hours` double,
	`start_date` timestamp DEFAULT '1970-01-01 00:00:01',
	`end_date` timestamp DEFAULT '1970-01-01 00:00:01',
	`workflow_id` bigint(20) DEFAULT NULL,
	`category` varchar(100),
	`feature_id` bigint(20) DEFAULT NULL,
	`code_branch_id` bigint(20) DEFAULT NULL,
	`backlog_id` bigint(20) DEFAULT NULL,
	`release_id` bigint(20) DEFAULT NULL,
	`steps_to_recreate` varchar(2048),
	`expected_result` varchar(2048),
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`feature_id`) REFERENCES `fa_feature` (`id`),
	FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`id`),
	FOREIGN KEY (`code_branch_id`) REFERENCES `fa_code_branch` (`id`),
	FOREIGN KEY (`backlog_id`) REFERENCES `fa_backlog` (`id`),
	FOREIGN KEY (`release_id`) REFERENCES `fa_release` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	

CREATE TABLE `fa_issue_assignee`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`notify_change` bit(1) DEFAULT 1,
	`assignee_id` bigint(20) NOT NULL,
	`issue_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`issue_id`) REFERENCES `fa_issue` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;	


CREATE TABLE `fa_issue_comment`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`title` varchar(150) NOT NULL,
	`short_text` varchar(255) NOT NULL,
	`full_text` varchar(4096),
	`owner_id` bigint(20) NOT NULL,
	`issue_id` bigint(20) NOT NULL,
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
	FOREIGN KEY (`issue_id`) REFERENCES `fa_issue` (`id`),
	FOREIGN KEY (`parent_id`) REFERENCES `fa_issue_comment` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	

CREATE TABLE `fa_issue_hours`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`start_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`end_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`hours` double,
	`owner_id` bigint(20) NOT NULL,
	`issue_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`issue_id`) REFERENCES `fa_issue` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;	


CREATE TABLE `fa_issue_score`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`value` int DEFAULT 1,
	`owner_id` bigint(20) NOT NULL,
	`issue_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`issue_id`) REFERENCES `fa_issue` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `fa_requirement`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`title` varchar(150) NOT NULL,
	`description` varchar(150),
	`owner_id` bigint(20) DEFAULT NULL,
	`hour_estimate` double,
	`actual_hours` double,
	`start_date` timestamp DEFAULT '1970-01-01 00:00:01',
	`end_date` timestamp DEFAULT '1970-01-01 00:00:01',
	`creator_id` bigint(20) NOT NULL,
	`workflow_id` bigint(20) DEFAULT NULL,
	`feature_id` bigint(20) DEFAULT NULL,
	`issue_id` bigint(20) DEFAULT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`id`),
	FOREIGN KEY (`feature_id`) REFERENCES `fa_feature` (`id`),
	FOREIGN KEY (`issue_id`) REFERENCES `fa_issue` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `fa_directories`
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
	FOREIGN KEY (`parent_id`) REFERENCES `fa_directories` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	

CREATE TABLE `fa_shared_directories`
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
	FOREIGN KEY (`directory_id`) REFERENCES `fa_directories` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	

CREATE TABLE `fa_attachments`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`data` longblob NOT NULL,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	

CREATE TABLE `fa_attachment_thumbnail`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`data` mediumblob NOT NULL,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	

CREATE TABLE `fa_attachments_meta`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`user_id` bigint(20) NOT NULL,
	`title` varchar(512) NOT NULL,
	`file_name` varchar(1024) NOT NULL,
	`file_path` varchar(2048),
	`url_link` varchar(256),
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
	FOREIGN KEY (`data_id`) REFERENCES `fa_attachments` (`id`),
	FOREIGN KEY (`thumbnail_id`) REFERENCES `fa_attachment_thumbnail` (`id`),
	FOREIGN KEY (`directory_id`) REFERENCES `fa_directories` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `fa_feature_attachment`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`feature_id` bigint(20) NOT NULL,
	`attachment_id` bigint(20) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_feature_attachment` (`feature_id`,`attachment_id`),
	FOREIGN KEY (`feature_id`) REFERENCES `fa_feature` (`id`),
	FOREIGN KEY (`attachment_id`) REFERENCES `fa_attachments_meta` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;		

CREATE TABLE `fa_issue_attachment`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`issue_id` bigint(20) NOT NULL,
	`attachment_id` bigint(20) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_issue_attachment` (`issue_id`,`attachment_id`),
	FOREIGN KEY (`issue_id`) REFERENCES `fa_issue` (`id`),
	FOREIGN KEY (`attachment_id`) REFERENCES `fa_attachments_meta` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;	
	
CREATE TABLE `fa_requirement_attachment`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`requirement_id` bigint(20) NOT NULL,
	`attachment_id` bigint(20) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_requirement_attachment` (`requirement_id`,`attachment_id`),
	FOREIGN KEY (`requirement_id`) REFERENCES `fa_requirement` (`id`),
	FOREIGN KEY (`attachment_id`) REFERENCES `fa_attachments_meta` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `fa_test_suite`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`title` varchar(150) NOT NULL,
	`description` varchar(150),
	`owner_id` bigint(20) NOT NULL,
	`status` varchar(100) NOT NULL,
	`product_version` int DEFAULT 1,
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
	FOREIGN KEY (`parent_id`) REFERENCES `fa_test_suite` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `fa_user_story`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`title` varchar(150) NOT NULL,
	`description` varchar(150),
	`owner_id` bigint(20) DEFAULT NULL,
	`status` varchar(100) NOT NULL,
	`feature_id` bigint(20),
	`requirement_id` bigint(20),
	`test_suite_id` bigint(20),
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`feature_id`) REFERENCES `fa_feature` (`id`),
	FOREIGN KEY (`requirement_id`) REFERENCES `fa_requirement` (`id`),
	FOREIGN KEY (`test_suite_id`) REFERENCES `fa_test_suite` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	
CREATE TABLE `fa_test_case`
	(`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`title` varchar(150) NOT NULL,
	`description` varchar(150),
	`owner_id` bigint(20) DEFAULT NULL,
	`status` varchar(100) NOT NULL,
	`unit_test_ref` varchar(30),
	`integration_test_ref` varchar(30),
	`priority` varchar(30),
	`probability` varchar(30),
	`user_story_id` bigint(20) NOT NULL,
	`feature_id` bigint(20),
	`requirement_id` bigint(20),
	`test_suite_id` bigint(20) NOT NULL,
	`is_active` bit(1) DEFAULT 1,
	`is_archive` bit(1) DEFAULT 0,
	`is_locked` bit(1) DEFAULT 0,
	`lockowner_id` bigint(20) DEFAULT NULL,
	`modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`created` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
	`lock_time` timestamp DEFAULT '1970-01-01 00:00:01',
	`version` bigint(20) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_story_id`) REFERENCES `fa_user_story` (`id`),
	FOREIGN KEY (`feature_id`) REFERENCES `fa_feature` (`id`),
	FOREIGN KEY (`requirement_id`) REFERENCES `fa_requirement` (`id`),
	FOREIGN KEY (`test_suite_id`) REFERENCES `fa_test_suite` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
	

	
	

	

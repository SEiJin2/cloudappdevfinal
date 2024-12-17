-- Create "auth_group_permissions" table
CREATE TABLE `auth_group_permissions` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `group_id` integer NOT NULL,
  `permission_id` integer NOT NULL,
  CONSTRAINT `0` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT `1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Create index "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" to table: "auth_group_permissions"
CREATE UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` ON `auth_group_permissions` (`group_id`, `permission_id`);

-- Create index "auth_group_permissions_group_id_b120cbf9" to table: "auth_group_permissions"
CREATE INDEX `auth_group_permissions_group_id_b120cbf9` ON `auth_group_permissions` (`group_id`);

-- Create index "auth_group_permissions_permission_id_84c5c92e" to table: "auth_group_permissions"
CREATE INDEX `auth_group_permissions_permission_id_84c5c92e` ON `auth_group_permissions` (`permission_id`);

-- Create "auth_user_groups" table
CREATE TABLE `auth_user_groups` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `user_id` integer NOT NULL,
  `group_id` integer NOT NULL,
  CONSTRAINT `0` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT `1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Create index "auth_user_groups_user_id_group_id_94350c0c_uniq" to table: "auth_user_groups"
CREATE UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq` ON `auth_user_groups` (`user_id`, `group_id`);

-- Create index "auth_user_groups_user_id_6a12ed8b" to table: "auth_user_groups"
CREATE INDEX `auth_user_groups_user_id_6a12ed8b` ON `auth_user_groups` (`user_id`);

-- Create index "auth_user_groups_group_id_97559544" to table: "auth_user_groups"
CREATE INDEX `auth_user_groups_group_id_97559544` ON `auth_user_groups` (`group_id`);

-- Create "auth_user_user_permissions" table
CREATE TABLE `auth_user_user_permissions` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `user_id` integer NOT NULL,
  `permission_id` integer NOT NULL,
  CONSTRAINT `0` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT `1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Create index "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" to table: "auth_user_user_permissions"
CREATE UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` ON `auth_user_user_permissions` (`user_id`, `permission_id`);

-- Create index "auth_user_user_permissions_user_id_a95ead1b" to table: "auth_user_user_permissions"
CREATE INDEX `auth_user_user_permissions_user_id_a95ead1b` ON `auth_user_user_permissions` (`user_id`);

-- Create index "auth_user_user_permissions_permission_id_1fbb5f2c" to table: "auth_user_user_permissions"
CREATE INDEX `auth_user_user_permissions_permission_id_1fbb5f2c` ON `auth_user_user_permissions` (`permission_id`);

-- Create "django_admin_log" table
CREATE TABLE `django_admin_log` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` text NULL,
  `object_repr` varchar NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` text NOT NULL,
  `content_type_id` integer NULL,
  `user_id` integer NOT NULL,
  CONSTRAINT `0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT `1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CHECK ("action_flag" >= 0)
);

-- Create index "django_admin_log_content_type_id_c4bce8eb" to table: "django_admin_log"
CREATE INDEX `django_admin_log_content_type_id_c4bce8eb` ON `django_admin_log` (`content_type_id`);

-- Create index "django_admin_log_user_id_c564eba6" to table: "django_admin_log"
CREATE INDEX `django_admin_log_user_id_c564eba6` ON `django_admin_log` (`user_id`);

-- Create "django_content_type" table
CREATE TABLE `django_content_type` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `app_label` varchar NOT NULL,
  `model` varchar NOT NULL
);

-- Create index "django_content_type_app_label_model_76bd3d3b_uniq" to table: "django_content_type"
CREATE UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq` ON `django_content_type` (`app_label`, `model`);

-- Create "auth_permission" table
CREATE TABLE `auth_permission` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `name` varchar NOT NULL,
  `content_type_id` integer NOT NULL,
  `codename` varchar NOT NULL,
  CONSTRAINT `0` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Create index "auth_permission_content_type_id_codename_01ab375a_uniq" to table: "auth_permission"
CREATE UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq` ON `auth_permission` (`content_type_id`, `codename`);

-- Create index "auth_permission_content_type_id_2f476e4b" to table: "auth_permission"
CREATE INDEX `auth_permission_content_type_id_2f476e4b` ON `auth_permission` (`content_type_id`);

-- Create "auth_group" table
CREATE TABLE `auth_group` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `name` varchar NOT NULL
);

-- Create index "auth_group_name" to table: "auth_group"
CREATE UNIQUE INDEX `auth_group_name` ON `auth_group` (`name`);

-- Create "auth_user" table
CREATE TABLE `auth_user` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `first_name` varchar NOT NULL,
  `password` varchar NOT NULL,
  `last_login` datetime NULL,
  `is_superuser` bool NOT NULL,
  `username` varchar NOT NULL,
  `last_name` varchar NOT NULL,
  `email` varchar NOT NULL,
  `is_staff` bool NOT NULL,
  `is_active` bool NOT NULL,
  `date_joined` datetime NOT NULL
);

-- Create index "auth_user_username" to table: "auth_user"
CREATE UNIQUE INDEX `auth_user_username` ON `auth_user` (`username`);

-- Create "django_session" table
CREATE TABLE `django_session` (
  `session_key` varchar NOT NULL,
  `session_data` text NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
);

-- Create index "django_session_expire_date_a5c62663" to table: "django_session"
CREATE INDEX `django_session_expire_date_a5c62663` ON `django_session` (`expire_date`);

-- Create "restapi_category" table
CREATE TABLE `restapi_category` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `name` varchar NOT NULL,
  `description` text NOT NULL
);

-- Create "restapi_user" table
CREATE TABLE `restapi_user` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `username` varchar NOT NULL,
  `email` varchar NOT NULL,
  `password_hash` varchar NOT NULL,
  `first_name` varchar NOT NULL,
  `last_name` varchar NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
);

-- Create index "restapi_user_username" to table: "restapi_user"
CREATE UNIQUE INDEX `restapi_user_username` ON `restapi_user` (`username`);

-- Create index "restapi_user_email" to table: "restapi_user"
CREATE UNIQUE INDEX `restapi_user_email` ON `restapi_user` (`email`);

-- Create "restapi_venue" table
CREATE TABLE `restapi_venue` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `name` varchar NOT NULL,
  `address` text NOT NULL,
  `capacity` integer unsigned NOT NULL,
  `contact_info` varchar NOT NULL,
  CHECK ("capacity" >= 0)
);

-- Create "restapi_ticket" table
CREATE TABLE `restapi_ticket` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `type` varchar NOT NULL,
  `price` decimal NOT NULL,
  `availability` integer unsigned NOT NULL,
  `event_id` bigint NOT NULL,
  CONSTRAINT `0` FOREIGN KEY (`event_id`) REFERENCES `restapi_event` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CHECK ("availability" >= 0)
);

-- Create index "restapi_ticket_event_id_1135fc24" to table: "restapi_ticket"
CREATE INDEX `restapi_ticket_event_id_1135fc24` ON `restapi_ticket` (`event_id`);

-- Create "restapi_review" table
CREATE TABLE `restapi_review` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `rating` smallint unsigned NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime NOT NULL,
  `event_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  CONSTRAINT `0` FOREIGN KEY (`user_id`) REFERENCES `restapi_user` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT `1` FOREIGN KEY (`event_id`) REFERENCES `restapi_event` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CHECK ("rating" >= 0)
);

-- Create index "restapi_review_event_id_198de56c" to table: "restapi_review"
CREATE INDEX `restapi_review_event_id_198de56c` ON `restapi_review` (`event_id`);

-- Create index "restapi_review_user_id_1e9f09c0" to table: "restapi_review"
CREATE INDEX `restapi_review_user_id_1e9f09c0` ON `restapi_review` (`user_id`);

-- Create "restapi_registration" table
CREATE TABLE `restapi_registration` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `registration_date` datetime NOT NULL,
  `ticket_type` varchar NOT NULL,
  `number_of_tickets` integer unsigned NOT NULL,
  `event_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  CONSTRAINT `0` FOREIGN KEY (`user_id`) REFERENCES `restapi_user` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT `1` FOREIGN KEY (`event_id`) REFERENCES `restapi_event` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CHECK ("number_of_tickets" >= 0)
);

-- Create index "restapi_registration_event_id_f3893cec" to table: "restapi_registration"
CREATE INDEX `restapi_registration_event_id_f3893cec` ON `restapi_registration` (`event_id`);

-- Create index "restapi_registration_user_id_6d10537f" to table: "restapi_registration"
CREATE INDEX `restapi_registration_user_id_6d10537f` ON `restapi_registration` (`user_id`);

-- Create "restapi_payment" table
CREATE TABLE `restapi_payment` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `amount` decimal NOT NULL,
  `status` varchar NOT NULL,
  `payment_date` datetime NOT NULL,
  `registration_id` bigint NOT NULL,
  CONSTRAINT `0` FOREIGN KEY (`registration_id`) REFERENCES `restapi_registration` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Create index "restapi_payment_registration_id_e92000a6" to table: "restapi_payment"
CREATE INDEX `restapi_payment_registration_id_e92000a6` ON `restapi_payment` (`registration_id`);

-- Create "restapi_notification" table
CREATE TABLE `restapi_notification` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `message` text NOT NULL,
  `sent_at` datetime NOT NULL,
  `event_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  CONSTRAINT `0` FOREIGN KEY (`user_id`) REFERENCES `restapi_user` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT `1` FOREIGN KEY (`event_id`) REFERENCES `restapi_event` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Create index "restapi_notification_event_id_47121fc7" to table: "restapi_notification"
CREATE INDEX `restapi_notification_event_id_47121fc7` ON `restapi_notification` (`event_id`);

-- Create index "restapi_notification_user_id_88d6026c" to table: "restapi_notification"
CREATE INDEX `restapi_notification_user_id_88d6026c` ON `restapi_notification` (`user_id`);

-- Create "restapi_eventcategory" table
CREATE TABLE `restapi_eventcategory` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `category_id` bigint NOT NULL,
  `event_id` bigint NOT NULL,
  CONSTRAINT `0` FOREIGN KEY (`event_id`) REFERENCES `restapi_event` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT `1` FOREIGN KEY (`category_id`) REFERENCES `restapi_category` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Create index "restapi_eventcategory_category_id_358180b4" to table: "restapi_eventcategory"
CREATE INDEX `restapi_eventcategory_category_id_358180b4` ON `restapi_eventcategory` (`category_id`);

-- Create index "restapi_eventcategory_event_id_36e90a30" to table: "restapi_eventcategory"
CREATE INDEX `restapi_eventcategory_event_id_36e90a30` ON `restapi_eventcategory` (`event_id`);

-- Create "restapi_event" table
CREATE TABLE `restapi_event` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `title` varchar NOT NULL,
  `description` text NOT NULL,
  `date_time` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by_id` bigint NOT NULL,
  `venue_id_id` bigint NOT NULL,
  CONSTRAINT `0` FOREIGN KEY (`venue_id_id`) REFERENCES `restapi_venue` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT `1` FOREIGN KEY (`created_by_id`) REFERENCES `restapi_user` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Create index "restapi_event_created_by_id_f056c4f4" to table: "restapi_event"
CREATE INDEX `restapi_event_created_by_id_f056c4f4` ON `restapi_event` (`created_by_id`);

-- Create index "restapi_event_venue_id_id_1cb25870" to table: "restapi_event"
CREATE INDEX `restapi_event_venue_id_id_1cb25870` ON `restapi_event` (`venue_id_id`);

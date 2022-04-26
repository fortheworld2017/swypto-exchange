/* Create ban details table */

CREATE TABLE IF NOT EXISTS `bank` (
  `id` int(11) DEFAULT NULL,
  `RoutingCode` varchar(64) DEFAULT NULL,
  `Name` varchar(128) DEFAULT NULL,
  `Number` int(32) DEFAULT NULL,
  `IBAN` varchar(64) DEFAULT NULL,
  `BankName` varchar(64) DEFAULT NULL,
  `BankAddress` varchar(64) DEFAULT NULL,
  `SortCode` varchar(64) DEFAULT NULL,
  `RoutingNumber` varchar(64) DEFAULT NULL,
  `SWIFT` varchar(64) DEFAULT NULL,
  `IFSC` varchar(64) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `bankCountry` varchar(64) DEFAULT NULL,
  `bankCity` varchar(64) DEFAULT NULL,
  `bankPostalCode` varchar(10) DEFAULT NULL,
  `preferredCurrency` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* Create bank withdrawals table */
CREATE TABLE IF NOT EXISTS `bank_withdrawals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `currency` int(10) unsigned DEFAULT NULL,
  `wallet_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `fraud` tinyint(1) DEFAULT NULL,
  `remote_ip` varchar(16) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `fee` bigint(20) DEFAULT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `bic_swift` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postalcode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_address` varchar(255) DEFAULT NULL,
  `bank_postalcode` varchar(255) DEFAULT NULL,
  `bank_city` varchar(255) DEFAULT NULL,
  `bank_country` varchar(255) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `is_mail_sent` tinyint(1) DEFAULT NULL,
  `bank_currency` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


/* Add labels column to payments table */
ALTER TABLE  `payments` ADD  `label` VARCHAR( 64 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER  `fraud` ;

/* More fields to users table */
ALTER TABLE  `users` ADD  `address1` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `email_auth_enabled` ,
ADD  `address2` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER  `address1` ,
ADD  `postcode` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER  `address2` ,
ADD  `city` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER  `postcode` ,
ADD  `country` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER  `city` ,
ADD  `phone` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER  `country` ,
ADD  `skypeId` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER  `phone` ,
ADD  `alternate_email` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER  `skypeId` ,
ADD  `name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER  `alternate_email` ;




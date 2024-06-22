-- MySQL dump 10.13  Distrib 5.7.37, for Linux (x86_64)
--
-- Host: localhost    Database: dbname
-- ------------------------------------------------------
-- Server version	5.7.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `GDN_Activity`
--

DROP TABLE IF EXISTS `GDN_Activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_Activity` (
  `ActivityID` int(11) NOT NULL AUTO_INCREMENT,
  `CommentActivityID` int(11) DEFAULT NULL,
  `ActivityTypeID` int(11) NOT NULL,
  `ActivityUserID` int(11) DEFAULT NULL,
  `RegardingUserID` int(11) DEFAULT NULL,
  `Story` text COLLATE utf8_unicode_ci,
  `Route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  PRIMARY KEY (`ActivityID`),
  KEY `FK_Activity_CommentActivityID` (`CommentActivityID`),
  KEY `FK_Activity_ActivityUserID` (`ActivityUserID`),
  KEY `FK_Activity_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_Activity`
--

LOCK TABLES `GDN_Activity` WRITE;
/*!40000 ALTER TABLE `GDN_Activity` DISABLE KEYS */;
INSERT INTO `GDN_Activity` VALUES (1,NULL,2,1,NULL,'Welcome to Vanilla!',NULL,0,NULL,'2022-03-14 18:39:36');
/*!40000 ALTER TABLE `GDN_Activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_ActivityType`
--

DROP TABLE IF EXISTS `GDN_ActivityType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_ActivityType` (
  `ActivityTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `AllowComments` tinyint(4) NOT NULL DEFAULT '0',
  `ShowIcon` tinyint(4) NOT NULL DEFAULT '0',
  `ProfileHeadline` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FullHeadline` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `RouteCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Notify` tinyint(4) NOT NULL DEFAULT '0',
  `Public` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ActivityTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_ActivityType`
--

LOCK TABLES `GDN_ActivityType` WRITE;
/*!40000 ALTER TABLE `GDN_ActivityType` DISABLE KEYS */;
INSERT INTO `GDN_ActivityType` VALUES (1,'SignIn',0,0,'%1$s signed in.','%1$s signed in.',NULL,0,1),(2,'Join',1,0,'%1$s joined.','%1$s joined.',NULL,0,1),(3,'JoinInvite',1,0,'%1$s accepted %4$s invitation for membership.','%1$s accepted %4$s invitation for membership.',NULL,0,1),(4,'JoinApproved',1,0,'%1$s approved %4$s membership application.','%1$s approved %4$s membership application.',NULL,0,1),(5,'JoinCreated',1,0,'%1$s created an account for %4$s.','%1$s created an account for %4$s.',NULL,0,1),(6,'AboutUpdate',1,0,'%1$s updated %6$s profile.','%1$s updated %6$s profile.',NULL,0,1),(7,'WallComment',1,1,'%1$s wrote:','%1$s wrote on %4$s %5$s.',NULL,0,1),(8,'PictureChange',1,0,'%1$s changed %6$s profile picture.','%1$s changed %6$s profile picture.',NULL,0,1),(9,'RoleChange',1,0,'%1$s changed %4$s permissions.','%1$s changed %4$s permissions.',NULL,1,1),(10,'ActivityComment',0,1,'%1$s','%1$s commented on %4$s %8$s.','activity',1,1),(11,'Import',0,0,'%1$s imported data.','%1$s imported data.',NULL,1,0),(12,'ConversationMessage',0,0,'%1$s sent you a %8$s.','%1$s sent you a %8$s.','message',1,0),(13,'AddedToConversation',0,0,'%1$s added %3$s to a %8$s.','%1$s added %3$s to a %8$s.','conversation',1,0),(14,'NewDiscussion',0,0,'%1$s started a %8$s.','%1$s started a %8$s.','discussion',0,0),(15,'DiscussionComment',0,0,'%1$s commented on %4$s %8$s.','%1$s commented on %4$s %8$s.','discussion',1,0),(16,'DiscussionMention',0,0,'%1$s mentioned %3$s in a %8$s.','%1$s mentioned %3$s in a %8$s.','discussion',1,0),(17,'CommentMention',0,0,'%1$s mentioned %3$s in a %8$s.','%1$s mentioned %3$s in a %8$s.','comment',1,0),(18,'BookmarkComment',0,0,'%1$s commented on your %8$s.','%1$s commented on your %8$s.','bookmarked discussion',1,0);
/*!40000 ALTER TABLE `GDN_ActivityType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_AnalyticsLocal`
--

DROP TABLE IF EXISTS `GDN_AnalyticsLocal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_AnalyticsLocal` (
  `TimeSlot` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `Views` int(11) DEFAULT NULL,
  UNIQUE KEY `UX_AnalyticsLocal` (`TimeSlot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_AnalyticsLocal`
--

LOCK TABLES `GDN_AnalyticsLocal` WRITE;
/*!40000 ALTER TABLE `GDN_AnalyticsLocal` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_AnalyticsLocal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_Category`
--

DROP TABLE IF EXISTS `GDN_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_Category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentCategoryID` int(11) DEFAULT NULL,
  `TreeLeft` int(11) DEFAULT NULL,
  `TreeRight` int(11) DEFAULT NULL,
  `Depth` int(11) DEFAULT NULL,
  `CountDiscussions` int(11) NOT NULL DEFAULT '0',
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `AllowDiscussions` tinyint(4) NOT NULL DEFAULT '1',
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `UrlCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `PermissionCategoryID` int(11) NOT NULL DEFAULT '-1',
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `LastCommentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`),
  KEY `FK_Category_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_Category`
--

LOCK TABLES `GDN_Category` WRITE;
/*!40000 ALTER TABLE `GDN_Category` DISABLE KEYS */;
INSERT INTO `GDN_Category` VALUES (-1,NULL,1,4,NULL,0,0,1,'Root','','Root of category tree. Users should never see this.',NULL,-1,1,1,'2022-03-14 18:39:36','2022-03-14 18:39:36',NULL),(1,-1,2,3,NULL,0,0,1,'General','general','General discussions',NULL,-1,1,1,'2022-03-14 18:39:36','2022-03-14 18:39:36',NULL);
/*!40000 ALTER TABLE `GDN_Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_Comment`
--

DROP TABLE IF EXISTS `GDN_Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_Comment` (
  `CommentID` int(11) NOT NULL AUTO_INCREMENT,
  `DiscussionID` int(11) NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DeleteUserID` int(11) DEFAULT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime DEFAULT NULL,
  `DateDeleted` datetime DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `Flag` tinyint(4) NOT NULL DEFAULT '0',
  `Score` float DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`CommentID`),
  KEY `FK_Comment_DiscussionID` (`DiscussionID`),
  KEY `FK_Comment_InsertUserID` (`InsertUserID`),
  KEY `FK_Comment_DateInserted` (`DateInserted`),
  FULLTEXT KEY `TX_Comment` (`Body`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_Comment`
--

LOCK TABLES `GDN_Comment` WRITE;
/*!40000 ALTER TABLE `GDN_Comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_Conversation`
--

DROP TABLE IF EXISTS `GDN_Conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_Conversation` (
  `ConversationID` int(11) NOT NULL AUTO_INCREMENT,
  `Contributors` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FirstMessageID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime DEFAULT NULL,
  `UpdateUserID` int(11) NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `CountMessages` int(11) NOT NULL,
  `LastMessageID` int(11) NOT NULL,
  PRIMARY KEY (`ConversationID`),
  KEY `FK_Conversation_FirstMessageID` (`FirstMessageID`),
  KEY `FK_Conversation_InsertUserID` (`InsertUserID`),
  KEY `FK_Conversation_DateInserted` (`DateInserted`),
  KEY `FK_Conversation_UpdateUserID` (`UpdateUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_Conversation`
--

LOCK TABLES `GDN_Conversation` WRITE;
/*!40000 ALTER TABLE `GDN_Conversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_Conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_ConversationMessage`
--

DROP TABLE IF EXISTS `GDN_ConversationMessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_ConversationMessage` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `ConversationID` int(11) NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  PRIMARY KEY (`MessageID`),
  KEY `FK_ConversationMessage_ConversationID` (`ConversationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_ConversationMessage`
--

LOCK TABLES `GDN_ConversationMessage` WRITE;
/*!40000 ALTER TABLE `GDN_ConversationMessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_ConversationMessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_Discussion`
--

DROP TABLE IF EXISTS `GDN_Discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_Discussion` (
  `DiscussionID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryID` int(11) NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) NOT NULL,
  `LastCommentID` int(11) DEFAULT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountComments` int(11) NOT NULL DEFAULT '1',
  `CountBookmarks` int(11) DEFAULT NULL,
  `CountViews` int(11) NOT NULL DEFAULT '1',
  `Closed` tinyint(4) NOT NULL DEFAULT '0',
  `Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Sink` tinyint(4) NOT NULL DEFAULT '0',
  `DateInserted` datetime DEFAULT NULL,
  `DateUpdated` datetime NOT NULL,
  `DateLastComment` datetime DEFAULT NULL,
  `LastCommentUserID` int(11) DEFAULT NULL,
  `Score` float DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DiscussionID`),
  KEY `FK_Discussion_CategoryID` (`CategoryID`),
  KEY `FK_Discussion_InsertUserID` (`InsertUserID`),
  KEY `IX_Discussion_DateLastComment` (`DateLastComment`),
  FULLTEXT KEY `TX_Discussion` (`Name`,`Body`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_Discussion`
--

LOCK TABLES `GDN_Discussion` WRITE;
/*!40000 ALTER TABLE `GDN_Discussion` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_Discussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_Draft`
--

DROP TABLE IF EXISTS `GDN_Draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_Draft` (
  `DraftID` int(11) NOT NULL AUTO_INCREMENT,
  `DiscussionID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Closed` tinyint(4) NOT NULL DEFAULT '0',
  `Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Sink` tinyint(4) NOT NULL DEFAULT '0',
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`DraftID`),
  KEY `FK_Draft_DiscussionID` (`DiscussionID`),
  KEY `FK_Draft_CategoryID` (`CategoryID`),
  KEY `FK_Draft_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_Draft`
--

LOCK TABLES `GDN_Draft` WRITE;
/*!40000 ALTER TABLE `GDN_Draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_Draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_Invitation`
--

DROP TABLE IF EXISTS `GDN_Invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_Invitation` (
  `InvitationID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `AcceptedUserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`InvitationID`),
  KEY `FK_Invitation_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_Invitation`
--

LOCK TABLES `GDN_Invitation` WRITE;
/*!40000 ALTER TABLE `GDN_Invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_Invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_Message`
--

DROP TABLE IF EXISTS `GDN_Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_Message` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AllowDismiss` tinyint(4) NOT NULL DEFAULT '1',
  `Enabled` tinyint(4) NOT NULL DEFAULT '1',
  `Application` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AssetTarget` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CssClass` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_Message`
--

LOCK TABLES `GDN_Message` WRITE;
/*!40000 ALTER TABLE `GDN_Message` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_Permission`
--

DROP TABLE IF EXISTS `GDN_Permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_Permission` (
  `PermissionID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  `JunctionTable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JunctionColumn` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JunctionID` int(11) DEFAULT NULL,
  `Garden.Email.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Settings.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Routes.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Messages.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Applications.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Plugins.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Themes.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.SignIn.Allow` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Registration.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Applicants.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Roles.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Approve` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Activity.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Activity.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Profiles.View` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Settings.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Categories.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Spam.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.View` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Sink` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Close` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PermissionID`),
  KEY `FK_Permission_RoleID` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_Permission`
--

LOCK TABLES `GDN_Permission` WRITE;
/*!40000 ALTER TABLE `GDN_Permission` DISABLE KEYS */;
INSERT INTO `GDN_Permission` VALUES (1,0,NULL,NULL,NULL,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,2,3,3,2,2,2,0,0,0,0,0,0,0,0,0,0),(2,2,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,1,0,0),(3,4,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,1,0,0),(4,8,NULL,NULL,NULL,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,1,0,0),(5,32,NULL,NULL,NULL,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1),(6,16,NULL,NULL,NULL,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(7,0,'Category','PermissionCategoryID',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,2,2,2,2,2,3,2,2),(8,2,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),(9,3,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),(10,3,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),(11,4,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),(12,8,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0),(13,32,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1),(14,16,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `GDN_Permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_Photo`
--

DROP TABLE IF EXISTS `GDN_Photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_Photo` (
  `PhotoID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  PRIMARY KEY (`PhotoID`),
  KEY `FK_Photo_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_Photo`
--

LOCK TABLES `GDN_Photo` WRITE;
/*!40000 ALTER TABLE `GDN_Photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_Photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_Role`
--

DROP TABLE IF EXISTS `GDN_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_Role` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `Deletable` tinyint(4) NOT NULL DEFAULT '1',
  `CanSession` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_Role`
--

LOCK TABLES `GDN_Role` WRITE;
/*!40000 ALTER TABLE `GDN_Role` DISABLE KEYS */;
INSERT INTO `GDN_Role` VALUES (1,'Banned','Banned users are not allowed to participate or sign in.',1,1,0),(2,'Guest','Guests can only view content. Anyone browsing the site who is not signed in is considered to be a \"Guest\".',2,0,0),(3,'Confirm Email','Users must confirm their emails before becoming full members. They get assigned to this role.',7,1,0),(4,'Applicant','Users who have applied for membership, but have not yet been accepted. They have the same permissions as guests.',3,0,0),(8,'Member','Members can participate in discussions.',4,1,1),(16,'Administrator','Administrators have permission to do anything.',6,1,1),(32,'Moderator','Moderators have permission to edit most content.',5,1,1);
/*!40000 ALTER TABLE `GDN_Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_Tag`
--

DROP TABLE IF EXISTS `GDN_Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_Tag` (
  `TagID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unique',
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `CountDiscussions` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TagID`),
  KEY `FK_Tag_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_Tag`
--

LOCK TABLES `GDN_Tag` WRITE;
/*!40000 ALTER TABLE `GDN_Tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_TagDiscussion`
--

DROP TABLE IF EXISTS `GDN_TagDiscussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_TagDiscussion` (
  `TagID` int(11) NOT NULL,
  `DiscussionID` int(11) NOT NULL,
  PRIMARY KEY (`TagID`,`DiscussionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_TagDiscussion`
--

LOCK TABLES `GDN_TagDiscussion` WRITE;
/*!40000 ALTER TABLE `GDN_TagDiscussion` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_TagDiscussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_User`
--

DROP TABLE IF EXISTS `GDN_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_User` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varbinary(100) NOT NULL,
  `HashMethod` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `About` text COLLATE utf8_unicode_ci,
  `Email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ShowEmail` tinyint(4) NOT NULL DEFAULT '0',
  `Gender` enum('m','f') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'm',
  `CountVisits` int(11) NOT NULL DEFAULT '0',
  `CountInvitations` int(11) NOT NULL DEFAULT '0',
  `CountNotifications` int(11) DEFAULT NULL,
  `InviteUserID` int(11) DEFAULT NULL,
  `DiscoveryText` text COLLATE utf8_unicode_ci,
  `Preferences` text COLLATE utf8_unicode_ci,
  `Permissions` text COLLATE utf8_unicode_ci,
  `Attributes` text COLLATE utf8_unicode_ci,
  `DateSetInvitations` datetime DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `DateFirstVisit` datetime DEFAULT NULL,
  `DateLastActive` datetime DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `HourOffset` int(11) NOT NULL DEFAULT '0',
  `Score` float DEFAULT NULL,
  `Admin` tinyint(4) NOT NULL DEFAULT '0',
  `Deleted` tinyint(4) NOT NULL DEFAULT '0',
  `CountUnreadConversations` int(11) DEFAULT NULL,
  `CountDiscussions` int(11) DEFAULT NULL,
  `CountUnreadDiscussions` int(11) DEFAULT NULL,
  `CountComments` int(11) DEFAULT NULL,
  `CountDrafts` int(11) DEFAULT NULL,
  `CountBookmarks` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `FK_User_Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_User`
--

LOCK TABLES `GDN_User` WRITE;
/*!40000 ALTER TABLE `GDN_User` DISABLE KEYS */;
INSERT INTO `GDN_User` VALUES (1,'jAEkPot',_binary '$P$BSYT784GKmumBtBkoFCD9kyuMxxrmU1','Vanilla',NULL,NULL,'jaekpot@localhost.com',0,'m',1,0,NULL,NULL,NULL,NULL,'a:39:{i:0;s:22:\"Garden.Settings.Manage\";i:1;s:20:\"Garden.Routes.Manage\";i:2;s:26:\"Garden.Applications.Manage\";i:3;s:21:\"Garden.Plugins.Manage\";i:4;s:20:\"Garden.Themes.Manage\";i:5;s:19:\"Garden.SignIn.Allow\";i:6;s:26:\"Garden.Registration.Manage\";i:7;s:24:\"Garden.Applicants.Manage\";i:8;s:19:\"Garden.Roles.Manage\";i:9;s:16:\"Garden.Users.Add\";i:10;s:17:\"Garden.Users.Edit\";i:11;s:19:\"Garden.Users.Delete\";i:12;s:20:\"Garden.Users.Approve\";i:13;s:22:\"Garden.Activity.Delete\";i:14;s:20:\"Garden.Activity.View\";i:15;s:20:\"Garden.Profiles.View\";i:16;s:23:\"Vanilla.Settings.Manage\";i:17;s:25:\"Vanilla.Categories.Manage\";i:18;s:19:\"Vanilla.Spam.Manage\";i:19;s:24:\"Vanilla.Discussions.View\";i:20;s:23:\"Vanilla.Discussions.Add\";i:21;s:24:\"Vanilla.Discussions.Edit\";i:22;s:28:\"Vanilla.Discussions.Announce\";i:23;s:24:\"Vanilla.Discussions.Sink\";i:24;s:25:\"Vanilla.Discussions.Close\";i:25;s:26:\"Vanilla.Discussions.Delete\";i:26;s:20:\"Vanilla.Comments.Add\";i:27;s:21:\"Vanilla.Comments.Edit\";i:28;s:23:\"Vanilla.Comments.Delete\";s:24:\"Vanilla.Discussions.View\";a:1:{i:0;s:2:\"-1\";}s:23:\"Vanilla.Discussions.Add\";a:1:{i:0;s:2:\"-1\";}s:24:\"Vanilla.Discussions.Edit\";a:1:{i:0;s:2:\"-1\";}s:28:\"Vanilla.Discussions.Announce\";a:1:{i:0;s:2:\"-1\";}s:24:\"Vanilla.Discussions.Sink\";a:1:{i:0;s:2:\"-1\";}s:25:\"Vanilla.Discussions.Close\";a:1:{i:0;s:2:\"-1\";}s:26:\"Vanilla.Discussions.Delete\";a:1:{i:0;s:2:\"-1\";}s:20:\"Vanilla.Comments.Add\";a:1:{i:0;s:2:\"-1\";}s:21:\"Vanilla.Comments.Edit\";a:1:{i:0;s:2:\"-1\";}s:23:\"Vanilla.Comments.Delete\";a:1:{i:0;s:2:\"-1\";}}','a:1:{s:12:\"TransientKey\";s:12:\"4BQ8T66DCN37\";}',NULL,'1975-09-16 00:00:00','2022-03-14 18:39:36','2022-03-14 18:39:36','2022-03-14 18:39:36','2022-03-14 18:39:36',0,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `GDN_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_UserAuthentication`
--

DROP TABLE IF EXISTS `GDN_UserAuthentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_UserAuthentication` (
  `ForeignUserKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ProviderKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`ForeignUserKey`,`ProviderKey`),
  KEY `FK_UserAuthentication_UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_UserAuthentication`
--

LOCK TABLES `GDN_UserAuthentication` WRITE;
/*!40000 ALTER TABLE `GDN_UserAuthentication` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_UserAuthentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_UserAuthenticationNonce`
--

DROP TABLE IF EXISTS `GDN_UserAuthenticationNonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_UserAuthenticationNonce` (
  `Nonce` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Nonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_UserAuthenticationNonce`
--

LOCK TABLES `GDN_UserAuthenticationNonce` WRITE;
/*!40000 ALTER TABLE `GDN_UserAuthenticationNonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_UserAuthenticationNonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_UserAuthenticationProvider`
--

DROP TABLE IF EXISTS `GDN_UserAuthenticationProvider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_UserAuthenticationProvider` (
  `AuthenticationKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `AuthenticationSchemeAlias` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AssociationSecret` text COLLATE utf8_unicode_ci NOT NULL,
  `AssociationHashMethod` enum('HMAC-SHA1','HMAC-PLAINTEXT') COLLATE utf8_unicode_ci NOT NULL,
  `AuthenticateUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RegisterUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SignInUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SignOutUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PasswordUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProfileUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AuthenticationKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_UserAuthenticationProvider`
--

LOCK TABLES `GDN_UserAuthenticationProvider` WRITE;
/*!40000 ALTER TABLE `GDN_UserAuthenticationProvider` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_UserAuthenticationProvider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_UserAuthenticationToken`
--

DROP TABLE IF EXISTS `GDN_UserAuthenticationToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_UserAuthenticationToken` (
  `Token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ProviderKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignUserKey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TokenSecret` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `TokenType` enum('request','access') COLLATE utf8_unicode_ci NOT NULL,
  `Authorized` tinyint(4) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Lifetime` int(11) NOT NULL,
  PRIMARY KEY (`Token`,`ProviderKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_UserAuthenticationToken`
--

LOCK TABLES `GDN_UserAuthenticationToken` WRITE;
/*!40000 ALTER TABLE `GDN_UserAuthenticationToken` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_UserAuthenticationToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_UserComment`
--

DROP TABLE IF EXISTS `GDN_UserComment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_UserComment` (
  `UserID` int(11) NOT NULL,
  `CommentID` int(11) NOT NULL,
  `Score` float DEFAULT NULL,
  `DateLastViewed` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`,`CommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_UserComment`
--

LOCK TABLES `GDN_UserComment` WRITE;
/*!40000 ALTER TABLE `GDN_UserComment` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_UserComment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_UserConversation`
--

DROP TABLE IF EXISTS `GDN_UserConversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_UserConversation` (
  `UserID` int(11) NOT NULL,
  `ConversationID` int(11) NOT NULL,
  `CountReadMessages` int(11) NOT NULL DEFAULT '0',
  `LastMessageID` int(11) DEFAULT NULL,
  `DateLastViewed` datetime DEFAULT NULL,
  `DateCleared` datetime DEFAULT NULL,
  `Bookmarked` tinyint(4) NOT NULL DEFAULT '0',
  `Deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`ConversationID`),
  KEY `FK_UserConversation_LastMessageID` (`LastMessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_UserConversation`
--

LOCK TABLES `GDN_UserConversation` WRITE;
/*!40000 ALTER TABLE `GDN_UserConversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_UserConversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_UserDiscussion`
--

DROP TABLE IF EXISTS `GDN_UserDiscussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_UserDiscussion` (
  `UserID` int(11) NOT NULL,
  `DiscussionID` int(11) NOT NULL,
  `Score` float DEFAULT NULL,
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `DateLastViewed` datetime DEFAULT NULL,
  `Dismissed` tinyint(4) NOT NULL DEFAULT '0',
  `Bookmarked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`DiscussionID`),
  KEY `FK_UserDiscussion_DiscussionID` (`DiscussionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_UserDiscussion`
--

LOCK TABLES `GDN_UserDiscussion` WRITE;
/*!40000 ALTER TABLE `GDN_UserDiscussion` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_UserDiscussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_UserMeta`
--

DROP TABLE IF EXISTS `GDN_UserMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_UserMeta` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`UserID`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_UserMeta`
--

LOCK TABLES `GDN_UserMeta` WRITE;
/*!40000 ALTER TABLE `GDN_UserMeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `GDN_UserMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GDN_UserRole`
--

DROP TABLE IF EXISTS `GDN_UserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GDN_UserRole` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GDN_UserRole`
--

LOCK TABLES `GDN_UserRole` WRITE;
/*!40000 ALTER TABLE `GDN_UserRole` DISABLE KEYS */;
INSERT INTO `GDN_UserRole` VALUES (0,2),(1,16);
/*!40000 ALTER TABLE `GDN_UserRole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-14 22:40:02

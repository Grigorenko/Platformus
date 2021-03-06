BEGIN TRANSACTION;
--
-- Extension: Platformus.Configurations
-- Version: alpha-18
--
INSERT INTO "Configurations" VALUES (1,'Email','Email');
INSERT INTO "Variables" VALUES (1,1,'SmtpServer','SMTP server','test',1);
INSERT INTO "Variables" VALUES (2,1,'SmtpPort','SMTP port','25',2);
INSERT INTO "Variables" VALUES (3,1,'SmtpLogin','SMTP login','test',3);
INSERT INTO "Variables" VALUES (4,1,'SmtpPassword','SMTP password','test',4);
INSERT INTO "Variables" VALUES (5,1,'SmtpSenderEmail','SMTP sender email','test',5);
INSERT INTO "Variables" VALUES (6,1,'SmtpSenderName','SMTP sender name','test',6);

--
-- Extension: Platformus.Security
-- Version: alpha-18
--
INSERT INTO "Users" VALUES (1,'Administrator',1441274400);
INSERT INTO "CredentialTypes" VALUES (1,'Email','Email',1);
INSERT INTO "Credentials" VALUES (1,1,1,'admin@platformus.net','21-23-2F-29-7A-57-A5-A7-43-89-4A-0E-4A-80-1F-C3');
INSERT INTO "Roles" VALUES (1,'Administrator','Administrator',1);
INSERT INTO "UserRoles" VALUES (1,1);
INSERT INTO "Permissions" VALUES (1,'DoEverything','Do everything',1);
INSERT INTO "RolePermissions" VALUES (1,1);

--
-- Extension: Platformus.Globalization
-- Version: alpha-18
--
INSERT INTO "Cultures" VALUES (1,'__','Neutral',1,0);
INSERT INTO "Cultures" VALUES (2,'en','English',0,1);

--
-- Extension: Platformus.Domain
-- Version: alpha-18
--
INSERT INTO "DataTypes" VALUES (1,'string','singleLinePlainText','Single line plain text',1);
INSERT INTO "DataTypes" VALUES (2,'string','multilinePlainText','Multiline plain text',2);
INSERT INTO "DataTypes" VALUES (3,'string','html','Html',3);
INSERT INTO "DataTypes" VALUES (4,'string','image','Image',4);
INSERT INTO "DataTypes" VALUES (5,'datetime','date','Date',5);

--
-- Extension: Platformus.Forms
-- Version: alpha-18
--
INSERT INTO "FieldTypes" VALUES (1,'TextBox','Text box',1);
INSERT INTO "FieldTypes" VALUES (2,'TextArea','Text area',2);
INSERT INTO "FieldTypes" VALUES (3,'DropDownList','Drop down list',3);

COMMIT;

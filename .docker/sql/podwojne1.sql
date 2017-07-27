INSERT INTO apiuser (userid_, hascrmadminrole, hascrmreaderrole, hascustomermessageadminrole, hasbranchreaderrole, hasatmreaderrole, hasproductreaderrole, email, name_, provider_, providerid, id, apiuser) VALUES 
('1a66e643-ad5a-461d-89bd-2fe2a50afa04', false, false, false, false, false, false, 'jurek.okrasa@example.com', 'Jurek Okrasa', 'http://127.0.0.1:8080', NULL, 60, NULL);

INSERT INTO mappedaccountholder (accountbankpermalink, accountpermalink, user_c, id) VALUES ('gotham', '8cc5aaa2-a4c3-4ef6-bdb7-fc58c4f9e591', 60, 60);

INSERT INTO mappedbankaccount 
(accountnumber, createdat, updatedat, theaccountid, bank, accountiban, accountcurrency, accountswiftbic, accountbalance, accountname, accountlabel, accountlastupdate, kind, holder, id) 
VALUES 
('90','2015-05-01 12:00:00.083','2015-05-01 12:00:00.083','8cc5aaa2-a4c3-4ef6-bdb7-fc58c4f9e591','gotham','PL85638314010013605475285355','EUR',' ',66636056.57,'Konto Komfort','Konto Komfort','2015-05-01 12:00:00.083','CURRENT PLUS','Jurek Okrasa',90);


INSERT INTO mappedcustomer (
mmobilenumber, mrelationshipstatus, mhighesteducationattained, memploymentstatus, mlastokdate, mcustomerid, mfaceimageurl, mdateofbirth, mbank, createdat, updatedat, mlegalname, memail, mfaceimagetime, muser, mnumber, mkycstatus, mdependents, id) VALUES 
(
'+48 555000555','Kawaler','bachelor','none','2015-05-01 12:00:00.083','60',NULL,'1991-07-23','gotham','2015-05-01 12:00:00.083','2015-05-01 12:00:00.083','Jurek Okrasa','jurek.okrasa@example.com',NULL,60,'60',false,0,60);

INSERT INTO mappedentitlement (mrolename, mentitlementid, createdat, updatedat, mbankid, muserid, id) VALUES ('CanGetSocialMediaHandles', '1a555b69-e23a-4534-a10d-742568192963', '2017-03-28 12:00:00.05', '2017-03-28 12:00:00.05', 'gotham', '1a66e643-ad5a-461d-89bd-2fe2a50afa04', 204);
INSERT INTO mappedentitlement (mrolename, mentitlementid, createdat, updatedat, mbankid, muserid, id) VALUES ('CanAddSocialMediaHandle', 'ba195652-649a-415e-933a-017ec79ffdb8', '2017-03-28 12:00:00.1', '2017-03-28 12:00:00.1', 'gotham', '1a66e643-ad5a-461d-89bd-2fe2a50afa04', 205);
INSERT INTO mappedentitlement (mrolename, mentitlementid, createdat, updatedat, mbankid, muserid, id) VALUES ('CanGetAnyUser', '01f1f87a-7f51-416f-adc2-53353d1b3989', '2017-03-28 12:00:00.15', '2017-03-28 12:00:00.15', '', '1a66e643-ad5a-461d-89bd-2fe2a50afa04', 206);
INSERT INTO mappedusercustomerlink (mcustomerid, createdat, updatedat, mdateinserted, misactive, musercustomerlinkid, muserid, id) VALUES ('60', '2015-05-01 12:00:00.081', '2015-05-01 12:00:00.082', '2015-05-01 12:00:00.082', true, '822032fc-980e-4e5e-97e8-1ddc995551c3', '1a66e643-ad5a-461d-89bd-2fe2a50afa04', 60);

INSERT INTO users (id, firstname, lastname, email, username, password_pw, password_slt, provider, uniqueid, timezone, validated, superuser, user_c, locale) VALUES (
60,'Jurek','Okrasa','jurek.okrasa@example.com','jurek.okrasa','b;$2a$10$7QZ4Xj6Chg4vKnfoWJuSx.AflzmmFT1e40TOq','zdLW2M4YOoH7du0K',NULL,'SZPBZIEHQPAJGYOHZSMBJULJTWKKZVMI','Europe/Warsaw', true, false,'60','en');

INSERT INTO viewprivileges (createdat, updatedat, user_c, view_c, id) VALUES ('2017-03-28 12:00:00.081', '2017-03-28 12:00:00.082', 60, 90, 60);

INSERT INTO apiuser (91, hascrmadminrole, hascrmreaderrole, hascustomermessageadminrole, hasbranchreaderrole, hasatmreaderrole, hasproductreaderrole, email, name_, provider_, providerid, id, apiuser) VALUES 
('27896260-a5eb-4d79-8744-1e6c7de96360', false, false, false, false, false, false, 'jurek.okrasa@example.com', 'Jurek Okrasa', 'http://127.0.0.1:8080', NULL, 61, NULL);

INSERT INTO mappedaccountholder (accountbankpermalink, accountpermalink, user_c, id) VALUES ('ing', '11c725fe-e39d-49c3-97e5-37545557aad1', 61, 61);

INSERT INTO mappedbankaccount 
(accountnumber, createdat, updatedat, theaccountid, bank, accountiban, accountcurrency, accountswiftbic, accountbalance, accountname, accountlabel, accountlastupdate, kind, holder, id) 
VALUES 
('91','2015-05-01 12:00:00.083','2015-05-01 12:00:00.083','11c725fe-e39d-49c3-97e5-37545557aad1','ing','PL28814919417210050384603558','EUR',' ',66636056.57,'Konto Komfort','Konto Komfort','2015-05-01 12:00:00.083','CURRENT PLUS','Jurek Okrasa',84);


INSERT INTO mappedcustomer (
mmobilenumber, mrelationshipstatus, mhighesteducationattained, memploymentstatus, mlastokdate, mcustomerid, mfaceimageurl, mdateofbirth, mbank, createdat, updatedat, mlegalname, memail, mfaceimagetime, muser, mnumber, mkycstatus, mdependents, id) VALUES 
(
'+48 555000555','Kawaler','bachelor','none','2015-05-01 12:00:00.083','61',NULL,'1991-07-23','ing','2015-05-01 12:00:00.083','2015-05-01 12:00:00.083','Jurek Okrasa','jurek.okrasa@example.com',NULL,61,'61',false,0,61);

INSERT INTO mappedentitlement (mrolename, mentitlementid, createdat, updatedat, mbankid, muserid, id) VALUES ('CanGetSocialMediaHandles', 'e68ca98f-71a9-43e5-80d9-fb4f93914953', '2017-03-28 12:00:00.05', '2017-03-28 12:00:00.05', 'ing', '27896260-a5eb-4d79-8744-1e6c7de96360', 207);
INSERT INTO mappedentitlement (mrolename, mentitlementid, createdat, updatedat, mbankid, muserid, id) VALUES ('CanAddSocialMediaHandle', '6466e875-6d3c-4235-b61d-8a48c2642c53', '2017-03-28 12:00:00.1', '2017-03-28 12:00:00.1', 'ing', '27896260-a5eb-4d79-8744-1e6c7de96360', 208);
INSERT INTO mappedentitlement (mrolename, mentitlementid, createdat, updatedat, mbankid, muserid, id) VALUES ('CanGetAnyUser', '957c03a2-ea0b-41e8-bc2e-c718e7a9b63a', '2017-03-28 12:00:00.15', '2017-03-28 12:00:00.15', '', '27896260-a5eb-4d79-8744-1e6c7de96360', 209);
INSERT INTO mappedusercustomerlink (mcustomerid, createdat, updatedat, mdateinserted, misactive, musercustomerlinkid, muserid, id) VALUES ('61', '2015-05-01 12:00:00.081', '2015-05-01 12:00:00.082', '2015-05-01 12:00:00.082', true, '9c8e496c-eb11-428f-b38e-58a50f7e4ea5', '27896260-a5eb-4d79-8744-1e6c7de96360', 61);

INSERT INTO users (id, firstname, lastname, email, username, password_pw, password_slt, provider, uniqueid, timezone, validated, superuser, user_c, locale) VALUES (
61,'Jurek','Okrasa','jurek.okrasa@example.com','okrasa.jurek','b;$2a$10$7QZ4Xj6Chg4vKnfoWJuSx.AflzmmFT1e40TOq','zdLW2M4YOoH7du0K',NULL,'SZPBZIEHQPAJGYOHZSMBJULJTWKKZVMI','Europe/Warsaw', true, false,'61','en');

INSERT INTO viewprivileges (createdat, updatedat, user_c, view_c, id) VALUES ('2017-03-28 12:00:00.081', '2017-03-28 12:00:00.082', 61, 91, 61);


INSERT INTO apiuser (userid_, hascrmadminrole, hascrmreaderrole, hascustomermessageadminrole, hasbranchreaderrole, hasatmreaderrole, hasproductreaderrole, email, name_, provider_, providerid, id, apiuser) VALUES 
('73fffbc1-7cfe-4cac-9527-ebdad9beaefb', false, false, false, false, false, false, 'olga.kurek@example.com', 'Olga Kurek', 'http://127.0.0.1:8080', NULL, 62, NULL);

INSERT INTO mappedaccountholder (accountbankpermalink, accountpermalink, user_c, id) VALUES ('ing', 'a2fd161d-de1e-4518-b1c8-a0481e5b529d', 62, 62);

INSERT INTO mappedbankaccount 
(accountnumber, createdat, updatedat, theaccountid, bank, accountiban, accountcurrency, accountswiftbic, accountbalance, accountname, accountlabel, accountlastupdate, kind, holder, id) 
VALUES 
('92','2015-05-01 12:00:00.083','2015-05-01 12:00:00.083','a2fd161d-de1e-4518-b1c8-a0481e5b529d','ing','PL43051272729877444034532048','EUR',' ',66636056.57,'Konto Komfort','Konto Komfort','2015-05-01 12:00:00.083','CURRENT PLUS','Olga Kurek',92);


INSERT INTO mappedcustomer (
mmobilenumber, mrelationshipstatus, mhighesteducationattained, memploymentstatus, mlastokdate, mcustomerid, mfaceimageurl, mdateofbirth, mbank, createdat, updatedat, mlegalname, memail, mfaceimagetime, muser, mnumber, mkycstatus, mdependents, id) VALUES 
(
'+48 555000555','Kawaler','bachelor','none','2015-05-01 12:00:00.083','62',NULL,'1991-07-23','ing','2015-05-01 12:00:00.083','2015-05-01 12:00:00.083','Olga Kurek','olga.kurek@example.com',NULL,62,'62',false,0,62);

INSERT INTO mappedentitlement (mrolename, mentitlementid, createdat, updatedat, mbankid, muserid, id) VALUES ('CanGetSocialMediaHandles', 'cc7444d5-54f4-4e6c-9890-43e0e75da2bf', '2017-03-28 12:00:00.05', '2017-03-28 12:00:00.05', 'ing', '73fffbc1-7cfe-4cac-9527-ebdad9beaefb', 210);
INSERT INTO mappedentitlement (mrolename, mentitlementid, createdat, updatedat, mbankid, muserid, id) VALUES ('CanAddSocialMediaHandle', 'cb8aef72-edbe-4ade-8079-51c6dc7324d0', '2017-03-28 12:00:00.1', '2017-03-28 12:00:00.1', 'ing', '73fffbc1-7cfe-4cac-9527-ebdad9beaefb', 211);
INSERT INTO mappedentitlement (mrolename, mentitlementid, createdat, updatedat, mbankid, muserid, id) VALUES ('CanGetAnyUser', '55a21626-0789-4f92-80cd-063d01ed77cb', '2017-03-28 12:00:00.15', '2017-03-28 12:00:00.15', '', '73fffbc1-7cfe-4cac-9527-ebdad9beaefb', 212);
INSERT INTO mappedusercustomerlink (mcustomerid, createdat, updatedat, mdateinserted, misactive, musercustomerlinkid, muserid, id) VALUES ('62', '2015-05-01 12:00:00.081', '2015-05-01 12:00:00.082', '2015-05-01 12:00:00.082', true, '6b88f892-8300-452f-bc68-b5447efaa9ab', '73fffbc1-7cfe-4cac-9527-ebdad9beaefb', 62);

INSERT INTO users (id, firstname, lastname, email, username, password_pw, password_slt, provider, uniqueid, timezone, validated, superuser, user_c, locale) VALUES (
62,'Olga','Kurek','olga.kurek@example.com','olga.kurek','b;$2a$10$7QZ4Xj6Chg4vKnfoWJuSx.AflzmmFT1e40TOq','zdLW2M4YOoH7du0K',NULL,'SZPBZIEHQPAJGYOHZSMBJULJTWKKZVMI','Europe/Warsaw', true, false,'62','en');

INSERT INTO viewprivileges (createdat, updatedat, user_c, view_c, id) VALUES ('2017-03-28 12:00:00.081', '2017-03-28 12:00:00.082', 62, 92, 62);

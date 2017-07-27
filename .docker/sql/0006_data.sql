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
60,'Jurek','Okrasa','jurek.okrasa@example.com','jurek.okrasa','b;$2a$10$BGc7Kwl2y2rGsGQg8kDVsOUXDerfKqze2llIe','PVO3tDAKoSIUCkuu',NULL,'SZPBZIEHQPAJGYOHZSMBJULJTWKKZVMI','Europe/Warsaw', true, false,'60','en');

INSERT INTO viewprivileges (createdat, updatedat, user_c, view_c, id) VALUES ('2017-03-28 12:00:00.081', '2017-03-28 12:00:00.082', 60, 90, 60);

INSERT INTO apiuser (userid_, hascrmadminrole, hascrmreaderrole, hascustomermessageadminrole, hasbranchreaderrole, hasatmreaderrole, hasproductreaderrole, email, name_, provider_, providerid, id, apiuser) VALUES 
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
61,'Jurek','Okrasa','jurek.okrasa@example.com','okrasa.jurek','b;$2a$10$kJs38aMRyk6At0EOHyASr.7ayRo8cvleqOyux','w7xGXly/P0Ll9iZe',NULL,'SZPBZIEHQPAJGYOHZSMBJULJTWKKZVMI','Europe/Warsaw', true, false,'61','en');

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
62,'Olga','Kurek','olga.kurek@example.com','olga.kurek','b;$2a$10$Ui.4Puz4.iWsa4GtfeypxuP07hhXUGBCV/b3Z','ucKxGdiGF3Y2v7Jm',NULL,'SZPBZIEHQPAJGYOHZSMBJULJTWKKZVMI','Europe/Warsaw', true, false,'62','en');

INSERT INTO viewprivileges (createdat, updatedat, user_c, view_c, id) VALUES ('2017-03-28 12:00:00.081', '2017-03-28 12:00:00.082', 62, 92, 62);


INSERT INTO apiuser (userid_, hascrmadminrole, hascrmreaderrole, hascustomermessageadminrole, hasbranchreaderrole, hasatmreaderrole, hasproductreaderrole, email, name_, provider_, providerid, id, apiuser) VALUES 
('88c85376-c20e-40ba-9b39-534e65586efc', false, false, false, false, false, false, 'olga.kurek@example.com', 'Olga Kurek', 'http://127.0.0.1:8080', NULL, 63, NULL);

INSERT INTO mappedaccountholder (accountbankpermalink, accountpermalink, user_c, id) VALUES ('gringotts', 'f6b0e303-c226-412c-9b58-3a436574bdc9', 63, 63);

INSERT INTO mappedbankaccount 
(accountnumber, createdat, updatedat, theaccountid, bank, accountiban, accountcurrency, accountswiftbic, accountbalance, accountname, accountlabel, accountlastupdate, kind, holder, id) 
VALUES 
('93','2015-05-01 12:00:00.083','2015-05-01 12:00:00.083','f6b0e303-c226-412c-9b58-3a436574bdc9','gringotts','PL67086490978622364199404509','EUR',' ',66636056.57,'Konto Komfort','Konto Komfort','2015-05-01 12:00:00.083','CURRENT PLUS','Olga Kurek',93);


INSERT INTO mappedcustomer (
mmobilenumber, mrelationshipstatus, mhighesteducationattained, memploymentstatus, mlastokdate, mcustomerid, mfaceimageurl, mdateofbirth, mbank, createdat, updatedat, mlegalname, memail, mfaceimagetime, muser, mnumber, mkycstatus, mdependents, id) VALUES 
(
'+48 555000555','Kawaler','bachelor','none','2015-05-01 12:00:00.083','63',NULL,'1991-07-23','gringotts','2015-05-01 12:00:00.083','2015-05-01 12:00:00.083','Olga Kurek','olga.kurek@example.com',NULL,63,'63',false,0,63);

INSERT INTO mappedentitlement (mrolename, mentitlementid, createdat, updatedat, mbankid, muserid, id) VALUES ('CanGetSocialMediaHandles', 'db273bbe-9587-4827-8652-9f9a8082cfa2', '2017-03-28 12:00:00.05', '2017-03-28 12:00:00.05', 'gringotts', '88c85376-c20e-40ba-9b39-534e65586efc', 214);
INSERT INTO mappedentitlement (mrolename, mentitlementid, createdat, updatedat, mbankid, muserid, id) VALUES ('CanAddSocialMediaHandle', '87f1e492-8c99-488f-84bc-845613d80b33', '2017-03-28 12:00:00.1', '2017-03-28 12:00:00.1', 'gringotts', '88c85376-c20e-40ba-9b39-534e65586efc', 215);
INSERT INTO mappedentitlement (mrolename, mentitlementid, createdat, updatedat, mbankid, muserid, id) VALUES ('CanGetAnyUser', '8763ab50-002c-4d62-9218-d8cbcad46150', '2017-03-28 12:00:00.15', '2017-03-28 12:00:00.15', '', '88c85376-c20e-40ba-9b39-534e65586efc', 216);
INSERT INTO mappedusercustomerlink (mcustomerid, createdat, updatedat, mdateinserted, misactive, musercustomerlinkid, muserid, id) VALUES ('63', '2015-05-01 12:00:00.081', '2015-05-01 12:00:00.082', '2015-05-01 12:00:00.082', true, '77e65206-4855-4b74-ae88-481203308e53', '88c85376-c20e-40ba-9b39-534e65586efc', 63);

INSERT INTO users (id, firstname, lastname, email, username, password_pw, password_slt, provider, uniqueid, timezone, validated, superuser, user_c, locale) VALUES (
63,'Olga','Kurek','olga.kurek@example.com','kurek.olga','b;$2a$10$3v1nj21zMYtAClkZisNlP.FCJiigVhhud8L/i','OUET7Jd1Ms1VP0wy',NULL,'SZPBZIEHQPAJGYOHZSMBJULJTWKKZVMI','Europe/Warsaw', true, false,'63','en');

INSERT INTO viewprivileges (createdat, updatedat, user_c, view_c, id) VALUES ('2017-03-28 12:00:00.081', '2017-03-28 12:00:00.082', 63, 93, 63);
INSERT INTO viewimpl (canseeprivatealias_, canseetransactionotherbankaccount_, id_, hideotheraccountmetadataifalias_, useprivatealiasifoneexists_, canseetransactionthisbankaccount_, canseetransactionamount_, usepublicaliasifoneexists_, canseeurl_, canseetransactionmetadata_, canseetransactiondescription_, candeletewheretag_, caninitiatetransaction_, canseetransactionbalance_, canseecomments_, createdat, updatedat, canseetransactioncurrency_, description_, ispublic_, canseetransactiontype_, name_, canaddcorporatelocation_, accountpermalink, canseepublicalias_, bankpermalink, permalink_, canseephysicallocation_, candeletecorporatelocation_, candeletephysicallocation_, caneditownercomment_, candeletecomment_, canseeownercomment_, canseebankaccountowners_, canseeotheraccountnumber_, canseeotheraccountmetadata_, canseeimageurl_, canseeotheraccountiban_, canseeotheraccountbankname_, canseeotheraccountnationalidentifier_, canseeotheraccountswift_bic_, canaddwheretag_, canseebankaccountiban_, canseebankaccountnumber_, canseetransactionstartdate_, canseetransactionfinishdate_, canseewheretag_, canseebankaccountnationalidentifier_, canseebankaccountswift_bic_, canseebankaccountbankname_, canseebankaccountbankpermalink_, candeleteimage_, canseeotheraccountkind_, canseemoreinfo_, canseeimages_, canseecorporatelocation_, canseeopencorporatesurl_, canseebankaccounttype_, canseebankaccountbalance_, canaddimage_, candeletetag_, canaddtag_, canaddcomment_, canseebankaccountcurrency_, canseebankaccountlabel_, canaddimageurl_, canaddurl_, canaddmoreinfo_, canaddopencorporatesurl_, canseetags_, canaddphysicallocation_, canaddpublicalias_, canaddprivatealias_) VALUES (true, true, 90, false, false, true, true, false, true, true, true, true, true, true, true, '2017-03-28 12:00:00.036', '2017-03-28 12:00:00.037', true, 'Owner view', false, true, 'Owner', true, '8cc5aaa2-a4c3-4ef6-bdb7-fc58c4f9e591', true, 'gotham', 'owner', true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
INSERT INTO viewimpl (canseeprivatealias_, canseetransactionotherbankaccount_, id_, hideotheraccountmetadataifalias_, useprivatealiasifoneexists_, canseetransactionthisbankaccount_, canseetransactionamount_, usepublicaliasifoneexists_, canseeurl_, canseetransactionmetadata_, canseetransactiondescription_, candeletewheretag_, caninitiatetransaction_, canseetransactionbalance_, canseecomments_, createdat, updatedat, canseetransactioncurrency_, description_, ispublic_, canseetransactiontype_, name_, canaddcorporatelocation_, accountpermalink, canseepublicalias_, bankpermalink, permalink_, canseephysicallocation_, candeletecorporatelocation_, candeletephysicallocation_, caneditownercomment_, candeletecomment_, canseeownercomment_, canseebankaccountowners_, canseeotheraccountnumber_, canseeotheraccountmetadata_, canseeimageurl_, canseeotheraccountiban_, canseeotheraccountbankname_, canseeotheraccountnationalidentifier_, canseeotheraccountswift_bic_, canaddwheretag_, canseebankaccountiban_, canseebankaccountnumber_, canseetransactionstartdate_, canseetransactionfinishdate_, canseewheretag_, canseebankaccountnationalidentifier_, canseebankaccountswift_bic_, canseebankaccountbankname_, canseebankaccountbankpermalink_, candeleteimage_, canseeotheraccountkind_, canseemoreinfo_, canseeimages_, canseecorporatelocation_, canseeopencorporatesurl_, canseebankaccounttype_, canseebankaccountbalance_, canaddimage_, candeletetag_, canaddtag_, canaddcomment_, canseebankaccountcurrency_, canseebankaccountlabel_, canaddimageurl_, canaddurl_, canaddmoreinfo_, canaddopencorporatesurl_, canseetags_, canaddphysicallocation_, canaddpublicalias_, canaddprivatealias_) VALUES (true, true, 91, false, false, true, true, false, true, true, true, true, true, true, true, '2017-03-28 12:00:00.036', '2017-03-28 12:00:00.037', true, 'Owner view', false, true, 'Owner', true, '11c725fe-e39d-49c3-97e5-37545557aad1', true, 'ing', 'owner', true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
INSERT INTO viewimpl (canseeprivatealias_, canseetransactionotherbankaccount_, id_, hideotheraccountmetadataifalias_, useprivatealiasifoneexists_, canseetransactionthisbankaccount_, canseetransactionamount_, usepublicaliasifoneexists_, canseeurl_, canseetransactionmetadata_, canseetransactiondescription_, candeletewheretag_, caninitiatetransaction_, canseetransactionbalance_, canseecomments_, createdat, updatedat, canseetransactioncurrency_, description_, ispublic_, canseetransactiontype_, name_, canaddcorporatelocation_, accountpermalink, canseepublicalias_, bankpermalink, permalink_, canseephysicallocation_, candeletecorporatelocation_, candeletephysicallocation_, caneditownercomment_, candeletecomment_, canseeownercomment_, canseebankaccountowners_, canseeotheraccountnumber_, canseeotheraccountmetadata_, canseeimageurl_, canseeotheraccountiban_, canseeotheraccountbankname_, canseeotheraccountnationalidentifier_, canseeotheraccountswift_bic_, canaddwheretag_, canseebankaccountiban_, canseebankaccountnumber_, canseetransactionstartdate_, canseetransactionfinishdate_, canseewheretag_, canseebankaccountnationalidentifier_, canseebankaccountswift_bic_, canseebankaccountbankname_, canseebankaccountbankpermalink_, candeleteimage_, canseeotheraccountkind_, canseemoreinfo_, canseeimages_, canseecorporatelocation_, canseeopencorporatesurl_, canseebankaccounttype_, canseebankaccountbalance_, canaddimage_, candeletetag_, canaddtag_, canaddcomment_, canseebankaccountcurrency_, canseebankaccountlabel_, canaddimageurl_, canaddurl_, canaddmoreinfo_, canaddopencorporatesurl_, canseetags_, canaddphysicallocation_, canaddpublicalias_, canaddprivatealias_) VALUES (true, true, 92, false, false, true, true, false, true, true, true, true, true, true, true, '2017-03-28 12:00:00.036', '2017-03-28 12:00:00.037', true, 'Owner view', false, true, 'Owner', true, 'a2fd161d-de1e-4518-b1c8-a0481e5b529d', true, 'ing', 'owner', true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
INSERT INTO viewimpl (canseeprivatealias_, canseetransactionotherbankaccount_, id_, hideotheraccountmetadataifalias_, useprivatealiasifoneexists_, canseetransactionthisbankaccount_, canseetransactionamount_, usepublicaliasifoneexists_, canseeurl_, canseetransactionmetadata_, canseetransactiondescription_, candeletewheretag_, caninitiatetransaction_, canseetransactionbalance_, canseecomments_, createdat, updatedat, canseetransactioncurrency_, description_, ispublic_, canseetransactiontype_, name_, canaddcorporatelocation_, accountpermalink, canseepublicalias_, bankpermalink, permalink_, canseephysicallocation_, candeletecorporatelocation_, candeletephysicallocation_, caneditownercomment_, candeletecomment_, canseeownercomment_, canseebankaccountowners_, canseeotheraccountnumber_, canseeotheraccountmetadata_, canseeimageurl_, canseeotheraccountiban_, canseeotheraccountbankname_, canseeotheraccountnationalidentifier_, canseeotheraccountswift_bic_, canaddwheretag_, canseebankaccountiban_, canseebankaccountnumber_, canseetransactionstartdate_, canseetransactionfinishdate_, canseewheretag_, canseebankaccountnationalidentifier_, canseebankaccountswift_bic_, canseebankaccountbankname_, canseebankaccountbankpermalink_, candeleteimage_, canseeotheraccountkind_, canseemoreinfo_, canseeimages_, canseecorporatelocation_, canseeopencorporatesurl_, canseebankaccounttype_, canseebankaccountbalance_, canaddimage_, candeletetag_, canaddtag_, canaddcomment_, canseebankaccountcurrency_, canseebankaccountlabel_, canaddimageurl_, canaddurl_, canaddmoreinfo_, canaddopencorporatesurl_, canseetags_, canaddphysicallocation_, canaddpublicalias_, canaddprivatealias_) VALUES (true, true, 93, false, false, true, true, false, true, true, true, true, true, true, true, '2017-03-28 12:00:00.036', '2017-03-28 12:00:00.037', true, 'Owner view', false, true, 'Owner', true, 'f6b0e303-c226-412c-9b58-3a436574bdc9', true, 'gringotts', 'owner', true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);

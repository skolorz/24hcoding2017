--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE admins (
    id bigint NOT NULL,
    firstname character varying(32),
    lastname character varying(32),
    email character varying(48),
    locale character varying(16),
    timezone character varying(32),
    password_pw character varying(48),
    password_slt character varying(20),
    uniqueid character varying(32),
    validated boolean,
    superuser boolean
);


ALTER TABLE admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE admins_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: apiuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE apiuser (
    userid_ character varying(36),
    hascrmadminrole boolean,
    hascrmreaderrole boolean,
    hascustomermessageadminrole boolean,
    hasbranchreaderrole boolean,
    hasatmreaderrole boolean,
    hasproductreaderrole boolean,
    email character varying(48),
    name_ character varying(100),
    provider_ character varying(100),
    providerid character varying(100),
    id bigint NOT NULL,
    apiuser character varying(48)
);


ALTER TABLE apiuser OWNER TO postgres;

--
-- Name: apiuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE apiuser_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE apiuser_id_seq OWNER TO postgres;

--
-- Name: apiuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE apiuser_id_seq OWNED BY apiuser.id;


--
-- Name: consumer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE consumer (
    name character varying(100),
    apptype bigint,
    description text,
    developeremail character varying(100),
    secret character varying(250),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    userauthenticationurl character varying(250),
    isactive boolean,
    key_c character varying(250),
    id bigint NOT NULL,
    apiuserid character varying(4)
);


ALTER TABLE consumer OWNER TO postgres;

--
-- Name: consumer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE consumer_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE consumer_id_seq OWNER TO postgres;

--
-- Name: consumer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE consumer_id_seq OWNED BY consumer.id;


--
-- Name: logintoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE logintoken (
    createdat timestamp without time zone,
    token character varying(255),
    verified boolean DEFAULT false,
    active boolean DEFAULT true,
    user_id bigint,
    consumer_id bigint,
    id bigint NOT NULL
);


ALTER TABLE logintoken OWNER TO postgres;

--
-- Name: logintoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE logintoken_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE logintoken_id_seq OWNER TO postgres;

--
-- Name: logintoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE logintoken_id_seq OWNED BY logintoken.id;


--
-- Name: mappedaccountholder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedaccountholder (
    accountbankpermalink character varying(255),
    accountpermalink character varying(255),
    user_c bigint,
    id bigint NOT NULL
);


ALTER TABLE mappedaccountholder OWNER TO postgres;

--
-- Name: mappedaccountholder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedaccountholder_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedaccountholder_id_seq OWNER TO postgres;

--
-- Name: mappedaccountholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedaccountholder_id_seq OWNED BY mappedaccountholder.id;


--
-- Name: mappedatm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedatm (
    matmid character varying(2000),
    mbankid character varying(2000),
    mline1 character varying(2000),
    mline2 character varying(2000),
    mline3 character varying(2000),
    mcity character varying(2000),
    mcounty character varying(2000),
    mstate character varying(2000),
    mcountrycode character varying(2),
    mpostcode character varying(2000),
    mlocationlatitude double precision,
    mlocationlongitude double precision,
    mlicenseid character varying(2000),
    mlicensename character varying(2000),
    mname character varying(2000),
    id bigint NOT NULL
);


ALTER TABLE mappedatm OWNER TO postgres;

--
-- Name: mappedatm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedatm_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedatm_id_seq OWNER TO postgres;

--
-- Name: mappedatm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedatm_id_seq OWNED BY mappedatm.id;


--
-- Name: mappedbank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedbank (
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    fullbankname character varying(255),
    shortbankname character varying(100),
    logourl character varying(255),
    websiteurl character varying(255),
    swiftbic character varying(255),
    national_identifier character varying(255),
    permalink character varying(255),
    id bigint NOT NULL
);


ALTER TABLE mappedbank OWNER TO postgres;

--
-- Name: mappedbank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedbank_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedbank_id_seq OWNER TO postgres;

--
-- Name: mappedbank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedbank_id_seq OWNED BY mappedbank.id;


--
-- Name: mappedbankaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedbankaccount (
    accountnumber character varying(128),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    theaccountid character varying(255),
    bank character varying(255),
    accountiban character varying(50),
    accountcurrency character varying(10),
    accountswiftbic character varying(50),
    accountbalance bigint,
    accountname character varying(255),
    accountlabel character varying(255),
    accountlastupdate timestamp without time zone,
    kind character varying(255),
    holder character varying(100),
    id bigint NOT NULL
);


ALTER TABLE mappedbankaccount OWNER TO postgres;

--
-- Name: mappedbankaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedbankaccount_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedbankaccount_id_seq OWNER TO postgres;

--
-- Name: mappedbankaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedbankaccount_id_seq OWNED BY mappedbankaccount.id;


--
-- Name: mappedbranch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedbranch (
    mbranchid character varying(2000),
    mbankid character varying(2000),
    mline1 character varying(2000),
    mline2 character varying(2000),
    mline3 character varying(2000),
    mcity character varying(2000),
    mcounty character varying(2000),
    mstate character varying(2000),
    mcountrycode character varying(2),
    mpostcode character varying(2000),
    mlocationlatitude double precision,
    mlocationlongitude double precision,
    mlicenseid character varying(2000),
    mlicensename character varying(2000),
    mlobbyhours character varying(2000),
    mdriveuphours character varying(2000),
    mname character varying(2000),
    id bigint NOT NULL
);


ALTER TABLE mappedbranch OWNER TO postgres;

--
-- Name: mappedbranch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedbranch_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedbranch_id_seq OWNER TO postgres;

--
-- Name: mappedbranch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedbranch_id_seq OWNED BY mappedbranch.id;


--
-- Name: mappedcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedcomment (
    apiid character varying(36),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    transaction_c character varying(255),
    text_ character varying(2000),
    poster bigint,
    replyto character varying(36),
    account character varying(255),
    bank character varying(255),
    date_c timestamp without time zone,
    view_c character varying(255),
    id bigint NOT NULL
);


ALTER TABLE mappedcomment OWNER TO postgres;

--
-- Name: mappedcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedcomment_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedcomment_id_seq OWNER TO postgres;

--
-- Name: mappedcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedcomment_id_seq OWNED BY mappedcomment.id;


--
-- Name: mappedcounterpartymetadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedcounterpartymetadata (
    counterpartyid character varying(36),
    thisaccountbankid character varying(255),
    thisaccountid character varying(255),
    accountnumber character varying(128),
    publicalias character varying(2000),
    privatealias character varying(2000),
    moreinfo character varying(2000),
    imageurl character varying(2000),
    opencorporatesurl character varying(2000),
    corporatelocation bigint,
    physicallocation bigint,
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    url character varying(2000),
    holder character varying(255),
    id bigint NOT NULL
);


ALTER TABLE mappedcounterpartymetadata OWNER TO postgres;

--
-- Name: mappedcounterpartymetadata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedcounterpartymetadata_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedcounterpartymetadata_id_seq OWNER TO postgres;

--
-- Name: mappedcounterpartymetadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedcounterpartymetadata_id_seq OWNED BY mappedcounterpartymetadata.id;


--
-- Name: mappedcounterpartywheretag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedcounterpartywheretag (
    geolatitude double precision,
    geolongitude double precision,
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    date_c timestamp without time zone,
    user_c bigint,
    id bigint NOT NULL
);


ALTER TABLE mappedcounterpartywheretag OWNER TO postgres;

--
-- Name: mappedcounterpartywheretag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedcounterpartywheretag_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedcounterpartywheretag_id_seq OWNER TO postgres;

--
-- Name: mappedcounterpartywheretag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedcounterpartywheretag_id_seq OWNED BY mappedcounterpartywheretag.id;


--
-- Name: mappedcrmevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedcrmevent (
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    mcrmeventid character varying(36),
    mbankid character varying(2000),
    mchannel character varying(2000),
    mscheduleddate timestamp without time zone,
    mactualdate timestamp without time zone,
    mresult character varying(2000),
    mcustomername character varying(2000),
    mcustomernumber character varying(2000),
    mcategory character varying(2000),
    muserid bigint,
    mdetail character varying(2000),
    id bigint NOT NULL
);


ALTER TABLE mappedcrmevent OWNER TO postgres;

--
-- Name: mappedcrmevent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedcrmevent_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedcrmevent_id_seq OWNER TO postgres;

--
-- Name: mappedcrmevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedcrmevent_id_seq OWNED BY mappedcrmevent.id;


--
-- Name: mappedcustomer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedcustomer (
    mmobilenumber character varying(2000),
    mrelationshipstatus character varying(2000),
    mhighesteducationattained character varying(2000),
    memploymentstatus character varying(2000),
    mlastokdate timestamp without time zone,
    mcustomerid character varying(36),
    mfaceimageurl character varying(2000),
    mdateofbirth timestamp without time zone,
    mbank character varying(2000),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    mlegalname character varying(2000),
    memail character varying(200),
    mfaceimagetime timestamp without time zone,
    muser bigint,
    mnumber character varying(2000),
    mkycstatus boolean,
    mdependents integer,
    id bigint NOT NULL
);


ALTER TABLE mappedcustomer OWNER TO postgres;

--
-- Name: mappedcustomer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedcustomer_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedcustomer_id_seq OWNER TO postgres;

--
-- Name: mappedcustomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedcustomer_id_seq OWNED BY mappedcustomer.id;


--
-- Name: mappedcustomermessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedcustomermessage (
    mfromperson character varying(2000),
    mfromdepartment character varying(2000),
    mmessage character varying(2000),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    bank character varying(2000),
    mmessageid character varying(36),
    user_c bigint,
    id bigint NOT NULL
);


ALTER TABLE mappedcustomermessage OWNER TO postgres;

--
-- Name: mappedcustomermessage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedcustomermessage_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedcustomermessage_id_seq OWNER TO postgres;

--
-- Name: mappedcustomermessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedcustomermessage_id_seq OWNED BY mappedcustomermessage.id;


--
-- Name: mappedentitlement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedentitlement (
    mrolename character varying(2000),
    mentitlementid character varying(36),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    mbankid character varying(2000),
    muserid character varying(2000),
    id bigint NOT NULL
);


ALTER TABLE mappedentitlement OWNER TO postgres;

--
-- Name: mappedentitlement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedentitlement_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedentitlement_id_seq OWNER TO postgres;

--
-- Name: mappedentitlement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedentitlement_id_seq OWNED BY mappedentitlement.id;


--
-- Name: mappedkafkabankaccountdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedkafkabankaccountdata (
    accountid character varying(255),
    bankid character varying(255),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    accountlabel character varying(255),
    id bigint NOT NULL
);


ALTER TABLE mappedkafkabankaccountdata OWNER TO postgres;

--
-- Name: mappedkafkabankaccountdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedkafkabankaccountdata_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedkafkabankaccountdata_id_seq OWNER TO postgres;

--
-- Name: mappedkafkabankaccountdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedkafkabankaccountdata_id_seq OWNED BY mappedkafkabankaccountdata.id;


--
-- Name: mappedkyccheck; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedkyccheck (
    mhow character varying(2000),
    mstaffuserid character varying(2000),
    mstaffname character varying(2000),
    msatisfied boolean,
    mcomments character varying(2000),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    bank character varying(2000),
    mdate timestamp without time zone,
    mcustomernumber character varying(2000),
    mid character varying(2000),
    user_c bigint,
    id bigint NOT NULL
);


ALTER TABLE mappedkyccheck OWNER TO postgres;

--
-- Name: mappedkyccheck_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedkyccheck_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedkyccheck_id_seq OWNER TO postgres;

--
-- Name: mappedkyccheck_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedkyccheck_id_seq OWNED BY mappedkyccheck.id;


--
-- Name: mappedkycdocument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedkycdocument (
    missuedate timestamp without time zone,
    missueplace character varying(2000),
    mexpirydate timestamp without time zone,
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    bank character varying(2000),
    mtype character varying(2000),
    mnumber character varying(2000),
    mcustomernumber character varying(2000),
    mid character varying(2000),
    user_c bigint,
    id bigint NOT NULL
);


ALTER TABLE mappedkycdocument OWNER TO postgres;

--
-- Name: mappedkycdocument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedkycdocument_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedkycdocument_id_seq OWNER TO postgres;

--
-- Name: mappedkycdocument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedkycdocument_id_seq OWNED BY mappedkycdocument.id;


--
-- Name: mappedkycmedia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedkycmedia (
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    bank character varying(2000),
    murl character varying(2000),
    mdate timestamp without time zone,
    mrelatestokycdocumentid character varying(2000),
    mrelatestokyccheckid character varying(2000),
    mtype character varying(2000),
    mcustomernumber character varying(2000),
    mid character varying(2000),
    user_c bigint,
    id bigint NOT NULL
);


ALTER TABLE mappedkycmedia OWNER TO postgres;

--
-- Name: mappedkycmedia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedkycmedia_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedkycmedia_id_seq OWNER TO postgres;

--
-- Name: mappedkycmedia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedkycmedia_id_seq OWNED BY mappedkycmedia.id;


--
-- Name: mappedkycstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedkycstatus (
    mok boolean,
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    bank character varying(2000),
    mdate timestamp without time zone,
    mcustomernumber character varying(2000),
    user_c bigint,
    id bigint NOT NULL
);


ALTER TABLE mappedkycstatus OWNER TO postgres;

--
-- Name: mappedkycstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedkycstatus_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedkycstatus_id_seq OWNER TO postgres;

--
-- Name: mappedkycstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedkycstatus_id_seq OWNED BY mappedkycstatus.id;


--
-- Name: mappedmeeting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedmeeting (
    mstaffuserid bigint,
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    mbankid character varying(2000),
    mmeetingid character varying(36),
    mcustomeruserid bigint,
    mproviderid character varying(2000),
    mpurposeid character varying(2000),
    msessionid character varying(2000),
    mcustomertoken character varying(2000),
    mstafftoken character varying(2000),
    mwhen timestamp without time zone,
    id bigint NOT NULL
);


ALTER TABLE mappedmeeting OWNER TO postgres;

--
-- Name: mappedmeeting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedmeeting_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedmeeting_id_seq OWNER TO postgres;

--
-- Name: mappedmeeting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedmeeting_id_seq OWNED BY mappedmeeting.id;


--
-- Name: mappedmetric; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedmetric (
    userid character varying(2000),
    developeremail character varying(2000),
    appname character varying(2000),
    url character varying(2000),
    date_c timestamp without time zone,
    username character varying(2000),
    id bigint NOT NULL
);


ALTER TABLE mappedmetric OWNER TO postgres;

--
-- Name: mappedmetric_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedmetric_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedmetric_id_seq OWNER TO postgres;

--
-- Name: mappedmetric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedmetric_id_seq OWNED BY mappedmetric.id;


--
-- Name: mappednarrative; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappednarrative (
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    transaction_c character varying(255),
    narrative character varying(2000),
    account character varying(255),
    bank character varying(255),
    id bigint NOT NULL
);


ALTER TABLE mappednarrative OWNER TO postgres;

--
-- Name: mappednarrative_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappednarrative_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappednarrative_id_seq OWNER TO postgres;

--
-- Name: mappednarrative_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappednarrative_id_seq OWNED BY mappednarrative.id;


--
-- Name: mappedproduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedproduct (
    mcode character varying(2000),
    mbankid character varying(2000),
    mlicenseid character varying(2000),
    mlicensename character varying(2000),
    mcategory character varying(2000),
    mfamily character varying(2000),
    msuperfamily character varying(2000),
    mmoreinfourl character varying(2000),
    mname character varying(2000),
    id bigint NOT NULL
);


ALTER TABLE mappedproduct OWNER TO postgres;

--
-- Name: mappedproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedproduct_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedproduct_id_seq OWNER TO postgres;

--
-- Name: mappedproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedproduct_id_seq OWNED BY mappedproduct.id;


--
-- Name: mappedsocialmedia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedsocialmedia (
    mdateadded timestamp without time zone,
    mdateactivated timestamp without time zone,
    mhandle character varying(2000),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    bank character varying(2000),
    mtype character varying(2000),
    mcustomernumber character varying(2000),
    user_c bigint,
    id bigint NOT NULL
);


ALTER TABLE mappedsocialmedia OWNER TO postgres;

--
-- Name: mappedsocialmedia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedsocialmedia_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedsocialmedia_id_seq OWNER TO postgres;

--
-- Name: mappedsocialmedia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedsocialmedia_id_seq OWNED BY mappedsocialmedia.id;


--
-- Name: mappedtransaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedtransaction (
    transactionid character varying(255),
    transactionuuid character varying(36),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    transactiontype character varying(100),
    amount bigint,
    account character varying(255),
    bank character varying(255),
    newaccountbalance bigint,
    tstartdate timestamp without time zone,
    tfinishdate timestamp without time zone,
    counterpartyaccountnumber character varying(128),
    counterpartyaccountholder character varying(100),
    counterpartynationalid character varying(40),
    counterpartybankname character varying(100),
    counterpartyiban character varying(100),
    counterpartyaccountkind character varying(40),
    extrainfo character varying(2000),
    description character varying(2000),
    currency character varying(10),
    id bigint NOT NULL
);


ALTER TABLE mappedtransaction OWNER TO postgres;

--
-- Name: mappedtransaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedtransaction_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedtransaction_id_seq OWNER TO postgres;

--
-- Name: mappedtransaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedtransaction_id_seq OWNED BY mappedtransaction.id;


--
-- Name: mappedtransactionimage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedtransactionimage (
    imagedescription character varying(2000),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    transaction_c character varying(255),
    account character varying(255),
    bank character varying(255),
    imageid character varying(36),
    url character varying(2000),
    date_c timestamp without time zone,
    user_c bigint,
    view_c character varying(255),
    id bigint NOT NULL
);


ALTER TABLE mappedtransactionimage OWNER TO postgres;

--
-- Name: mappedtransactionimage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedtransactionimage_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedtransactionimage_id_seq OWNER TO postgres;

--
-- Name: mappedtransactionimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedtransactionimage_id_seq OWNED BY mappedtransactionimage.id;


--
-- Name: mappedtransactionrequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedtransactionrequest (
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    mtransactionrequestid character varying(2000),
    mtype character varying(2000),
    mfrom_bankid character varying(2000),
    mfrom_accountid character varying(2000),
    mbody_to_bankid character varying(2000),
    mbody_to_accountid character varying(2000),
    mbody_value_currency character varying(2000),
    mbody_value_amount character varying(2000),
    mbody_description character varying(2000),
    mtransactionids character varying(2000),
    mstatus character varying(2000),
    mstartdate date,
    menddate date,
    mchallenge_id character varying(2000),
    mchallenge_allowedattempts integer,
    mchallenge_challengetype character varying(2000),
    mcharge_summary character varying(2000),
    mcharge_amount character varying(2000),
    mcharge_currency character varying(2000),
    id bigint NOT NULL,
    mbody_to_iban character varying(2000)
);


ALTER TABLE mappedtransactionrequest OWNER TO postgres;

--
-- Name: mappedtransactionrequest210; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedtransactionrequest210 (
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    mtransactionrequestid character varying(2000),
    mtype character varying(2000),
    mfrom_bankid character varying(2000),
    mfrom_accountid character varying(2000),
    mtransactionids character varying(2000),
    mstatus character varying(2000),
    mstartdate date,
    menddate date,
    mchallenge_id character varying(2000),
    mchallenge_allowedattempts integer,
    mchallenge_challengetype character varying(2000),
    mcharge_summary character varying(2000),
    mcharge_amount character varying(2000),
    mcharge_currency character varying(2000),
    mdetails character varying(2000),
    id bigint NOT NULL
);


ALTER TABLE mappedtransactionrequest210 OWNER TO postgres;

--
-- Name: mappedtransactionrequest210_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedtransactionrequest210_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedtransactionrequest210_id_seq OWNER TO postgres;

--
-- Name: mappedtransactionrequest210_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedtransactionrequest210_id_seq OWNED BY mappedtransactionrequest210.id;


--
-- Name: mappedtransactionrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedtransactionrequest_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedtransactionrequest_id_seq OWNER TO postgres;

--
-- Name: mappedtransactionrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedtransactionrequest_id_seq OWNED BY mappedtransactionrequest.id;


--
-- Name: mappedtransactiontype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedtransactiontype (
    mdescription character varying(2000),
    mcustomerfee_currency character varying(3),
    mcustomerfee_amount bigint,
    msummary character varying(2000),
    mtransactiontypeid character varying(2000),
    mshortcode character varying(2000),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    mbankid character varying(2000),
    id bigint NOT NULL
);


ALTER TABLE mappedtransactiontype OWNER TO postgres;

--
-- Name: mappedtransactiontype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedtransactiontype_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedtransactiontype_id_seq OWNER TO postgres;

--
-- Name: mappedtransactiontype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedtransactiontype_id_seq OWNED BY mappedtransactiontype.id;


--
-- Name: mappedusercustomerlink; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedusercustomerlink (
    mcustomerid character varying(2000),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    mdateinserted timestamp without time zone,
    misactive boolean,
    musercustomerlinkid character varying(36),
    muserid character varying(2000),
    id bigint NOT NULL
);


ALTER TABLE mappedusercustomerlink OWNER TO postgres;

--
-- Name: mappedusercustomerlink_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedusercustomerlink_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedusercustomerlink_id_seq OWNER TO postgres;

--
-- Name: mappedusercustomerlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedusercustomerlink_id_seq OWNED BY mappedusercustomerlink.id;


--
-- Name: mappedwheretag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappedwheretag (
    geolatitude double precision,
    geolongitude double precision,
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    transaction_c character varying(255),
    account character varying(255),
    bank character varying(255),
    date_c timestamp without time zone,
    user_c bigint,
    view_c character varying(255),
    id bigint NOT NULL
);


ALTER TABLE mappedwheretag OWNER TO postgres;

--
-- Name: mappedwheretag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mappedwheretag_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE mappedwheretag_id_seq OWNER TO postgres;

--
-- Name: mappedwheretag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mappedwheretag_id_seq OWNED BY mappedwheretag.id;


--
-- Name: nonce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE nonce (
    consumerkey character varying(250),
    tokenkey character varying(250),
    value character varying(250),
    timestamp_c timestamp without time zone,
    id bigint NOT NULL
);


ALTER TABLE nonce OWNER TO postgres;

--
-- Name: nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nonce_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE nonce_id_seq OWNER TO postgres;

--
-- Name: nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nonce_id_seq OWNED BY nonce.id;


--
-- Name: token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE token (
    consumerid bigint,
    userforeignkey bigint,
    secret character varying(250),
    callbackurl character varying(250),
    verifier character varying(250),
    expirationdate timestamp without time zone,
    insertdate timestamp without time zone,
    thirdpartyapplicationsecret character varying(10),
    tokentype bigint,
    duration bigint,
    key_c character varying(250),
    id bigint NOT NULL
);


ALTER TABLE token OWNER TO postgres;

--
-- Name: token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE token_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE token_id_seq OWNER TO postgres;

--
-- Name: token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE token_id_seq OWNED BY token.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id bigint NOT NULL,
    firstname character varying(32),
    lastname character varying(32),
    email character varying(48),
    username character varying(64),
    password_pw character varying(48),
    password_slt character varying(20),
    provider character varying(64),
    uniqueid character varying(32),
    timezone character varying(32),
    validated boolean,
    superuser boolean,
    user_c bigint,
    locale character varying(16)
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: viewimpl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE viewimpl (
    canseeprivatealias_ boolean,
    canseetransactionotherbankaccount_ boolean,
    id_ bigint NOT NULL,
    hideotheraccountmetadataifalias_ boolean,
    useprivatealiasifoneexists_ boolean,
    canseetransactionthisbankaccount_ boolean,
    canseetransactionamount_ boolean,
    usepublicaliasifoneexists_ boolean,
    canseeurl_ boolean,
    canseetransactionmetadata_ boolean,
    canseetransactiondescription_ boolean,
    candeletewheretag_ boolean,
    caninitiatetransaction_ boolean,
    canseetransactionbalance_ boolean,
    canseecomments_ boolean,
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    canseetransactioncurrency_ boolean,
    description_ character varying(255),
    ispublic_ boolean,
    canseetransactiontype_ boolean,
    name_ character varying(255),
    canaddcorporatelocation_ boolean,
    accountpermalink character varying(255),
    canseepublicalias_ boolean,
    bankpermalink character varying(255),
    permalink_ character varying(255),
    canseephysicallocation_ boolean,
    candeletecorporatelocation_ boolean,
    candeletephysicallocation_ boolean,
    caneditownercomment_ boolean,
    candeletecomment_ boolean,
    canseeownercomment_ boolean,
    canseebankaccountowners_ boolean,
    canseeotheraccountnumber_ boolean,
    canseeotheraccountmetadata_ boolean,
    canseeimageurl_ boolean,
    canseeotheraccountiban_ boolean,
    canseeotheraccountbankname_ boolean,
    canseeotheraccountnationalidentifier_ boolean,
    canseeotheraccountswift_bic_ boolean,
    canaddwheretag_ boolean,
    canseebankaccountiban_ boolean,
    canseebankaccountnumber_ boolean,
    canseetransactionstartdate_ boolean,
    canseetransactionfinishdate_ boolean,
    canseewheretag_ boolean,
    canseebankaccountnationalidentifier_ boolean,
    canseebankaccountswift_bic_ boolean,
    canseebankaccountbankname_ boolean,
    canseebankaccountbankpermalink_ boolean,
    candeleteimage_ boolean,
    canseeotheraccountkind_ boolean,
    canseemoreinfo_ boolean,
    canseeimages_ boolean,
    canseecorporatelocation_ boolean,
    canseeopencorporatesurl_ boolean,
    canseebankaccounttype_ boolean,
    canseebankaccountbalance_ boolean,
    canaddimage_ boolean,
    candeletetag_ boolean,
    canaddtag_ boolean,
    canaddcomment_ boolean,
    canseebankaccountcurrency_ boolean,
    canseebankaccountlabel_ boolean,
    canaddimageurl_ boolean,
    canaddurl_ boolean,
    canaddmoreinfo_ boolean,
    canaddopencorporatesurl_ boolean,
    canseetags_ boolean,
    canaddphysicallocation_ boolean,
    canaddpublicalias_ boolean,
    canaddprivatealias_ boolean
);


ALTER TABLE viewimpl OWNER TO postgres;

--
-- Name: viewimpl_id__seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE viewimpl_id__seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE viewimpl_id__seq OWNER TO postgres;

--
-- Name: viewimpl_id__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE viewimpl_id__seq OWNED BY viewimpl.id_;


--
-- Name: viewprivileges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE viewprivileges (
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    user_c bigint,
    view_c bigint,
    id bigint NOT NULL
);


ALTER TABLE viewprivileges OWNER TO postgres;

--
-- Name: viewprivileges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE viewprivileges_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE viewprivileges_id_seq OWNER TO postgres;

--
-- Name: viewprivileges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE viewprivileges_id_seq OWNED BY viewprivileges.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: apiuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY apiuser ALTER COLUMN id SET DEFAULT nextval('apiuser_id_seq'::regclass);


--
-- Name: consumer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consumer ALTER COLUMN id SET DEFAULT nextval('consumer_id_seq'::regclass);


--
-- Name: logintoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY logintoken ALTER COLUMN id SET DEFAULT nextval('logintoken_id_seq'::regclass);


--
-- Name: mappedaccountholder id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedaccountholder ALTER COLUMN id SET DEFAULT nextval('mappedaccountholder_id_seq'::regclass);


--
-- Name: mappedatm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedatm ALTER COLUMN id SET DEFAULT nextval('mappedatm_id_seq'::regclass);


--
-- Name: mappedbank id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedbank ALTER COLUMN id SET DEFAULT nextval('mappedbank_id_seq'::regclass);


--
-- Name: mappedbankaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedbankaccount ALTER COLUMN id SET DEFAULT nextval('mappedbankaccount_id_seq'::regclass);


--
-- Name: mappedbranch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedbranch ALTER COLUMN id SET DEFAULT nextval('mappedbranch_id_seq'::regclass);


--
-- Name: mappedcomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedcomment ALTER COLUMN id SET DEFAULT nextval('mappedcomment_id_seq'::regclass);


--
-- Name: mappedcounterpartymetadata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedcounterpartymetadata ALTER COLUMN id SET DEFAULT nextval('mappedcounterpartymetadata_id_seq'::regclass);


--
-- Name: mappedcounterpartywheretag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedcounterpartywheretag ALTER COLUMN id SET DEFAULT nextval('mappedcounterpartywheretag_id_seq'::regclass);


--
-- Name: mappedcrmevent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedcrmevent ALTER COLUMN id SET DEFAULT nextval('mappedcrmevent_id_seq'::regclass);


--
-- Name: mappedcustomer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedcustomer ALTER COLUMN id SET DEFAULT nextval('mappedcustomer_id_seq'::regclass);


--
-- Name: mappedcustomermessage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedcustomermessage ALTER COLUMN id SET DEFAULT nextval('mappedcustomermessage_id_seq'::regclass);


--
-- Name: mappedentitlement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedentitlement ALTER COLUMN id SET DEFAULT nextval('mappedentitlement_id_seq'::regclass);


--
-- Name: mappedkafkabankaccountdata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedkafkabankaccountdata ALTER COLUMN id SET DEFAULT nextval('mappedkafkabankaccountdata_id_seq'::regclass);


--
-- Name: mappedkyccheck id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedkyccheck ALTER COLUMN id SET DEFAULT nextval('mappedkyccheck_id_seq'::regclass);


--
-- Name: mappedkycdocument id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedkycdocument ALTER COLUMN id SET DEFAULT nextval('mappedkycdocument_id_seq'::regclass);


--
-- Name: mappedkycmedia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedkycmedia ALTER COLUMN id SET DEFAULT nextval('mappedkycmedia_id_seq'::regclass);


--
-- Name: mappedkycstatus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedkycstatus ALTER COLUMN id SET DEFAULT nextval('mappedkycstatus_id_seq'::regclass);


--
-- Name: mappedmeeting id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedmeeting ALTER COLUMN id SET DEFAULT nextval('mappedmeeting_id_seq'::regclass);


--
-- Name: mappedmetric id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedmetric ALTER COLUMN id SET DEFAULT nextval('mappedmetric_id_seq'::regclass);


--
-- Name: mappednarrative id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappednarrative ALTER COLUMN id SET DEFAULT nextval('mappednarrative_id_seq'::regclass);


--
-- Name: mappedproduct id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedproduct ALTER COLUMN id SET DEFAULT nextval('mappedproduct_id_seq'::regclass);


--
-- Name: mappedsocialmedia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedsocialmedia ALTER COLUMN id SET DEFAULT nextval('mappedsocialmedia_id_seq'::regclass);


--
-- Name: mappedtransaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedtransaction ALTER COLUMN id SET DEFAULT nextval('mappedtransaction_id_seq'::regclass);


--
-- Name: mappedtransactionimage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedtransactionimage ALTER COLUMN id SET DEFAULT nextval('mappedtransactionimage_id_seq'::regclass);


--
-- Name: mappedtransactionrequest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedtransactionrequest ALTER COLUMN id SET DEFAULT nextval('mappedtransactionrequest_id_seq'::regclass);


--
-- Name: mappedtransactionrequest210 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedtransactionrequest210 ALTER COLUMN id SET DEFAULT nextval('mappedtransactionrequest210_id_seq'::regclass);


--
-- Name: mappedtransactiontype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedtransactiontype ALTER COLUMN id SET DEFAULT nextval('mappedtransactiontype_id_seq'::regclass);


--
-- Name: mappedusercustomerlink id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedusercustomerlink ALTER COLUMN id SET DEFAULT nextval('mappedusercustomerlink_id_seq'::regclass);


--
-- Name: mappedwheretag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappedwheretag ALTER COLUMN id SET DEFAULT nextval('mappedwheretag_id_seq'::regclass);


--
-- Name: nonce id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nonce ALTER COLUMN id SET DEFAULT nextval('nonce_id_seq'::regclass);


--
-- Name: token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY token ALTER COLUMN id SET DEFAULT nextval('token_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: viewimpl id_; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viewimpl ALTER COLUMN id_ SET DEFAULT nextval('viewimpl_id__seq'::regclass);


--
-- Name: viewprivileges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viewprivileges ALTER COLUMN id SET DEFAULT nextval('viewprivileges_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

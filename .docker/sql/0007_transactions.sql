-- Jurek Okrasa 1, Gotham
delete from mappedtransaction where account = '8cc5aaa2-a4c3-4ef6-bdb7-fc58c4f9e591'; 
INSERT INTO mappedtransaction (transactionid, transactionuuid, createdat, updatedat, transactiontype, amount, account, bank, newaccountbalance, tstartdate, tfinishdate, counterpartyaccountnumber, counterpartyaccountholder, counterpartynationalid, counterpartybankname, counterpartyiban, counterpartyaccountkind, extrainfo, description, currency, id) 
select
uuid_in(md5(random()::text || now()::text)::cstring),
uuid_in(md5(random()::text || now()::text)::cstring),
createdat, updatedat, transactiontype, amount, 
'8cc5aaa2-a4c3-4ef6-bdb7-fc58c4f9e591', 
bank, newaccountbalance, tstartdate, tfinishdate, counterpartyaccountnumber, counterpartyaccountholder, counterpartynationalid, counterpartybankname, counterpartyiban, counterpartyaccountkind, extrainfo, description, currency, 
nextval('mappedtransaction_id_seq')
from mappedtransaction 
where account ='08160947-a05f-0831-8e09-197a2d405efc' 
and  CAST(coalesce(counterpartyaccountnumber, '0') AS integer) < 34
and mod(id,5) <> 0
order by id;
-- Transakcje wlasne z konta 1 na 2 na koncie 1
INSERT INTO mappedtransaction (transactionid, transactionuuid, createdat, updatedat, transactiontype, amount, account, bank, 
  newaccountbalance, tstartdate, tfinishdate, counterpartyaccountnumber, counterpartyaccountholder, counterpartynationalid, 
  counterpartybankname, counterpartyiban, counterpartyaccountkind, extrainfo, description, currency, id) 
select
uuid_in(md5(random()::text || now()::text)::cstring),
 uuid_in(md5(random()::text || now()::text)::cstring),
 createdat, updatedat, transactiontype, amount, 
'8cc5aaa2-a4c3-4ef6-bdb7-fc58c4f9e591', 
bank, newaccountbalance, tstartdate, tfinishdate, 
'91', 'Jurek Okrasa', 'PL', 'ING Bank Śląski', 'PL28814919417210050384603558', 'CURRENT PLUS', NULL, 'Internal transfer',
currency, 
nextval('mappedtransaction_id_seq')
from mappedtransaction 
where account ='08160947-a05f-0831-8e09-197a2d405efc' 
and  CAST(coalesce(counterpartyaccountnumber, '0') AS integer) > 44
order by id;
-- Jurek Okrasa 2, ING
delete from mappedtransaction where account = '11c725fe-e39d-49c3-97e5-37545557aad1'; 
-- Transakcje wlasne z konta 1 na 2 na koncie 2
INSERT INTO mappedtransaction (transactionid, transactionuuid, createdat, updatedat, transactiontype, amount, account, bank, 
  newaccountbalance, tstartdate, tfinishdate, counterpartyaccountnumber, counterpartyaccountholder, counterpartynationalid, 
  counterpartybankname, counterpartyiban, counterpartyaccountkind, extrainfo, description, currency, id) 
select
uuid_in(md5(random()::text || now()::text)::cstring),
 uuid_in(md5(random()::text || now()::text)::cstring),
 createdat, updatedat, transactiontype, -amount, 
'11c725fe-e39d-49c3-97e5-37545557aad1', 
bank, newaccountbalance, tstartdate, tfinishdate, 
'90', 'Jurek Okrasa', 'PL', 'ING Bank Śląski', 'PL85638314010013605475285355', 'CURRENT PLUS', NULL, 'Internal transfer',
currency, 
nextval('mappedtransaction_id_seq')
from mappedtransaction 
where account ='08160947-a05f-0831-8e09-197a2d405efc' 
and  CAST(coalesce(counterpartyaccountnumber, '0') AS integer) > 44
order by id;
-- wybrane transakcje z 2 konta
INSERT INTO mappedtransaction (transactionid, transactionuuid, createdat, updatedat, transactiontype, amount, account, bank, newaccountbalance, tstartdate, tfinishdate, counterpartyaccountnumber, counterpartyaccountholder, counterpartynationalid, counterpartybankname, counterpartyiban, counterpartyaccountkind, extrainfo, description, currency, id) 
select
uuid_in(md5(random()::text || now()::text)::cstring),
 uuid_in(md5(random()::text || now()::text)::cstring),
 createdat, updatedat, transactiontype, amount, 
'11c725fe-e39d-49c3-97e5-37545557aad1', 
bank, newaccountbalance, tstartdate, tfinishdate, counterpartyaccountnumber, counterpartyaccountholder, counterpartynationalid, counterpartybankname, counterpartyiban, counterpartyaccountkind, extrainfo, description, currency, 
nextval('mappedtransaction_id_seq')
from mappedtransaction 
where account ='08160947-a05f-0831-8e09-197a2d405efc' 
and mod(id,5) = 0
and  CAST(coalesce(counterpartyaccountnumber, '0') AS integer) < 34;


-- Olga Kurek 1, ING
delete from mappedtransaction where account = 'a2fd161d-de1e-4518-b1c8-a0481e5b529d'; 
INSERT INTO mappedtransaction (transactionid, transactionuuid, createdat, updatedat, transactiontype, amount, account, bank, newaccountbalance, tstartdate, tfinishdate, counterpartyaccountnumber, counterpartyaccountholder, counterpartynationalid, counterpartybankname, counterpartyiban, counterpartyaccountkind, extrainfo, description, currency, id) 
select
uuid_in(md5(random()::text || now()::text)::cstring),
uuid_in(md5(random()::text || now()::text)::cstring),
createdat, updatedat, transactiontype, amount, 
'a2fd161d-de1e-4518-b1c8-a0481e5b529d', 
bank, newaccountbalance, tstartdate, tfinishdate, counterpartyaccountnumber, counterpartyaccountholder, counterpartynationalid, counterpartybankname, counterpartyiban, counterpartyaccountkind, extrainfo, description, currency, 
nextval('mappedtransaction_id_seq')
from mappedtransaction 
where account ='09523417-f1c5-2458-efbd-7e154203f9ca' 
and  CAST(coalesce(counterpartyaccountnumber, '0') AS integer) < 34
and mod(id,5) = 0
order by id;
-- Transakcje wlasne z konta 1 na 2 na koncie 1
INSERT INTO mappedtransaction (transactionid, transactionuuid, createdat, updatedat, transactiontype, amount, account, bank, 
  newaccountbalance, tstartdate, tfinishdate, counterpartyaccountnumber, counterpartyaccountholder, counterpartynationalid, 
  counterpartybankname, counterpartyiban, counterpartyaccountkind, extrainfo, description, currency, id) 
select
uuid_in(md5(random()::text || now()::text)::cstring),
 uuid_in(md5(random()::text || now()::text)::cstring),
 createdat, updatedat, transactiontype, amount, 
'a2fd161d-de1e-4518-b1c8-a0481e5b529d', 
bank, newaccountbalance, tstartdate, tfinishdate, 
'93', 'Olga Kurek', 'PL', 'The Bank Of Gringotts', 'PL6708649097862236419', 'CURRENT PLUS', NULL, 'Internal transfer',
currency, 
nextval('mappedtransaction_id_seq')
from mappedtransaction 
where account ='09523417-f1c5-2458-efbd-7e154203f9ca' 
and  CAST(coalesce(counterpartyaccountnumber, '0') AS integer) > 44
order by id;
-- Olga Kurek 2, ING
delete from mappedtransaction where account = 'f6b0e303-c226-412c-9b58-3a436574bdc9'; 
-- Transakcje wlasne z konta 1 na 2 na koncie 2
INSERT INTO mappedtransaction (transactionid, transactionuuid, createdat, updatedat, transactiontype, amount, account, bank, 
  newaccountbalance, tstartdate, tfinishdate, counterpartyaccountnumber, counterpartyaccountholder, counterpartynationalid, 
  counterpartybankname, counterpartyiban, counterpartyaccountkind, extrainfo, description, currency, id) 
select
uuid_in(md5(random()::text || now()::text)::cstring),
 uuid_in(md5(random()::text || now()::text)::cstring),
 createdat, updatedat, transactiontype, -amount, 
'f6b0e303-c226-412c-9b58-3a436574bdc9', 
bank, newaccountbalance, tstartdate, tfinishdate, 
'92', 'Olga Kurek', 'PL', 'ING Bank Śląski', 'PL43051272729877444034532048', 'CURRENT PLUS', NULL, 'Internal transfer',
currency, 
nextval('mappedtransaction_id_seq')
from mappedtransaction 
where account ='09523417-f1c5-2458-efbd-7e154203f9ca' 
and  CAST(coalesce(counterpartyaccountnumber, '0') AS integer) > 44
order by id;
-- wybrane transakcje z 2 konta
INSERT INTO mappedtransaction (transactionid, transactionuuid, createdat, updatedat, transactiontype, amount, account, bank, newaccountbalance, tstartdate, tfinishdate, counterpartyaccountnumber, counterpartyaccountholder, counterpartynationalid, counterpartybankname, counterpartyiban, counterpartyaccountkind, extrainfo, description, currency, id) 
select
uuid_in(md5(random()::text || now()::text)::cstring),
 uuid_in(md5(random()::text || now()::text)::cstring),
 createdat, updatedat, transactiontype, amount, 
'f6b0e303-c226-412c-9b58-3a436574bdc9', 
bank, newaccountbalance, tstartdate, tfinishdate, counterpartyaccountnumber, counterpartyaccountholder, counterpartynationalid, counterpartybankname, counterpartyiban, counterpartyaccountkind, extrainfo, description, currency, 
nextval('mappedtransaction_id_seq')
from mappedtransaction 
where account ='09523417-f1c5-2458-efbd-7e154203f9ca' 
and mod(id,5) <> 0
and  CAST(coalesce(counterpartyaccountnumber, '0') AS integer) < 34;

CREATE OR REPLACE FUNCTION update_balance(acc varchar) RETURNS void AS '
DECLARE
  trans mappedtransaction%rowtype;
  balance bigint;
BEGIN
  balance = 2000;
  FOR trans IN SELECT * FROM mappedtransaction where account = acc  order by tstartdate LOOP
			balance = balance + trans.amount;
			update mappedtransaction set newaccountbalance=balance where id = trans.id;
  END LOOP;
END;
' LANGUAGE plpgsql;

select update_balance('8cc5aaa2-a4c3-4ef6-bdb7-fc58c4f9e591');
select update_balance('11c725fe-e39d-49c3-97e5-37545557aad1');
select update_balance('a2fd161d-de1e-4518-b1c8-a0481e5b529d');
select update_balance('f6b0e303-c226-412c-9b58-3a436574bdc9');


INSERT INTO texts (default_text) VALUES ('Dev system');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Dev system');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Dev system');
INSERT INTO clientdomains (title_id,url_domain,app_domain,app_name,html_prefix,public_layout,admin_layout,member_layout,sysadmin_layout,created) VALUES (@lastid,'cborghome.ddns.net','toasthub1','cborgcust','cborgcust','publicLayout','adminLayout','memberLayout',null,null);
INSERT INTO texts (default_text) VALUES ('Client1 Dev');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Client1 Dev');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Client1 Dev');
INSERT INTO clientdomains (title_id,url_domain,app_domain,app_name,html_prefix,public_layout,admin_layout,member_layout,sysadmin_layout,created) VALUES (@lastid,'toasthubclient1','toasthub1','cborgcust','cborgcust','publicLayout','adminLayout','memberLayout',null,null);
INSERT INTO texts (default_text) VALUES ('Client2 Dev');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Client2 Dev');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Client2 Dev');
INSERT INTO clientdomains (title_id,url_domain,app_domain,app_name,html_prefix,public_layout,admin_layout,member_layout,sysadmin_layout,created) VALUES (@lastid,'toasthubclient2','toasthub2','cborgcust','cborgcust','publicLayout','adminLayout','memberLayout',null,null);
INSERT INTO texts (default_text) VALUES ('Localhost test');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Localhost test');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Localhost test');
INSERT INTO clientdomains (title_id,url_domain,app_domain,app_name,html_prefix,public_layout,admin_layout,member_layout,sysadmin_layout,created) VALUES (@lastid,'localhost','toasthub2','cborgcust','cborgcust','publicLayout','adminLayout','memberLayout',null,null);
INSERT INTO texts (default_text) VALUES ('Local IP test');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Local IP test');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Local IP test');
INSERT INTO clientdomains (title_id,url_domain,app_domain,app_name,html_prefix,public_layout,admin_layout,member_layout,sysadmin_layout,created) VALUES (@lastid,'10.0.1.9','toasthub1','cborgcust','cborgcust','publicLayout','adminLayout','memberLayout',null,null);
INSERT INTO texts (default_text) VALUES ('Client1 local test');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Client1 local test');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Client1 local test');
INSERT INTO clientdomains (title_id,url_domain,app_domain,app_name,html_prefix,public_layout,admin_layout,member_layout,sysadmin_layout,created) VALUES (@lastid,'toastclient1','toasthub1','cborgcust','cborgcust','publicLayout','adminLayout','memberLayout',null,null);
INSERT INTO texts (default_text) VALUES ('Client2 local test');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Client2 local test');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Client2 local test');
INSERT INTO clientdomains (title_id,url_domain,app_domain,app_name,html_prefix,public_layout,admin_layout,member_layout,sysadmin_layout,created) VALUES (@lastid,'toastclient2','toasthub2','cborgcust','cborgcust','publicLayout','adminLayout','memberLayout',null,null);
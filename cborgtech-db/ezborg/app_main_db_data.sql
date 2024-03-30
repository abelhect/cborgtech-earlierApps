
INSERT INTO clients (name,client_type,created) VALUES ('ezborg1','ezborg',null);
INSERT INTO clientdomains (client_id,url_domain,app_domain,app_name,html_prefix,public_layout,admin_layout,member_layout,sysadmin_layout,created) VALUES ((SELECT clients.id FROM clients WHERE name='ezborg1'),'cborghome.ddns.net','ezborg1','ezborg','ezborg','publicLayout','adminLayout','memberLayout','sysadminLayout',null);
INSERT INTO clientdomains (client_id,url_domain,app_domain,app_name,html_prefix,public_layout,admin_layout,member_layout,sysadmin_layout,created) VALUES ((SELECT clients.id FROM clients WHERE name='ezborg1'),'ezborg','ezborg1','ezborg','ezborg','publicLayout','adminLayout','memberLayout','sysadminLayout',null);


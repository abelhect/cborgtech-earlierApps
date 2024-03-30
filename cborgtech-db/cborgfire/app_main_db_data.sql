
INSERT INTO clients (name,client_type,created) VALUES ('cborgfire1','cborgfire',null);
INSERT INTO clientdomains (client_id,url_domain,app_domain,app_name,html_prefix,public_layout,admin_layout,member_layout,sysadmin_layout,created) VALUES ((SELECT clients.id FROM clients WHERE name='cborgfire1'),'cborghome.ddns.net','cborgfire1','cborgfire','cborgfire','publicLayout','adminLayout','memberLayout',null,null);
INSERT INTO clientdomains (client_id,url_domain,app_domain,app_name,html_prefix,public_layout,admin_layout,member_layout,sysadmin_layout,created) VALUES ((SELECT clients.id FROM clients WHERE name='cborgfire1'),'cborgfire','cborgfire1','cborgfire','cborgfire','publicLayout','adminLayout','memberLayout',null,null);

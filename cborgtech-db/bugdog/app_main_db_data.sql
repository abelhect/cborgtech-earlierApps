
INSERT INTO clients (name,client_type,created) VALUES ('bugdog1','bugdog',null);
INSERT INTO clientdomains (client_id,url_domain,app_domain,app_name,html_prefix,public_layout,admin_layout,member_layout,sysadmin_layout,created) VALUES ((SELECT clients.id FROM clients WHERE name='bugdog1'),'cborghome.ddns.net','bugdog1','bugdog','bugdog','publicLayout','adminLayout','memberLayout',null,null);
INSERT INTO clientdomains (client_id,url_domain,app_domain,app_name,html_prefix,public_layout,admin_layout,member_layout,sysadmin_layout,created) VALUES ((SELECT clients.id FROM clients WHERE name='bugdog1'),'bugdog','bugdog1','bugdog','bugdog','publicLayout','adminLayout','memberLayout',null,null);

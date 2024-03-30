
-- Admin users page

INSERT INTO texts (default_text) VALUES ('Admin Users');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Users');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Los usuarios admin');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_USERS',@lastid,'ADMIN');

-- Paging
INSERT INTO texts (default_text) VALUES ('Paging Limit');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Paging Limit');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Límite de paginación');
INSERT INTO page_option_name (page_name_id,name,text_id,value_type,default_value,use_default,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USERS'),'ADMIN_USERS_PAGING_LIMIT',@lastid,'Integer','20',false,null);
INSERT INTO page_option_value (page_option_name_id,option_value,lang,rendered,created) VALUES ((SELECT id FROM page_option_name WHERE name = 'ADMIN_USERS_PAGING_LIMIT'),'20','en',true,null);
INSERT INTO page_option_value (page_option_name_id,option_value,lang,rendered,created) VALUES ((SELECT id FROM page_option_name WHERE name = 'ADMIN_USERS_PAGING_LIMIT'),'20','es',true,null);

-- Admin roles page

INSERT INTO texts (default_text) VALUES ('Admin Roles');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Roles');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Los usuarios admin');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_ROLES',@lastid,'ADMIN');

-- Paging
INSERT INTO texts (default_text) VALUES ('Paging Limit');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Paging Limit');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Límite de paginación');
INSERT INTO page_option_name (page_name_id,name,text_id,value_type,default_value,use_default,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_ROLES'),'ADMIN_ROLES_PAGING_LIMIT',@lastid,'Integer','20',false,null);
INSERT INTO page_option_value (page_option_name_id,option_value,lang,rendered,created) VALUES ((SELECT id FROM page_option_name WHERE name = 'ADMIN_ROLES_PAGING_LIMIT'),'20','en',true,null);
INSERT INTO page_option_value (page_option_name_id,option_value,lang,rendered,created) VALUES ((SELECT id FROM page_option_name WHERE name = 'ADMIN_ROLES_PAGING_LIMIT'),'20','es',true,null);

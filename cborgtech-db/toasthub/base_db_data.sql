

-- languages
INSERT INTO texts (default_text) VALUES ('English');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','English');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Inglés');
INSERT INTO language (code,text_id,def_lang,created) VALUES ('en',@lastid,true,null);

INSERT INTO texts (default_text) VALUES ('Spanish');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Spanish');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Español');
INSERT INTO language (code,text_id,def_lang,created) VALUES ('es',@lastid,false,null);

INSERT INTO texts (default_text) VALUES ('French');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','French');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'fr','Francés');
INSERT INTO language (code,text_id,def_lang,is_active,created) VALUES ('fr',@lastid,false,false,null);

-- Public Menu
INSERT INTO texts (default_text) VALUES ('Default Public Menu Left');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Public Menu Left');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Menú pública izquierda');
INSERT INTO menus (code,category,title_id,api_version,app_version,created) VALUES ('PUBLIC_MENU_LEFT','PUBLIC',@lastid,'1.0','1.0',null);

INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'PUBLIC_MENU_LEFT'),'PRM_PUBLIC_MENU_LEFT_HOME','HOME',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'HOME' and menus.code = 'PUBLIC_MENU_LEFT'),'Home','/index.html','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'HOME' and menus.code = 'PUBLIC_MENU_LEFT'),'Casa','/index.html?lang=es','es',true,null);
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'PUBLIC_MENU_LEFT'),'PRM_PUBLIC_MENU_LEFT_ABOUT','ABOUT',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ABOUT' and menus.code = 'PUBLIC_MENU_LEFT'),'About','','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ABOUT' and menus.code = 'PUBLIC_MENU_LEFT'),'Sobre','','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'PUBLIC_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'ABOUT' and menus.code = 'PUBLIC_MENU_LEFT'),'PRM_PUBLIC_MENU_LEFT_MISSION','MISSION',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MISSION' and menus.code = 'PUBLIC_MENU_LEFT'),'Mission','/page.html?page=mission','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MISSION' and menus.code = 'PUBLIC_MENU_LEFT'),'Misión','/page.html?page=mission&lang=es','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'PUBLIC_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'ABOUT' and menus.code = 'PUBLIC_MENU_LEFT'),'PRM_PUBLIC_MENU_LEFT_FOUNDERS','FOUNDERS',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'FOUNDERS' and menus.code = 'PUBLIC_MENU_LEFT'),'Founders','/page.html?page=founder','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'FOUNDERS' and menus.code = 'PUBLIC_MENU_LEFT'),'Fundadores','/page.html?page=founder&lang=es','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'PUBLIC_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'ABOUT' and menus.code = 'PUBLIC_MENU_LEFT'),'PRM_PUBLIC_MENU_LEFT_DEVELOPERS','DEVELOPERS',2,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'DEVELOPERS' and menus.code = 'PUBLIC_MENU_LEFT'),'Developers','/page.html?page=developer','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'DEVELOPERS' and menus.code = 'PUBLIC_MENU_LEFT'),'Desarrolladores','/page.html?page=developer&lang=es','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'PUBLIC_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'ABOUT' and menus.code = 'PUBLIC_MENU_LEFT'),'PRM_PUBLIC_MENU_LEFT_APPLICATION','APPLICATION',3,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'APPLICATION' and menus.code = 'PUBLIC_MENU_LEFT'),'Application','/page.html?page=application','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'APPLICATION' and menus.code = 'PUBLIC_MENU_LEFT'),'Aplicación','/page.html?page=application&lang=es','es',true,null);


INSERT INTO texts (default_text) VALUES ('Default Public Menu Right');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Public Menu Right');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Menú predeterminado a la derecha');
INSERT INTO menus (code,category,title_id,api_version,app_version,created) VALUES ('PUBLIC_MENU_RIGHT','PUBLIC',@lastid,'1.0','1.0',null);

INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'PUBLIC_MENU_RIGHT'),'PRM_PUBLIC_MENU_RIGHT_SERVICES','SERVICES',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SERVICES' and menus.code = 'PUBLIC_MENU_RIGHT'),'Services','#services','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SERVICES' and menus.code = 'PUBLIC_MENU_RIGHT'),'Servicios','#services?lang=es','es',true,null);
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'PUBLIC_MENU_RIGHT'),'PRM_PUBLIC_MENU_RIGHT_PORTFOLIO','PORTFOLIO',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PORTFOLIO' and menus.code = 'PUBLIC_MENU_RIGHT'),'Portfolio','#portfolio','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PORTFOLIO' and menus.code = 'PUBLIC_MENU_RIGHT'),'Portafolio','#portfolio?lang=es','es',true,null);
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'PUBLIC_MENU_RIGHT'),'PRM_PUBLIC_MENU_RIGHT_ABOUT','ABOUT',2,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ABOUT' and menus.code = 'PUBLIC_MENU_RIGHT'),'About','#about','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ABOUT' and menus.code = 'PUBLIC_MENU_RIGHT'),'Acerca de','#about?lang=es','es',true,null);
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'PUBLIC_MENU_RIGHT'),'PRM_PUBLIC_MENU_RIGHT_TEAM','TEAM',3,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'TEAM' and menus.code = 'PUBLIC_MENU_RIGHT'),'Team','#team','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'TEAM' and menus.code = 'PUBLIC_MENU_RIGHT'),'Equipo','#team?lang=es','es',true,null);
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'PUBLIC_MENU_RIGHT'),'PRM_PUBLIC_MENU_RIGHT_LOGIN','LOGIN',4,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'LOGIN' and menus.code = 'PUBLIC_MENU_RIGHT'),'Login','/login/login.html','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'LOGIN' and menus.code = 'PUBLIC_MENU_RIGHT'),'Iniciar sesión','/login/login.html?lang=es','es',true,null);

INSERT INTO texts (default_text) VALUES ('Default Member Menu Right');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Member Menu Right');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Default Menú Menú Derecho');

INSERT INTO menus (code,category,title_id,api_version,app_version,created) VALUES ('MEMBER_MENU_RIGHT','MEMBER',@lastid,'1.0','1.0',null);
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_RIGHT'),'PRM_MEMBER_MENU_RIGHT_ACQUAINTANCES','ACQUAINTANCES',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,image,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ACQUAINTANCES' and menus.code = 'MEMBER_MENU_RIGHT'),'Acquaintances','/member/social/index.html?page=acquaintance','{"iconClass":"fa fa-users"}','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,image,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ACQUAINTANCES' and menus.code = 'MEMBER_MENU_RIGHT'),'Conocidos','/member/social/index.html?page=acquaintance','{"iconClass":"fa fa-users"}','es',true,null);
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_RIGHT'),'PRM_MEMBER_MENU_RIGHT_EVENTS','EVENTS',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,image,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'EVENTS' and menus.code = 'MEMBER_MENU_RIGHT'),'Events','/member/social/index.html?page=events','{"iconClass":"fa fa-calendar"}','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,image,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'EVENTS' and menus.code = 'MEMBER_MENU_RIGHT'),'Eventos','/member/social/index.html?page=events','{"iconClass":"fa fa-calendar"}','es',true,null);
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_RIGHT'),'PRM_MEMBER_MENU_RIGHT_MEMBER','MEMBER',2,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,image,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MEMBER' and menus.code = 'MEMBER_MENU_RIGHT'),'Member','','{"localFile":"/member/img/ed_thumbnail.jpg"}','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,image,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MEMBER' and menus.code = 'MEMBER_MENU_RIGHT'),'Miembro','','{"localFile":"/member/img/ed_thumbnail.jpg"}','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_RIGHT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'MEMBER' and menus.code = 'MEMBER_MENU_RIGHT'),'PRM_MEMBER_MENU_RIGHT_ADMIN','ADMIN',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ADMIN' and menus.code = 'MEMBER_MENU_RIGHT'),'Admin','/admin/index.html','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ADMIN' and menus.code = 'MEMBER_MENU_RIGHT'),'Administración','/admin/index.html','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_RIGHT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'MEMBER' and menus.code = 'MEMBER_MENU_RIGHT'),'PRM_MEMBER_MENU_RIGHT_PROFILE','PROFILE',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PROFILE' and menus.code = 'MEMBER_MENU_RIGHT'),'Profile','/member/index.html?page=profile','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PROFILE' and menus.code = 'MEMBER_MENU_RIGHT'),'Perfil','/member/index.html?page=profile','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_RIGHT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'MEMBER' and menus.code = 'MEMBER_MENU_RIGHT'),'PRM_MEMBER_MENU_RIGHT_LOGOUT','LOGOUT',2,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'LOGOUT' and menus.code = 'MEMBER_MENU_RIGHT'),'Logout','/member/logout.html','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'LOGOUT' and menus.code = 'MEMBER_MENU_RIGHT'),'Cerrar sesión','/member/logout.html','es',true,null);


-- Private menu
INSERT INTO texts (default_text) VALUES ('Default Member Menu Left');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Member Menu Left');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Menú miembro de Izquierda');

INSERT INTO menus (code,category,title_id,api_version,app_version,created) VALUES ('MEMBER_MENU_LEFT','MEMBER',@lastid,'1.0','1.0',null);
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_LEFT'),'PRM_MEMBER_MENU_LEFT_HOME','HOME',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'HOME' and menus.code = 'MEMBER_MENU_LEFT'),'Home','/member/social/index.html','en',true,null);

-- Social
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_LEFT'),'PRM_MEMBER_MENU_LEFT_SOCIAL','SOCIAL',2,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SOCIAL' and menus.code = 'MEMBER_MENU_LEFT'),'Social','','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SOCIAL' and menus.code = 'MEMBER_MENU_LEFT'),'Medios de Comunicación Social','','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SOCIAL' and menus.code = 'MEMBER_MENU_LEFT'),'PRM_MEMBER_MENU_LEFT_ACQUAINTANCE','ACQUAINTANCE',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ACQUAINTANCE' and menus.code = 'MEMBER_MENU_LEFT'),'Acquaintances','/member/social/index.html?page=acquaintance','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ACQUAINTANCE' and menus.code = 'MEMBER_MENU_LEFT'),'Conocidos','/member/social/index.html?page=acquaintance&lang=es','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SOCIAL' and menus.code = 'MEMBER_MENU_LEFT'),'PRM_MEMBER_MENU_LEFT_GROUPS','GROUPS',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'GROUPS' and menus.code = 'MEMBER_MENU_LEFT'),'Groups','/member/social/index.html?page=groups','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'GROUPS' and menus.code = 'MEMBER_MENU_LEFT'),'Grupos','/member/social/index.html?page=groups&lang=es','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SOCIAL' and menus.code = 'MEMBER_MENU_LEFT'),'PRM_MEMBER_MENU_LEFT_ACTIVITIES','ACTIVITIES',2,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ACTIVITIES' and menus.code = 'MEMBER_MENU_LEFT'),'Activities','/member/social/index.html?page=activities','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ACTIVITIES' and menus.code = 'MEMBER_MENU_LEFT'),'Actividades','/member/social/index.html?page=activities&lang=es','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SOCIAL' and menus.code = 'MEMBER_MENU_LEFT'),'PRM_MEMBER_MENU_LEFT_EVENTS','EVENTS',3,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'EVENTS' and menus.code = 'MEMBER_MENU_LEFT'),'Events','/member/social/index.html?page=events','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'EVENTS' and menus.code = 'MEMBER_MENU_LEFT'),'Eventos','/member/social/index.html?page=events&lang=es','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SOCIAL' and menus.code = 'MEMBER_MENU_LEFT'),'PRM_MEMBER_MENU_LEFT_MESSAGES','MESSAGES',4,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MESSAGES' and menus.code = 'MEMBER_MENU_LEFT'),'Messages','/member/social/index.html?page=messages','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MESSAGES' and menus.code = 'MEMBER_MENU_LEFT'),'Mensajes','/member/social/index.html?page=messages&lang=es','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'MEMBER_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SOCIAL' and menus.code = 'MEMBER_MENU_LEFT'),'PRM_MEMBER_MENU_LEFT_LIBRARY','LIBRARY',5,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'LIBRARY' and menus.code = 'MEMBER_MENU_LEFT'),'Library','/member/social/index.html?page=library','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'LIBRARY' and menus.code = 'MEMBER_MENU_LEFT'),'Biblioteca','/member/social/index.html?page=library&lang=es','es',true,null);

-- Admin menu Right
INSERT INTO texts (default_text) VALUES ('Default Admin Menu Right');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Admin Menu Right');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Derecha Admin Menú miembro');

INSERT INTO menus (code,category,title_id,api_version,app_version,created) VALUES ('ADMIN_MENU_RIGHT','ADMIN',@lastid,'1.0','1.0',null);
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_RIGHT'),'PRM_ADMIN_MENU_RIGHT_ADMIN','ADMIN',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,image,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ADMIN' and menus.code = 'ADMIN_MENU_RIGHT'),'Admin','','{"localFile":"/member/img/ed_thumbnail.jpg"}','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,image,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ADMIN' and menus.code = 'ADMIN_MENU_RIGHT'),'Admin','','{"localFile":"/member/img/ed_thumbnail.jpg"}','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_RIGHT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'ADMIN' and menus.code = 'ADMIN_MENU_RIGHT'),'PRM_ADMIN_MENU_RIGHT_MEMBER','MEMBER',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MEMBER' and menus.code = 'ADMIN_MENU_RIGHT'),'Member','/member/index.html','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MEMBER' and menus.code = 'ADMIN_MENU_RIGHT'),'Miembro','/member/index.html','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_RIGHT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'ADMIN' and menus.code = 'ADMIN_MENU_RIGHT'),'PRM_ADMIN_MENU_RIGHT_PROFILE','PROFILE',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PROFILE' and menus.code = 'ADMIN_MENU_RIGHT'),'Profile','/member/index.html?page=profile','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PROFILE' and menus.code = 'ADMIN_MENU_RIGHT'),'Perfil','/member/index.html?page=profile','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_RIGHT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'ADMIN' and menus.code = 'ADMIN_MENU_RIGHT'),'PRM_ADMIN_MENU_RIGHT_LOGOUT','LOGOUT',2,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'LOGOUT' and menus.code = 'ADMIN_MENU_RIGHT'),'Logout','/admin/logout.html','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'LOGOUT' and menus.code = 'ADMIN_MENU_RIGHT'),'Cerrar sesión','/admin/logout.html','es',true,null);

-- Admin menu Left
INSERT INTO texts (default_text) VALUES ('Default Admin Menu Left');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Admin Menu Left');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Menu Admin de Izquierda');

INSERT INTO menus (code,category,title_id,api_version,app_version,created) VALUES ('ADMIN_MENU_LEFT','ADMIN',@lastid,'1.0','1.0',null);
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_HOME','HOME',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'HOME' and menus.code = 'ADMIN_MENU_LEFT'),'Home','/admin/index.html','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'HOME' and menus.code = 'ADMIN_MENU_LEFT'),'Casa','/admin/index.html','es',true,null);

INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_USERMGMT','USERMGMT',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'USERMGMT' and menus.code = 'ADMIN_MENU_LEFT'),'User Management','','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'USERMGMT' and menus.code = 'ADMIN_MENU_LEFT'),'Gestión de usuarios','','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'USERMGMT' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_USERS','USERS',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'USERS' and menus.code = 'ADMIN_MENU_LEFT'),'Users','/admin/index.html?page=users','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'USERS' and menus.code = 'ADMIN_MENU_LEFT'),'Usuarios','/admin/index.html?page=users','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'USERMGMT' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_ROLES','ROLES',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ROLES' and menus.code = 'ADMIN_MENU_LEFT'),'Roles','/admin/index.html?page=roles','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'ROLES' and menus.code = 'ADMIN_MENU_LEFT'),'Roles','/admin/index.html?page=roles','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'USERMGMT' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_PERMISSIONS','PERMISSIONS',2,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PERMISSIONS' and menus.code = 'ADMIN_MENU_LEFT'),'Permissions','/admin/index.html?page=permissions','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PERMISSIONS' and menus.code = 'ADMIN_MENU_LEFT'),'Permisos','/admin/index.html?page=permissions','es',true,null);

INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_SETTINGS','SETTINGS',2,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SETTINGS' and menus.code = 'ADMIN_MENU_LEFT'),'Settings','','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SETTINGS' and menus.code = 'ADMIN_MENU_LEFT'),'Ajustes','','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SETTINGS' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_PERF_PUBLIC','PREF_PUBLIC',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PREF_PUBLIC' and menus.code = 'ADMIN_MENU_LEFT'),'Page Public','/admin/index.html?page=prefPublic','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PREF_PUBLIC' and menus.code = 'ADMIN_MENU_LEFT'),'Página Público','/admin/index.html?page=prefPublic','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SETTINGS' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_PREF_MEMBER','PREF_MEMBER',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PREF_MEMBER' and menus.code = 'ADMIN_MENU_LEFT'),'Page Member','/admin/index.html?page=prefMember','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PREF_MEMBER' and menus.code = 'ADMIN_MENU_LEFT'),'Miembro de la página','/admin/index.html?page=prefMember','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SETTINGS' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_PREF_ADMIN','PREF_ADMIN',2,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PREF_ADMIN' and menus.code = 'ADMIN_MENU_LEFT'),'Page Admin','/admin/index.html?page=prefAdmin','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PREF_ADMIN' and menus.code = 'ADMIN_MENU_LEFT'),'Admin página','/admin/index.html?page=prefAdmin','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SETTINGS' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_LANGUAGE','LANGUAGE',3,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'LANGUAGE' and menus.code = 'ADMIN_MENU_LEFT'),'Language','/admin/index.html?page=language','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'LANGUAGE' and menus.code = 'ADMIN_MENU_LEFT'),'Idioma','/admin/index.html?page=language','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SETTINGS' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_CATEGORY','CATEGORY',4,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'CATEGORY' and menus.code = 'ADMIN_MENU_LEFT'),'Category','/admin/index.html?page=category','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'CATEGORY' and menus.code = 'ADMIN_MENU_LEFT'),'Categoría','/admin/index.html?page=category','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SETTINGS' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_STATUS','STATUS',5,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'STATUS' and menus.code = 'ADMIN_MENU_LEFT'),'Status','/admin/index.html?page=status','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'STATUS' and menus.code = 'ADMIN_MENU_LEFT'),'Estado','/admin/index.html?page=status','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SETTINGS' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_SERVICE','SERVICE',6,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SERVICE' and menus.code = 'ADMIN_MENU_LEFT'),'Service','/admin/index.html?page=service','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SERVICE' and menus.code = 'ADMIN_MENU_LEFT'),'Servicio','/admin/index.html?page=service','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SETTINGS' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_MENU_PUBLIC','MENU_PUBLIC',7,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MENU_PUBLIC' and menus.code = 'ADMIN_MENU_LEFT'),'Menu Public','/admin/index.html?page=menuPublic','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MENU_PUBLIC' and menus.code = 'ADMIN_MENU_LEFT'),'Menú público','/admin/index.html?page=menuPublic','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SETTINGS' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_MENU_MEMBER','MENU_MEMBER',8,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MENU_MEMBER' and menus.code = 'ADMIN_MENU_LEFT'),'Menu Member','/admin/index.html?page=menuMember','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MENU_MEMBER' and menus.code = 'ADMIN_MENU_LEFT'),'Miembro del menú','/admin/index.html?page=menuMember','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SETTINGS' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_MENU_ADMIN','MENU_ADMIN',9,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MENU_ADMIN' and menus.code = 'ADMIN_MENU_LEFT'),'Menu Admin','/admin/index.html?page=menuAdmin','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'MENU_ADMIN' and menus.code = 'ADMIN_MENU_LEFT'),'Menú Admin','/admin/index.html?page=menuAdmin','es',true,null);

INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_SYSTEM','SYSTEM',3,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYSTEM' and menus.code = 'ADMIN_MENU_LEFT'),'System','','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYSTEM' and menus.code = 'ADMIN_MENU_LEFT'),'Sistema','','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SYSTEM' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_CLIENT_DOMAIN','CLIENT_DOMAIN',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'CLIENT_DOMAIN' and menus.code = 'ADMIN_MENU_LEFT'),'Client Domain','/admin/index.html?page=clientDomain','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'CLIENT_DOMAIN' and menus.code = 'ADMIN_MENU_LEFT'),'Dominio del cliente','/admin/index.html?page=clientDomain','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'ADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SYSTEM' and menus.code = 'ADMIN_MENU_LEFT'),'PRM_ADMIN_MENU_LEFT_APPLICATION','APPLICATION',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'APPLICATION' and menus.code = 'ADMIN_MENU_LEFT'),'Application','/admin/index.html?page=application','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'APPLICATION' and menus.code = 'ADMIN_MENU_LEFT'),'Solicitud','/admin/index.html?page=application','es',true,null);


-- SysAdmin menu Right
INSERT INTO texts (default_text) VALUES ('Default SysAdmin Menu Right');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default SysAdmin Menu Right');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Derecha SysAdmin Menú miembro');

INSERT INTO menus (code,category,title_id,api_version,app_version,created) VALUES ('SYSADMIN_MENU_RIGHT','SYSADMIN',@lastid,'1.0','1.0',null);
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'SYSADMIN_MENU_RIGHT'),'PRM_SYSADMIN_MENU_RIGHT_SYSADMIN','SYSADMIN',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYSADMIN' and menus.code = 'SYSADMIN_MENU_RIGHT'),'Admin','','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYSADMIN' and menus.code = 'SYSADMIN_MENU_RIGHT'),'Admin','','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'SYSADMIN_MENU_RIGHT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SYSADMIN' and menus.code = 'SYSADMIN_MENU_RIGHT'),'PRM_SYSADMIN_MENU_RIGHT_PROFILE','PROFILE',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PROFILE' and menus.code = 'SYSADMIN_MENU_RIGHT'),'Profile','/sysadmin/index.html?page=profile','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PROFILE' and menus.code = 'SYSADMIN_MENU_RIGHT'),'Perfil','/sysadmin/index.html?page=profile','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'SYSADMIN_MENU_RIGHT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'SYSADMIN' and menus.code = 'SYSADMIN_MENU_RIGHT'),'PRM_SYSADMIN_MENU_RIGHT_LOGOUT','LOGOUT',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'LOGOUT' and menus.code = 'SYSADMIN_MENU_RIGHT'),'Logout','/sysadmin/logout.html','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'LOGOUT' and menus.code = 'SYSADMIN_MENU_RIGHT'),'Cerrar sesión','/sysadmin/logout.html','es',true,null);

-- System Admin Left
INSERT INTO texts (default_text) VALUES ('Default SysAdmin Menu Left');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default SysAdmin Menu Left');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Menu SysAdmin de Izquierda');

INSERT INTO menus (code,category,title_id,api_version,app_version,created) VALUES ('SYSADMIN_MENU_LEFT','SYSADMIN',@lastid,'1.0','1.0',null);
INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'SYSADMIN_MENU_LEFT'),'PRM_SYSADMIN_MENU_LEFT_SYSADMIN','SYSADMIN',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYSADMIN' and menus.code = 'SYSADMIN_MENU_LEFT'),'Home','/sysadmin/index.html','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYSADMIN' and menus.code = 'SYSADMIN_MENU_LEFT'),'Home','/sysadmin/index.html?lang=es','es',true,null);

INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'SYSADMIN_MENU_LEFT'),'PRM_SYSADMIN_MENU_LEFT_CLIENTMGMT','CLIENTMGMT',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'CLIENTMGMT' and menus.code = 'SYSADMIN_MENU_LEFT'),'Client Management','','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'CLIENTMGMT' and menus.code = 'SYSADMIN_MENU_LEFT'),'Client Management','','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'SYSADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'CLIENTMGMT' and menus.code = 'SYSADMIN_MENU_LEFT'),'PRM_SYSADMIN_MENU_LEFT_SYS_CLIENTS','SYS_CLIENTS',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYS_CLIENTS' and menus.code = 'SYSADMIN_MENU_LEFT'),'System Clients','/sysadmin/index.html?page=clients','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYS_CLIENTS' and menus.code = 'SYSADMIN_MENU_LEFT'),'System Clients','/sysadmin/index.html?page=clients&lang=es','es',true,null);

INSERT INTO menu_items (menu_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'SYSADMIN_MENU_LEFT'),'PRM_SYSADMIN_MENU_LEFT_PREFERENCES','PREFERENCES',2,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PREFERENCES' and menus.code = 'SYSADMIN_MENU_LEFT'),'Preferences','','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'PREFERENCES' and menus.code = 'SYSADMIN_MENU_LEFT'),'Preferences','','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'SYSADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'PREFERENCES' and menus.code = 'SYSADMIN_MENU_LEFT'),'PRM_SYSADMIN_MENU_LEFT_SYS_FORMS','SYS_FORMS',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYS_FORMS' and menus.code = 'SYSADMIN_MENU_LEFT'),'System Forms','/sysadmin/index.html?page=forms','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYS_FORMS' and menus.code = 'SYSADMIN_MENU_LEFT'),'Formas del sistema','/sysadmin/index.html?page=forms&lang=es','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'SYSADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'PREFERENCES' and menus.code = 'SYSADMIN_MENU_LEFT'),'PRM_SYSADMIN_MENU_LEFT_SYS_LABELS','SYS_LABELS',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYS_LABELS' and menus.code = 'SYSADMIN_MENU_LEFT'),'System Labels','/sysadmin/index.html?page=labels','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYS_LABELS' and menus.code = 'SYSADMIN_MENU_LEFT'),'Las etiquetas del sistema','/sysadmin/index.html?page=labels&lang=es','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'SYSADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'PREFERENCES' and menus.code = 'SYSADMIN_MENU_LEFT'),'PRM_SYSADMIN_MENU_LEFT_SYS_TEXT','SYS_TEXT',2,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYS_TEXT' and menus.code = 'SYSADMIN_MENU_LEFT'),'System Text','/sysadmin/index.html?page=text','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYS_TEXT' and menus.code = 'SYSADMIN_MENU_LEFT'),'Texto sistema','/sysadmin/index.html?page=text&lang=es','es',true,null);
INSERT INTO menu_items (menu_id,parent_id,permission_code,code,sort_order,created) VALUES ((SELECT id FROM menus WHERE code = 'SYSADMIN_MENU_LEFT'),(SELECT item.id FROM menu_items AS item JOIN menus ON item.menu_id = menus.id WHERE item.code = 'PREFERENCES' and menus.code = 'SYSADMIN_MENU_LEFT'),'PRM_SYSADMIN_MENU_LEFT_SYS_OPTIONS','SYS_OPTIONS',3,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYS_OPTIONS' and menus.code = 'SYSADMIN_MENU_LEFT'),'System Options','/sysadmin/index.html?page=options','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.code = 'SYS_OPTIONS' and menus.code = 'SYSADMIN_MENU_LEFT'),'Opciones del sistema','/sysadmin/index.html?page=options&lang=es','es',true,null);


-- Categories
INSERT INTO texts (default_text,created) VALUES ('Featured',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'FEATURED',0,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Featured',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Destacados',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','En vedette',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Vorgestellt',null);
INSERT INTO texts (default_text,created) VALUES ('Top',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'TOP',1,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Top',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Top',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Top',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Top',null);
INSERT INTO texts (default_text,created) VALUES ('Location',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'LOCATION',2,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Location',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Ubicación',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Emplacement',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Lage',null);
INSERT INTO texts (default_text,created) VALUES ('Friends',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'FRIENDS',3,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Friends',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Amigos',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Amis',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Freunde',null);
INSERT INTO texts (default_text,created) VALUES ('Art',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'ART',4,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Art',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Arte',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Art',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Kunst',null);
INSERT INTO texts (default_text,created) VALUES ('Comics',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'COMICS',5,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Comics',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Historietas',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Bandes dessinées',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Comics',null);
INSERT INTO texts (default_text,created) VALUES ('Dance',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'DANCE',6,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Dance',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Danza',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Danse',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','tanzen',null);
INSERT INTO texts (default_text,created) VALUES ('Design',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'DESIGN',7,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Design',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Diseño',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Conception',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Entwurf',null);
INSERT INTO texts (default_text,created) VALUES ('Fashion',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'FASHION',8,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Fashion',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Moda',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Mode',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Mode',null);
INSERT INTO texts (default_text,created) VALUES ('Movies',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'MOVIES',9,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Movies',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Hombre moviente',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Films',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Kino',null);
INSERT INTO texts (default_text,created) VALUES ('Food',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'FOOD',10,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Food',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Comida',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Nourriture',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Lebensmittel',null);
INSERT INTO texts (default_text,created) VALUES ('Games',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'GAMES',11,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Games',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Juegos',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Jeux',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Spiele',null);
INSERT INTO texts (default_text,created) VALUES ('Music',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'MUSIC',12,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Music',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Música',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Musique',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Musik',null);
INSERT INTO texts (default_text,created) VALUES ('Publishing',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'PUBLISHING',13,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Publishing',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Publicación',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','édition',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Verlagswesen',null);
INSERT INTO texts (default_text,created) VALUES ('Theater',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'THEATER',14,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Theater',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Teatro',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Théâtre',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Schauplatz',null);
INSERT INTO texts (default_text,created) VALUES ('Software',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'SOFTWARE',15,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Software',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Software',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Logiciel',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Software',null);
INSERT INTO texts (default_text,created) VALUES ('Housing',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'HOUSING',16,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Housing',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Alojamiento',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Logement',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Wohnungsbau',null);
INSERT INTO texts (default_text,created) VALUES ('Technology',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'TECHNOLOGY',17,null,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Technology',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','tecnología',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','technologie',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Technologie',null);
INSERT INTO texts (default_text,created) VALUES ('Games',null);
SET @lastid = LAST_INSERT_ID();
SET @parentid := (SELECT c.id FROM categories c WHERE c.code = 'SOFTWARE');
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'SOFTWARE_GAMES',0,@parentid,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Games',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Juegos',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Jeux',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Spiele',null);
INSERT INTO texts (default_text,created) VALUES ('Applications',null);
SET @lastid = LAST_INSERT_ID();
SET @parentid := (SELECT c.id FROM categories c WHERE c.code = 'SOFTWARE');
INSERT INTO categories (name_id,code,sort_order,parent_id,created) VALUES (@lastid,'SOFTWARE_APPLICATIONS',1,@parentid,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Applications',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Aplicaciones',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'fr','Applications',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'de','Anwendungen',null);


-- Global Page

INSERT INTO texts (default_text) VALUES ('Global Page');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Global Page');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Página Global');
INSERT INTO page_name (name,text_id,category) VALUES ('GLOBAL_PAGE',@lastid,'PUBLIC');

-- Paging
INSERT INTO texts (default_text) VALUES ('Paging Prev');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Paging Prev');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Paging Anterior');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_PAGE'),'GLOBAL_PAGE_PAGING_PREV',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_PAGING_PREV'),'Prev','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_PAGING_PREV'),'Anterior','es',true,null);

INSERT INTO texts (default_text) VALUES ('Paging Next');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Paging Next');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Paginación Siguiente');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_PAGE'),'GLOBAL_PAGE_PAGING_NEXT',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_PAGING_NEXT'),'Next','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_PAGING_NEXT'),'Próximo','es',true,null);

INSERT INTO texts (default_text) VALUES ('Paging First');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Paging First');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Paging Primera');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_PAGE'),'GLOBAL_PAGE_PAGING_FIRST',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_PAGING_FIRST'),'First','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_PAGING_FIRST'),'Primero','es',true,null);

INSERT INTO texts (default_text) VALUES ('Paging Last');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Paging Last');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Paging Última');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_PAGE'),'GLOBAL_PAGE_PAGING_LAST',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_PAGING_LAST'),'Last','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_PAGING_LAST'),'Pasado','es',true,null);

INSERT INTO texts (default_text) VALUES ('Button Accept');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Button Accept');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón Aceptar');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_PAGE'),'GLOBAL_PAGE_BUTTON_ACCEPT',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_BUTTON_ACCEPT'),'Save','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_BUTTON_ACCEPT'),'Salvar','es',true,null);

INSERT INTO texts (default_text) VALUES ('Button Decline');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Button Decline');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de descenso');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_PAGE'),'GLOBAL_PAGE_BUTTON_DECLINE',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_BUTTON_DECLINE'),'Cancel','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_BUTTON_DECLINE'),'Cancelar','es',true,null);

INSERT INTO texts (default_text) VALUES ('Search Input');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Search Input');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Buscar entrada');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_PAGE'),'GLOBAL_PAGE_SEARCH_INPUT',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_SEARCH_INPUT'),'Search for...','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_SEARCH_INPUT'),'Buscar...','es',true,null);

INSERT INTO texts (default_text) VALUES ('Search Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Search Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de búsqueda');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_PAGE'),'GLOBAL_PAGE_SEARCH_BUTTON',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_SEARCH_BUTTON'),'Go!','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_SEARCH_BUTTON'),'¡Ir!','es',true,null);

INSERT INTO texts (default_text) VALUES ('Form Header Create');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Form Header Create');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado de formulario Crear');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_PAGE'),'GLOBAL_PAGE_FORM_HEADER_CREATE',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_FORM_HEADER_CREATE'),'Create','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_FORM_HEADER_CREATE'),'Crear','es',true,null);

INSERT INTO texts (default_text) VALUES ('Form Header Modify');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Form Header Modify');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Modificar el encabezado del formulario');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_PAGE'),'GLOBAL_PAGE_FORM_HEADER_MODIFY',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_FORM_HEADER_MODIFY'),'Modify','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_FORM_HEADER_MODIFY'),'Modificar','es',true,null);

INSERT INTO texts (default_text) VALUES ('Empty List');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Empty List');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','El Empty List');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_PAGE'),'GLOBAL_PAGE_LIST_EMPTY',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_LIST_EMPTY'),'No items available','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_LIST_EMPTY'),'el No items available','es',true,null);

INSERT INTO texts (default_text) VALUES ('Menu Option Add');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Menu Option Add');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Menu Option Add');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_PAGE'),'GLOBAL_PAGE_MENU_OPTION_ADD',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_MENU_OPTION_ADD'),'Add','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_MENU_OPTION_ADD'),'Añadir','es',true,null);

INSERT INTO texts (default_text) VALUES ('Menu Option Delete');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Menu Option Delete');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Menu Option Delete');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_PAGE'),'GLOBAL_PAGE_MENU_OPTION_DELETE',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_MENU_OPTION_DELETE'),'Delete','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_PAGE_MENU_OPTION_DELETE'),'Borrar','es',true,null);

-- Global Option
INSERT INTO texts (default_text) VALUES ('Global Options');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Global Options');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Opciones globales');
INSERT INTO page_name (name,text_id,category) VALUES ('GLOBAL_OPTIONS',@lastid,'PUBLIC');

INSERT INTO texts (default_text) VALUES ('SMTP Gateway User');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','SMTP Gateway User');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','SMTP Gateway User');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_OPTIONS'),'GLOBAL_OPTIONS_SMTP_GATEWAY_USER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_OPTIONS_SMTP_GATEWAY_USER'),'seufster@gmail.com','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_OPTIONS_SMTP_GATEWAY_USER'),'seufster@gmail.com','es',true,null);

INSERT INTO texts (default_text) VALUES ('SMTP Gateway Password');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','SMTP Gateway Password');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','SMTP Gateway Password');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_OPTIONS'),'GLOBAL_OPTIONS_SMTP_GATEWAY_PASSWORD',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_OPTIONS_SMTP_GATEWAY_PASSWORD'),'seufster@gmail.com','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_OPTIONS_SMTP_GATEWAY_PASSWORD'),'seufster@gmail.com','es',true,null);

-- Global Service
INSERT INTO texts (default_text) VALUES ('Global Service');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Global Service');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Servicio Global');
INSERT INTO page_name (name,text_id,category) VALUES ('GLOBAL_SERVICE',@lastid,'PUBLIC');

INSERT INTO texts (default_text) VALUES ('Validation Error');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Validation Error');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Error de validacion');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_SERVICE'),'GLOBAL_SERVICE_VALIDATION_ERROR',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_SERVICE_VALIDATION_ERROR'),'Validation Error!','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_SERVICE_VALIDATION_ERROR'),'Error de validacion!','es',true,null);

INSERT INTO texts (default_text) VALUES ('Service Disabled');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Service Disabled');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Servicio deshabilitado');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'GLOBAL_SERVICE'),'GLOBAL_SERVICE_DISABLED',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_SERVICE_DISABLED'),'This service is currently disabled.','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'GLOBAL_SERVICE_DISABLED'),'Este servicio está actualmente deshabilitado.','es',true,null);



-- PageName  Login
INSERT INTO texts (default_text) VALUES ('Login Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Login Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de acceso');
INSERT INTO page_name (name,text_id,category) VALUES ('LOGIN_FORM',@lastid,'PUBLIC');

-- Form Field  Login
INSERT INTO texts (default_text) VALUES ('User name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de usuario');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,tab_index,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'LOGIN_FORM'),'LOGIN_FORM_USERNAME',@lastid,'TXT',1,'text',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"username","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'LOGIN_FORM_USERNAME'),'','User name:','en',true,true,0,'{"regex":"^[a-zA-Z0-9_#!@.]*$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'LOGIN_FORM_USERNAME'),'','Nombre de usuario:','es',true,true,0,'{"regex":"^[a-zA-Z0-9_#!@.]*$","errorMsg":"Error de validacion"}',null);

INSERT INTO texts (default_text) VALUES ('Password');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Password');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Contraseña');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,tab_index,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'LOGIN_FORM'),'LOGIN_FORM_PASSWORD',@lastid,'TXT',2,'password',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"password","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'LOGIN_FORM_PASSWORD'),'','Password:','en',true,true,1,'{"regex":"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[\\\\d]){1,})(?=(.*[^a-zA-Z0-9]){1,}).{7,30}$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'LOGIN_FORM_PASSWORD'),'','Contraseña:','es',true,true,1,'{"regex":"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[\\\\d]){1,})(?=(.*[^a-zA-Z0-9]){1,}).{7,30}$","errorMsg":"Error de validacion"}',null);

-- Labels Login
INSERT INTO texts (default_text) VALUES ('Log in - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Log in - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Iniciar sesión - Botón');
INSERT INTO page_label_name (page_name_id,name,class_name,tab_index,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'LOGIN_FORM'),'LOGIN_FORM_SUBMIT_BUTTON','form-control btn btn-login',4,@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'LOGIN_FORM_SUBMIT_BUTTON'),'Log in','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'LOGIN_FORM_SUBMIT_BUTTON'),' Iniciar sesión','es',true,0,null);

-- Texts Login
INSERT INTO texts (default_text) VALUES ('Login Header label');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Login Header label');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Perdidos por el usuario');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'LOGIN_FORM'),'LOGIN_FORM_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_FORM_HEADER'),'Login','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_FORM_HEADER'),'Login','es',true,null);

INSERT INTO texts (default_text) VALUES ('Remember Me');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Remember Me');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Recuérdame');
INSERT INTO page_text_name (page_name_id,name,tab_index,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'LOGIN_FORM'),'LOGIN_FORM_REMEMBER_ME',3,@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_FORM_REMEMBER_ME'),'Remember Me','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_FORM_REMEMBER_ME'),'Recuérdame','es',true,null);

INSERT INTO texts (default_text) VALUES ('Forgot Password?');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Forgot Password');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Se te olvidó tu contraseña');
INSERT INTO page_text_name (page_name_id,name,tab_index,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'LOGIN_FORM'),'LOGIN_FORM_FORGOT_PASSWORD',5,@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_FORM_FORGOT_PASSWORD'),'Forgot Password?','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_FORM_FORGOT_PASSWORD'),'Se te olvidó tu contraseña','es',true,null);

INSERT INTO texts (default_text) VALUES ('Change Password?');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Change Password');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Se te olvidó tu contraseña');
INSERT INTO page_text_name (page_name_id,name,tab_index,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'LOGIN_FORM'),'LOGIN_FORM_CHANGE_PASSWORD',6,@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_FORM_CHANGE_PASSWORD'),'Change Password?','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_FORM_CHANGE_PASSWORD'),'Se te olvidó tu contraseña','es',true,null);

INSERT INTO texts (default_text) VALUES ('User missing');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User missing');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Perdidos por el usuario');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'LOGIN_FORM'),'LOGIN_FORM_USERMISSING',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_FORM_USERMISSING'),'The user name you provided is not registered','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_FORM_USERMISSING'),'El nombre de usuario que ha proporcionado no está registrado','es',true,null);

INSERT INTO texts (default_text) VALUES ('Login Service');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Login Service');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Servicio de Inicio de Sesión');
INSERT INTO page_name (name,text_id,category) VALUES ('LOGIN_SERVICE',@lastid,'PUBLIC');

INSERT INTO texts (default_text) VALUES ('Bad username');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Bad username');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de usuario incorrecto');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'LOGIN_SERVICE'),'LOGIN_SERVICE_BADUSERNAME',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_SERVICE_BADUSERNAME'),'The username you provided does not exist','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_SERVICE_BADUSERNAME'),'El nombre de usuario que proporcionaste no existe','es',true,null);

INSERT INTO texts (default_text) VALUES ('Bad password');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Bad password');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de enviar');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'LOGIN_SERVICE'),'LOGIN_SERVICE_BADPASSWORD',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_SERVICE_BADPASSWORD'),'Your password is incorrect','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_SERVICE_BADPASSWORD'),'Su contraseña es incorrecta','es',true,null);

INSERT INTO texts (default_text) VALUES ('Check email confirm');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Check email confirm');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Verificar correo electrónico confirmar');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'LOGIN_SERVICE'),'LOGIN_SERVICE_CHECK_EMAIL_CONFIRM',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_SERVICE_CHECK_EMAIL_CONFIRM'),'Check the email you received from cborgdev@gmail.com and confirm registration','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'LOGIN_SERVICE_CHECK_EMAIL_CONFIRM'),'Compruebe el correo electrónico que recibió de cborgdev@gmail.com y confirme su registro','es',true,null);




-- PageName Password Change
INSERT INTO texts (default_text) VALUES ('Password change Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Password change Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de cambio de contraseña');
INSERT INTO page_name (name,text_id,category) VALUES ('PASSWORD_CHANGE_FORM',@lastid,'PUBLIC');

-- Form Field Password Change
INSERT INTO texts (default_text) VALUES ('User name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de usuario');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,tab_index,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'PASSWORD_CHANGE_FORM'),'PASSWORD_CHANGE_FORM_USERNAME',@lastid,'TXT',1,'text',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"username","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'PASSWORD_CHANGE_FORM_USERNAME'),'','User name:','en',true,true,0,'{"regex":"^[a-zA-Z0-9_#!@.]*$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'PASSWORD_CHANGE_FORM_USERNAME'),'','Nombre de usuario:','es',true,true,0,'{"regex":"^[a-zA-Z0-9_#!@.]*$","errorMsg":"Error de validacion"}',null);

INSERT INTO texts (default_text) VALUES ('Old Password');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Old Password');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Old Contraseña');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,tab_index,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'PASSWORD_CHANGE_FORM'),'PASSWORD_CHANGE_FORM_OLD_PASSWORD',@lastid,'TXT',2,'password',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"oldpassword","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'PASSWORD_CHANGE_FORM_OLD_PASSWORD'),'','Old Password:','en',true,true,1,'{"regex":"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[\\\\d]){1,})(?=(.*[^a-zA-Z0-9]){1,}).{7,30}$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'PASSWORD_CHANGE_FORM_OLD_PASSWORD'),'','Old Contraseña:','es',true,true,1,'{"regex":"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[\\\\d]){1,})(?=(.*[^a-zA-Z0-9]){1,}).{7,30}$","errorMsg":"Error de validacion"}',null);

INSERT INTO texts (default_text) VALUES ('Password');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Password');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Clave');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,tab_index,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'PASSWORD_CHANGE_FORM'),'PASSWORD_CHANGE_FORM_PASSWORD',@lastid,'TXT',3,'password',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"password","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'PASSWORD_CHANGE_FORM_PASSWORD'),'','Password:','en',true,true,1,'{"regex":"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[\\\\d]){1,})(?=(.*[^a-zA-Z0-9]){1,}).{7,30}$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'PASSWORD_CHANGE_FORM_PASSWORD'),'','Contraseña:','es',true,true,1,'{"regex":"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[\\\\d]){1,})(?=(.*[^a-zA-Z0-9]){1,}).{7,30}$","errorMsg":"Validation Error"}',null);

INSERT INTO texts (default_text) VALUES ('Verify Password');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Verify Password');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Verificar contraseña');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,tab_index,html_type,row_count,column_count,class_name,group_name,sub_group_name,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'PASSWORD_CHANGE_FORM'),'PASSWORD_CHANGE_FORM_VERIFYPASSWORD',@lastid,'TXT',4,'password',2,25,null,'MAIN',null,'{"matchItem":"PASSWORD_CHANGE_FORM_PASSWORD"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'PASSWORD_CHANGE_FORM_VERIFYPASSWORD'),'','Verify Password:','en',true,true,2,'{"regex":"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[\\\\d]){1,})(?=(.*[^a-zA-Z0-9]){1,}).{7,30}$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'PASSWORD_CHANGE_FORM_VERIFYPASSWORD'),'','Verifique su contraseña:','es',true,true,2,'{"regex":"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[\\\\d]){1,})(?=(.*[^a-zA-Z0-9]){1,}).{7,30}$","errorMsg":"Validation Error"}',null);

-- Texts Password Change
INSERT INTO texts (default_text) VALUES ('Submit - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Submit - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de enviar');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'PASSWORD_CHANGE_FORM'),'PASSWORD_CHANGE_FORM_SUBMIT',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_FORM_SUBMIT'),'Submit','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_FORM_SUBMIT'),'Presentar','es',true,null);

-- Password Change Service
INSERT INTO texts (default_text) VALUES ('Password change Service');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Password change Service');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Cambio de contraseña Servicio');
INSERT INTO page_name (name,text_id,category) VALUES ('PASSWORD_CHANGE_SERVICE',@lastid,'PUBLIC');

INSERT INTO texts (default_text) VALUES ('Email Verify');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Email Verify');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Correo electrónico Confirme');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'PASSWORD_CHANGE_SERVICE'),'PASSWORD_CHANGE_SERVICE_EMAIL_VERIFY',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_SERVICE_EMAIL_VERIFY'),'Your password was change if this was unexpected Please summit a security exception ticket!','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_SERVICE_EMAIL_VERIFY'),'Su contraseña cambió si esto fue inesperado Por favor cumbre un ticket de excepción de seguridad!','es',true,null);

INSERT INTO texts (default_text) VALUES ('User missing');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User missing');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Perdidos por el usuario');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'PASSWORD_CHANGE_SERVICE'),'PASSWORD_CHANGE_SERVICE_USERMISSING',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_SERVICE_USERMISSING'),'User does not exist! Try again','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_SERVICE_USERMISSING'),'¡El usuario no existe! Inténtalo de nuevo','es',true,null);

INSERT INTO texts (default_text) VALUES ('Password change successful');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Password change successful');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Cambio de contraseña satisfactorio');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'PASSWORD_CHANGE_SERVICE'),'PASSWORD_CHANGE_SERVICE_SUCCESSFUL',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_SERVICE_SUCCESSFUL'),'Your password has been successfully changed.','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_SERVICE_SUCCESSFUL'),'Su contraseña ha sido cambiada exitosamente.','es',true,null);

INSERT INTO texts (default_text) VALUES ('Old password incorrect');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Old password incorrect');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Contraseña antigua incorrecta');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'PASSWORD_CHANGE_SERVICE'),'PASSWORD_CHANGE_SERVICE_OLDPASS_INCORRECT',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_SERVICE_OLDPASS_INCORRECT'),'Old/Temparary Password is incorrect! Try again','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_SERVICE_OLDPASS_INCORRECT'),'Contraseña antigua / Temparary es incorrecta! Inténtalo de nuevo','es',true,null);

INSERT INTO texts (default_text) VALUES ('Password change failed');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Password change failed');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Cambio de contraseña falló');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'PASSWORD_CHANGE_SERVICE'),'PASSWORD_CHANGE_SERVICE_PASSCHANGE_FAIL',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_SERVICE_PASSCHANGE_FAIL'),'Password change FAILED! Try again','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_SERVICE_PASSCHANGE_FAIL'),'¡Cambio de contraseña falló! Inténtalo de nuevo','es',true,null);

INSERT INTO texts (default_text) VALUES ('User or Password empty');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User or Password empty');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Usuario o Contraseña vacío');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'PASSWORD_CHANGE_SERVICE'),'PASSWORD_CHANGE_SERVICE_USER_PASS_EMPTY',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_SERVICE_USER_PASS_EMPTY'),'Username or password can not be empty! Try again','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'PASSWORD_CHANGE_SERVICE_USER_PASS_EMPTY'),'¡El nombre de usuario o la contraseña no pueden estar vacíos! Inténtalo de nuevo','es',true,null);


-- PageName  Registration
INSERT INTO texts (default_text) VALUES ('Registration Check Name Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Registration Check Name Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de inscripción Comprobar nombre');
INSERT INTO page_name (name,text_id,category) VALUES ('REGISTRATION_CHECKNAME_FORM',@lastid,'PUBLIC');

INSERT INTO texts (default_text) VALUES ('Registration Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Registration Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de inscripción');
INSERT INTO page_name (name,text_id,category) VALUES ('REGISTRATION_FORM',@lastid,'PUBLIC');

-- Form Field  Registration Checkname
INSERT INTO texts (default_text) VALUES ('User name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de usuario');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_CHECKNAME_FORM'),'REGISTRATION_CHECKNAME_FORM_USERNAME',@lastid,'TXT',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"username","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_CHECKNAME_FORM_USERNAME'),'-Valid email address-','User name:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_CHECKNAME_FORM_USERNAME'),'-Dirección de email válida-','Nombre de usuari:','es',true,true,0,'',null);

-- Form Field  Registration Full
INSERT INTO texts (default_text) VALUES ('First name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','First name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Primer nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_FIRSTNAME',@lastid,'TXT','text',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"firstname","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_FIRSTNAME'),'','First name:','en',true,true,0,'{"regex":"^[a-zA-Z0-9]*$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_FIRSTNAME'),'','Nombre de pila:','es',true,true,0,'{"regex":"^[a-zA-Z0-9]*$","errorMsg":"Error de validacion"}',null);

INSERT INTO texts (default_text) VALUES ('Middle name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Middle name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Segundo nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_MIDDLENAME',@lastid,'TXT','text',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"middlename","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_MIDDLENAME'),'','Middle name:','en',false,false,1,'{"regex":"^[a-zA-Z0-9]*$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_MIDDLENAME'),'','Segundo Nombre:','es',false,false,1,'{"regex":"^[a-zA-Z0-9]*$","errorMsg":"Error de validacion"}',null);

INSERT INTO texts (default_text) VALUES ('Last name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Last name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Apellido');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_LASTNAME',@lastid,'TXT','text',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"lastname","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_LASTNAME'),'','Last name:','en',true,true,2,'{"regex":"^[a-zA-Z0-9]*$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_LASTNAME'),'','Apellido:','es',true,true,2,'{"regex":"^[a-zA-Z0-9]*$","errorMsg":"Error de validacion"}',null);

INSERT INTO texts (default_text) VALUES ('Zip code');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Zip code');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Código postal');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_ZIPCODE',@lastid,'TXT','text',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"zipcode","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_ZIPCODE'),'','Zip code:','en',true,true,3,'{"regex":"^\\\\d{5}(?:[-\\\\s]\\\\d{4})?$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_ZIPCODE'),'','Código postal:','es',true,true,3,'{"regex":"^\\\\d{5}(?:[-\\\\s]\\\\d{4})?$","errorMsg":"Error de validacion"}',null);

INSERT INTO texts (default_text) VALUES ('User name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de usuario');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_USERNAME',@lastid,'TXT','text',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"username","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_USERNAME'),'-Name used on posts-','User name:','en',true,true,4,'{"regex":"^[a-zA-Z0-9_#!@.]*$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_USERNAME'),'-Name used on posts-','Nombre de usuari:','es',true,true,4,'{"regex":"^[a-zA-Z0-9_#!@.]*$","errorMsg":"Error de validacion"}',null);

INSERT INTO texts (default_text) VALUES ('Email');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Email');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Email');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_EMAIL',@lastid,'TXT','email',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"email","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_EMAIL'),'-Valid email address-','Email:','en',true,true,5,'{"regex":"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\\\.[a-zA-Z]{2,}$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_EMAIL'),'-Dirección de email válida-','Nombre de usuari:','es',true,true,5,'{"regex":"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\\\.[a-zA-Z]{2,}$","errorMsg":"Validation Error"}',null);

INSERT INTO texts (default_text) VALUES ('Password');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Password');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Clave');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_PASSWORD',@lastid,'TXT','password',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"password","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_PASSWORD'),'','Password:','en',true,true,6,'{"regex":"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[\\\\d]){1,})(?=(.*[^a-zA-Z0-9]){1,}).{7,30}$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_PASSWORD'),'','Contraseña:','es',true,true,6,'{"regex":"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[\\\\d]){1,})(?=(.*[^a-zA-Z0-9]){1,}).{7,30}$","errorMsg":"Error de validacion"}',null);

INSERT INTO texts (default_text) VALUES ('Verify Password');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Verify Password');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Verificar contraseña');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_VERIFYPASSWORD',@lastid,'TXT','password',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"verifyPassword","type":"String"}','{"matchItem":"REGISTRATION_FORM_PASSWORD"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_VERIFYPASSWORD'),'','Verify Password:','en',true,true,7,'{"jsClass":"toastHub.getController(\\"usermanager\\")","jsMethod":"matchPassword"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'REGISTRATION_FORM_VERIFYPASSWORD'),'','Verifique su contraseña:','es',true,true,7,'{"jsClass":"toastHub.getController(\\"usermanager\\")","jsMethod":"matchPassword"}',null);

-- Labels Registration Check Name
INSERT INTO texts (default_text) VALUES ('Search Username - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Search Username - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Buscar Nombre de usuario - Botón');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_CHECKNAME_FORM'),'REGISTRATION_CHECKNAME_FORM_SEARCH_USERNAME_BUTTON',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'REGISTRATION_CHECKNAME_FORM_SEARCH_USERNAME_BUTTON'),'Search','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'REGISTRATION_CHECKNAME_FORM_SEARCH_USERNAME_BUTTON'),'Search es','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Reset - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Reset - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de reinicio');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_CHECKNAME_FORM'),'REGISTRATION_CHECKNAME_FORM_RESET_BUTTON',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'REGISTRATION_CHECKNAME_FORM_RESET_BUTTON'),'Reset','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'REGISTRATION_CHECKNAME_FORM_RESET_BUTTON'),'Reajustar','es',true,1,null);

-- Labels Registration Full
INSERT INTO texts (default_text) VALUES ('Register - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Register - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Registro - Botón');
INSERT INTO page_label_name (page_name_id,name,class_name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_SUBMIT_BUTTON','form-control btn btn-register',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'REGISTRATION_FORM_SUBMIT_BUTTON'),'Register','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'REGISTRATION_FORM_SUBMIT_BUTTON'),'Registro','es',true,0,null);

-- Texts Registration
INSERT INTO texts (default_text) VALUES ('Registration Successful');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Registration Successful');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Registro exitoso');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_SUCCESSFUL',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_SUCCESSFUL'),'User Registration Successful','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_SUCCESSFUL'),'El éxito de Registro de Usuario','es',true,null);

INSERT INTO texts (default_text) VALUES ('Registration Failed');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Registration Failed');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Registro fallido');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_FAILED',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_FAILED'),'User Registration Failed','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_FAILED'),'Error de Registro de Usuario','es',true,null);

INSERT INTO texts (default_text) VALUES ('Capital Check');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Capital Check');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Cheque de capital');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_CAPITAL_CHECK',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_CAPITAL_CHECK'),'At least one capital','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_CAPITAL_CHECK'),'Al menos un capital','es',true,null);

INSERT INTO texts (default_text) VALUES ('Alpha Check');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Alpha Check');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Cheque alfa');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_ALPHA_CHECK',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_ALPHA_CHECK'),'At least one alpha letter','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_ALPHA_CHECK'),'Al menos una letra alfa','es',true,null);

INSERT INTO texts (default_text) VALUES ('Number Check');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Number Check');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Número de cheques');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_NUMBER_CHECK',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_NUMBER_CHECK'),'At least one number','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_NUMBER_CHECK'),'Al menos un número','es',true,null);

INSERT INTO texts (default_text) VALUES ('Count Check');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Count Check');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Cuenta de Cheques');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_COUNT_CHECK',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_COUNT_CHECK'),'At least 8 characters','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_COUNT_CHECK'),'Al menos 8 caracteres','es',true,null);

INSERT INTO texts (default_text) VALUES ('Special character Check');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Special character Check');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Carácter especial Comprobar');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_SPECIAL_CHECK',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_SPECIAL_CHECK'),'At least one special characters !#@','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_SPECIAL_CHECK'),'Al menos un personaje especial !#@','es',true,null);

INSERT INTO texts (default_text) VALUES ('Match Check');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Match Check');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Comprobación del partido');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_FORM_MATCH_CHECK',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_MATCH_CHECK'),'Match password','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FORM_MATCH_CHECK'),'Contraseña','es',true,null);

INSERT INTO texts (default_text) VALUES ('Registration Show Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Registration Show Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Registro Mostrar formulario');
INSERT INTO page_option_name (page_name_id,name,text_id,value_type,default_value,use_default,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_FORM'),'REGISTRATION_SHOW_FORM',@lastid,'Boolean','true',false,null);
INSERT INTO page_option_value (page_option_name_id,option_value,lang,rendered,created) VALUES ((SELECT id FROM page_option_name WHERE name = 'REGISTRATION_SHOW_FORM'),'true','en',true,null);
INSERT INTO page_option_value (page_option_name_id,option_value,lang,rendered,created) VALUES ((SELECT id FROM page_option_name WHERE name = 'REGISTRATION_SHOW_FORM'),'true','es',true,null);

-- Registration Service
INSERT INTO texts (default_text) VALUES ('Registration Service');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Registration Service');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de inscripción');
INSERT INTO page_name (name,text_id,category) VALUES ('REGISTRATION_SERVICE',@lastid,'PUBLIC');

INSERT INTO texts (default_text) VALUES ('Match Password Failure');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Match Password Failure');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Error de contraseña de coincidencia');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_SERVICE'),'REGISTRATION_SERVICE_MATCH_PASSWORD_FAILURE',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_SERVICE_MATCH_PASSWORD_FAILURE'),'Registration Failed - Passwords did not match','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_SERVICE_MATCH_PASSWORD_FAILURE'),'Error de registro: las contraseñas no coincidieron','es',true,null);

INSERT INTO texts (default_text) VALUES ('Registration Successful');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Registration Successful');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Registro exitoso');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_SERVICE'),'REGISTRATION_SUCCESSFUL',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_SUCCESSFUL'),'Registration SUCCESSFUL! - Check email to complete process!','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_SUCCESSFUL'),'¡Registro exitoso! - ¡Revise el correo electrónico para completar el proceso!','es',true,null);

INSERT INTO texts (default_text) VALUES ('Registration Fail');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Registration Fail');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Error de registro');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_SERVICE'),'REGISTRATION_FAIL',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FAIL'),'Registration Fail','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'REGISTRATION_FAIL'),'Error de registro','es',true,null);



INSERT INTO texts (default_text) VALUES ('Registration Service');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Registration Service');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Servicio de registro');
INSERT INTO page_option_name (page_name_id,name,text_id,value_type,default_value,use_default,created) VALUES((SELECT id FROM page_name WHERE name = 'REGISTRATION_SERVICE'),'REGISTRATION_SERVICE',@lastid,'Boolean','true',false,null);
INSERT INTO page_option_value (page_option_name_id,option_value,lang,rendered,created) VALUES ((SELECT id FROM page_option_name WHERE name = 'REGISTRATION_SERVICE'),'true','en',true,null);
INSERT INTO page_option_value (page_option_name_id,option_value,lang,rendered,created) VALUES ((SELECT id FROM page_option_name WHERE name = 'REGISTRATION_SERVICE'),'true','es',true,null);

-- Forgot Password
INSERT INTO texts (default_text) VALUES ('Forgot Password Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Forgot Password Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de inscripción');
INSERT INTO page_name (name,text_id,category) VALUES ('FORGOTPASSWORD_FORM',@lastid,'PUBLIC');

INSERT INTO texts (default_text) VALUES ('Username');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Username');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de usuario');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FORGOTPASSWORD_FORM'),'FORGOTPASSWORD_FORM_USERNAME',@lastid,'TXT','text',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"username","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FORGOTPASSWORD_FORM_USERNAME'),'','Username Or Email:','en',true,true,0,'{"regex":"^[a-zA-Z0-9_#!@.]*$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FORGOTPASSWORD_FORM_USERNAME'),'','Nombre de usuario:','es',true,true,0,'{"regex":"^[a-zA-Z0-9_#!@.]*$","errorMsg":"Error de validacion"}',null);

INSERT INTO texts (default_text) VALUES ('Submit Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Submit Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de enviar');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'FORGOTPASSWORD_FORM'),'FORGOTPASSWORD_FORM_SUBMIT',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'FORGOTPASSWORD_FORM_SUBMIT'),'Submit','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'FORGOTPASSWORD_FORM_SUBMIT'),'Enviar','es',true,null);

INSERT INTO texts (default_text) VALUES ('Forgot Password Service');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Forgot Password Service');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','¿Olvidó el servicio de contraseña?');
INSERT INTO page_name (name,text_id,category) VALUES ('FORGOTPASSWORD_SERVICE',@lastid,'PUBLIC');

INSERT INTO texts (default_text) VALUES ('User missing');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User missing');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Perdidos por el usuario');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'FORGOTPASSWORD_SERVICE'),'FORGOTPASSWORD_SERVICE_USERMISSING',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'FORGOTPASSWORD_SERVICE_USERMISSING'),'The user you provided does not exist.','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'FORGOTPASSWORD_SERVICE_USERMISSING'),'El usuario que proporcionaste no existe.','es',true,null);

INSERT INTO texts (default_text) VALUES ('Successful');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Successful');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Exitoso');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'FORGOTPASSWORD_SERVICE'),'FORGOTPASSWORD_SERVICE_SUCCESSFUL',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'FORGOTPASSWORD_SERVICE_SUCCESSFUL'),'Password reset Successful, Check email for new password.','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'FORGOTPASSWORD_SERVICE_SUCCESSFUL'),'Password reset Successful, Chequee el correo electrónico de la nueva contraseña.','es',true,null);

INSERT INTO texts (default_text) VALUES ('Password Fail');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Password Fail');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Error en la contraseña');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'FORGOTPASSWORD_SERVICE'),'FORGOTPASSWORD_SERVICE_PASSWORD_FAIL',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'FORGOTPASSWORD_SERVICE_PASSWORD_FAIL'),'Password reset FAILED! Try again','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'FORGOTPASSWORD_SERVICE_PASSWORD_FAIL'),'Restablecimiento de contraseña FALLA! Inténtalo de nuevo','es',true,null);

INSERT INTO texts (default_text) VALUES ('General Fail');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','General Fail');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','General Fail');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'FORGOTPASSWORD_SERVICE'),'FORGOTPASSWORD_SERVICE_FAIL',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'FORGOTPASSWORD_SERVICE_FAIL'),'Forgot password Failed','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'FORGOTPASSWORD_SERVICE_FAIL'),'¿Olvidó su contraseña?','es',true,null);

-- Confirm email
INSERT INTO texts (default_text) VALUES ('Confirm email service');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Confirm email service');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Confirmar formulario de correo electrónico');
INSERT INTO page_name (name,text_id,category) VALUES ('CONFIRM_EMAIL_SERVICE',@lastid,'PUBLIC');

INSERT INTO texts (default_text) VALUES ('Username');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Username');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de usuario');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'CONFIRM_EMAIL_SERVICE'),'CONFIRM_EMAIL_SERVICE_USERNAME',@lastid,'TXT','text',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"username","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'CONFIRM_EMAIL_SERVICE_USERNAME'),'','Username Or Email:','en',true,true,0,'{"regex":"^[a-zA-Z0-9_#!@.]*$","errorMsg":"Validation Error"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'CONFIRM_EMAIL_SERVICE_USERNAME'),'','Nombre de usuario:','es',true,true,0,'{"regex":"^[a-zA-Z0-9_#!@.]*$","errorMsg":"Error de validacion"}',null);

INSERT INTO texts (default_text) VALUES ('Token');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Token');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Simbólico');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'CONFIRM_EMAIL_SERVICE'),'CONFIRM_EMAIL_SERVICE_TOKEN',@lastid,'TXT','text',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"token","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'CONFIRM_EMAIL_SERVICE_TOKEN'),'','Token:','en',true,true,0,'{"regex":"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[\\\\d]){1,})(?=(.*[^a-zA-Z0-9]){1,}).{7,30}$","errorMsg":"Token is not valid"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'CONFIRM_EMAIL_SERVICE_TOKEN'),'','Simbólico:','es',true,true,0,'{"regex":"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[\\\\d]){1,})(?=(.*[^a-zA-Z0-9]){1,}).{7,30}$","errorMsg":"Token no es válido"}',null);

INSERT INTO texts (default_text) VALUES ('User does not exist');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User does not exist');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','el usuario no existe');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'CONFIRM_EMAIL_SERVICE'),'CONFIRM_EMAIL_SERVICE_USERMISSING',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'CONFIRM_EMAIL_SERVICE_USERMISSING'),'User does not exist','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'CONFIRM_EMAIL_SERVICE_USERMISSING'),'el usuario no existe','es',true,null);

INSERT INTO texts (default_text) VALUES ('Database Query Error');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Database Query Error');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Error de consulta de base de datos');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'CONFIRM_EMAIL_SERVICE'),'CONFIRM_EMAIL_SERVICE_DBERROR',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'CONFIRM_EMAIL_SERVICE_DBERROR'),'Database Query Error','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'CONFIRM_EMAIL_SERVICE_DBERROR'),'Error de consulta de base de datos','es',true,null);

INSERT INTO texts (default_text) VALUES ('Successful');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Successful');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Exitoso');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'CONFIRM_EMAIL_SERVICE'),'CONFIRM_EMAIL_SERVICE_SUCCESSFUL',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'CONFIRM_EMAIL_SERVICE_SUCCESSFUL'),'Email Confirmation Successful','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'CONFIRM_EMAIL_SERVICE_SUCCESSFUL'),'Confirmación de correo electrónico con éxito','es',true,null);


INSERT INTO texts (default_text) VALUES ('General Fail');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','General Fail');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','General Fail');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'CONFIRM_EMAIL_SERVICE'),'CONFIRM_EMAIL_SERVICE_FAIL',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'CONFIRM_EMAIL_SERVICE_FAIL'),'Email Confirmation failed','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'CONFIRM_EMAIL_SERVICE_FAIL'),'Error de confirmación de correo electrónico','es',true,null);


-- Admin Page Form
INSERT INTO texts (default_text) VALUES ('Admin Page Preference Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Page Preference Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de preferencia de página de administrador');
INSERT INTO page_name (name,text_id,category) VALUES ('APP_PAGE_FORM',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_PAGE_FORM'),'APP_PAGE_FORM_NAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageName","field":"name","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_PAGE_FORM_NAME'),'','Name:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_PAGE_FORM_NAME'),'','Nombre:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_PAGE_FORM'),'APP_PAGE_FORM_TITLE',@lastid,'GRP','text',0,0,null,'MAIN','MTITLE','{"clazz":"org.toasthub.core.general.model.AppPageName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","type":"Object"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_PAGE_FORM_TITLE'),'','Title:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_PAGE_FORM_TITLE'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Default Text Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Text Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título de texto predeterminado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_PAGE_FORM'),'APP_PAGE_FORM_TITLE_DEFAULT',@lastid,'TXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.AppPageName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":"defaultText","type":"String"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_PAGE_FORM_TITLE_DEFAULT'),'','Default Text:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_PAGE_FORM_TITLE_DEFAULT'),'','Texto predeterminado:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Title Text');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title Text');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Texto del título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_PAGE_FORM'),'APP_PAGE_FORM_TITLE_TEXT',@lastid,'LTXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.AppPageName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":{"langTexts":{"clazz":"org.toasthub.core.general.model.LangText","type":"Set","fields":[{"field":"text","type":"String"},{"field":"lang","type":"String"}]}}}},"method":"setTitleMtext","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_PAGE_FORM_TITLE_TEXT'),'','Text:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_PAGE_FORM_TITLE_TEXT'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_PAGE_FORM'),'APP_PAGE_FORM_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageName","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_PAGE_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_PAGE_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Nombre deila:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Category');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Category');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Categoría');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_PAGE_FORM'),'APP_PAGE_FORM_CATEGORY',@lastid,'SLT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageName","field":"category","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_PAGE_FORM_CATEGORY'),'{"options":[{"value":"PUBLIC","label":"PUBLIC"},{"value":"MEMBER","label":"MEMBER"},{"value":"ADMIN","label":"ADMIN","default":true}]}','Category:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_PAGE_FORM_CATEGORY'),'{"options":[{"value":"PUBLIC","label":"PUBLIC"},{"value":"MEMBER","label":"MEMBER"},{"value":"ADMIN","label":"ADMIN","default":true}]}','Categoría:','es',true,true,3,'',null);


-- Admin FormField Form
INSERT INTO texts (default_text) VALUES ('Admin FormField Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin FormField Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario Admin FormField');
INSERT INTO page_name (name,text_id,category) VALUES ('APP_FORMFIELD_FORM',@lastid,'ADMIN');

-- Form Field 
INSERT INTO texts (default_text) VALUES ('Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_NAME_NAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":"name","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_NAME'),'','Name:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_NAME'),'','Nombre:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_NAME_TITLE',@lastid,'GRP','text',0,0,null,'MAIN','MTITLE','{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","type":"Object"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_TITLE'),'','Title:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_TITLE'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Default Text Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Text Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título de texto predeterminado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_NAME_TITLE_DEFAULT',@lastid,'TXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":"defaultText","type":"String"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_TITLE_DEFAULT'),'','Default Text:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_TITLE_DEFAULT'),'','Texto predeterminado:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Title Text');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title Text');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Texto del título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_NAME_TITLE_TEXT',@lastid,'LTXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":{"langTexts":{"clazz":"org.toasthub.core.general.model.LangText","type":"Set","fields":[{"field":"text","type":"String"},{"field":"lang","type":"String"}]}}}},"method":"setTitleMtext","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_TITLE_TEXT'),'','Text:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_TITLE_TEXT'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_NAME_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Nombre deila:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Field Type');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Field Type');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_NAME_FIELDTYPE',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":"fieldType","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_FIELDTYPE'),'','Field Type:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_FIELDTYPE'),'','Tipo de campo:','es',true,true,3,'',null);

INSERT INTO texts (default_text) VALUES ('Rows');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Rows');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Filas');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_NAME_ROWS',@lastid,'INT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":"rows","type":"Integer"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_ROWS'),'','Rows:','en',true,false,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_ROWS'),'','Filas:','es',true,false,4,'',null);

INSERT INTO texts (default_text) VALUES ('Cols');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Cols');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columnas');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_NAME_COLS',@lastid,'INT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":"cols","type":"Integer"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_COLS'),'','Cols:','en',true,false,5,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_COLS'),'','Columnas:','es',true,false,5,'',null);

INSERT INTO texts (default_text) VALUES ('Class Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Class Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de la clase');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_NAME_CLASSNAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":"className","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_CLASSNAME'),'','Class Name:','en',true,false,6,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_CLASSNAME'),'','Nombre de la clase:','es',true,false,6,'',null);

INSERT INTO texts (default_text) VALUES ('Group');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Group');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Grupo');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_NAME_GROUP',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":"group","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_GROUP'),'','Group:','en',true,true,7,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_GROUP'),'','Grupo:','es',true,true,7,'',null);

INSERT INTO texts (default_text) VALUES ('Subgroup');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Subgroup');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Subgrupo');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_NAME_SUBGROUP',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":"subGroup","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_SUBGROUP'),'','Subgroup:','en',true,false,8,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_SUBGROUP'),'','Subgrupo:','es',true,false,8,'',null);



INSERT INTO texts (default_text) VALUES ('Values');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Values');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Valores');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_NAME_VALUES',@lastid,'GRP','text',0,0,null,'MAIN','MVALUES','{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":{"values":{"clazz":"org.toasthub.core.general.model.AppPageFormFieldValue","type":"Set"}},"method":"setMValues","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_VALUES'),'','Values:','en',true,true,9,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_NAME_VALUES'),'','Valores:','es',true,true,9,'',null);

INSERT INTO texts (default_text) VALUES ('Value');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Value');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Valor');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_VALUE_VALUE',@lastid,'MTXT','text',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":"value","type":"String","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_VALUE_VALUE'),'','Value:','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_VALUE_VALUE'),'','Valor:','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Label');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Label');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Etiqueta');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_VALUE_LABEL',@lastid,'MTXT','text',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":"label","type":"String","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_VALUE_LABEL'),'','Label:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_VALUE_LABEL'),'','Etiqueta:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Language');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Language');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Idioma');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_VALUE_LANG',@lastid,'MTXT','text',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":"lang","type":"String","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_VALUE_LANG'),'','Language:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_VALUE_LANG'),'','Idioma:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Rendered');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Rendered');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Rendido');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_VALUE_RENDERED',@lastid,'MBLN','radioH',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":"rendered","type":"Boolean","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_VALUE_RENDERED'),'{"options":[{"value":true,"label":"True","default":true},{"value":false,"label":"False"}]}','Rendered:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_VALUE_RENDERED'),'{"options":[{"value":true,"label":"Cierto","default":true},{"value":false,"label":"Falso"}]}','Rendido:','es',true,true,3,'',null);

INSERT INTO texts (default_text) VALUES ('Required');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Required');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Necesario');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_FORMFIELD_FORM'),'APP_FORMFIELD_VALUE_REQUIRED',@lastid,'MBLN','radioH',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageFormFieldName","field":"required","type":"Boolean","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_VALUE_REQUIRED'),'{"options":[{"value":true,"label":"True","default":true},{"value":false,"label":"False"}]}','Required:','en',true,true,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_FORMFIELD_VALUE_REQUIRED'),'{"options":[{"value":true,"label":"Cierto","default":true},{"value":false,"label":"Falso"}]}','Necesario:','es',true,true,4,'',null);



-- Admin Label Form
INSERT INTO texts (default_text) VALUES ('Admin Label Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Label Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de etiqueta de administración');
INSERT INTO page_name (name,text_id,category) VALUES ('APP_LABEL_FORM',@lastid,'ADMIN');

-- Label 
INSERT INTO texts (default_text) VALUES ('Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_LABEL_FORM'),'APP_LABEL_NAME_NAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageLabelName","field":"name","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_NAME'),'','Name:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_NAME'),'','Nombre:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_LABEL_FORM'),'APP_LABEL_NAME_TITLE',@lastid,'GRP','text',0,0,null,'MAIN','MTITLE','{"clazz":"org.toasthub.core.general.model.AppPageLabelName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","type":"Object"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_TITLE'),'','Title:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_TITLE'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Default Text Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Text Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título de texto predeterminado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_LABEL_FORM'),'APP_LABEL_NAME_TITLE_DEFAULT',@lastid,'TXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.AppPageLabelName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":"defaultText","type":"String"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_TITLE_DEFAULT'),'','Default Text:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_TITLE_DEFAULT'),'','Texto predeterminado:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Title Text');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title Text');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Texto del título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_LABEL_FORM'),'APP_LABEL_NAME_TITLE_TEXT',@lastid,'LTXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.AppPageLabelName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":{"langTexts":{"clazz":"org.toasthub.core.general.model.LangText","type":"Set","fields":[{"field":"text","type":"String"},{"field":"lang","type":"String"}]}}}},"method":"setTitleMtext","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_TITLE_TEXT'),'','Text:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_TITLE_TEXT'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_LABEL_FORM'),'APP_LABEL_NAME_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageLabelName","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Nombre deila:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Optional params');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Optional params');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Parámetros opcionales');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_LABEL_FORM'),'APP_LABEL_NAME_OPTIONALPARAMS',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageLabelName","field":"optionalParams","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_OPTIONALPARAMS'),'','Optional params:','en',true,false,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_OPTIONALPARAMS'),'','Parámetros opcionales:','es',true,false,3,'',null);


INSERT INTO texts (default_text) VALUES ('Values');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Values');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Valores');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_LABEL_FORM'),'APP_LABEL_NAME_VALUES',@lastid,'GRP','text',0,0,null,'MAIN','MVALUES','{"clazz":"org.toasthub.core.general.model.AppPageLabelName","field":{"values":{"clazz":"org.toasthub.core.general.model.AppPageLabelValue","type":"Set"}},"method":"setMValues","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_VALUES'),'','Values:','en',true,true,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_NAME_VALUES'),'','Valores:','es',true,true,4,'',null);

INSERT INTO texts (default_text) VALUES ('Value');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Value');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Valor');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_LABEL_FORM'),'APP_LABEL_VALUE_VALUE',@lastid,'MTXT','text',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageLabelName","field":"value","type":"String","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_VALUE_VALUE'),'','Value:','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_VALUE_VALUE'),'','Valor:','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Language');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Language');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Idioma');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_LABEL_FORM'),'APP_LABEL_VALUE_LANG',@lastid,'MTXT','text',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageLabelName","field":"lang","type":"String","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_VALUE_LANG'),'','Language:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_VALUE_LANG'),'','Idioma:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Rendered');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Rendered');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Rendido');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_LABEL_FORM'),'APP_LABEL_VALUE_RENDERED',@lastid,'MBLN','radioH',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageLabelName","field":"rendered","type":"Boolean","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_VALUE_RENDERED'),'{"options":[{"value":true,"label":"True","default":true},{"value":false,"label":"False"}]}','Rendered:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_LABEL_VALUE_RENDERED'),'{"options":[{"value":true,"label":"Cierto","default":true},{"value":false,"label":"Falso"}]}','Rendido:','es',true,true,2,'',null);



-- Admin Text Form
INSERT INTO texts (default_text) VALUES ('Admin Text Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Text Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de texto de administrador');
INSERT INTO page_name (name,text_id,category) VALUES ('APP_TEXT_FORM',@lastid,'ADMIN');

-- Text 
INSERT INTO texts (default_text) VALUES ('Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_TEXT_FORM'),'APP_TEXT_NAME_NAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageTextName","field":"name","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_NAME'),'','Name:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_NAME'),'','Nombre:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_TEXT_FORM'),'APP_TEXT_NAME_TITLE',@lastid,'GRP','text',0,0,null,'MAIN','MTITLE','{"clazz":"org.toasthub.core.general.model.AppPageTextName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","type":"Object"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_TITLE'),'','Title:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_TITLE'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Default Text Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Text Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título de texto predeterminado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_TEXT_FORM'),'APP_TEXT_NAME_TITLE_DEFAULT',@lastid,'TXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.AppPageTextName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":"defaultText","type":"String"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_TITLE_DEFAULT'),'','Default Text:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_TITLE_DEFAULT'),'','Texto predeterminado:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Title Text');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title Text');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Texto del título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_TEXT_FORM'),'APP_TEXT_NAME_TITLE_TEXT',@lastid,'LTXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.AppPageTextName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":{"langTexts":{"clazz":"org.toasthub.core.general.model.LangText","type":"Set","fields":[{"field":"text","type":"String"},{"field":"lang","type":"String"}]}}}},"method":"setTitleMtext","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_TITLE_TEXT'),'','Text:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_TITLE_TEXT'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_TEXT_FORM'),'APP_TEXT_NAME_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageTextName","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Nombre deila:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Field Type');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Field Type');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_TEXT_FORM'),'APP_TEXT_NAME_OPTIONALPARAMS',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageTextName","field":"optionalParams","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_OPTIONALPARAMS'),'','Optional params:','en',true,false,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_OPTIONALPARAMS'),'','Parámetros opcionales:','es',true,false,3,'',null);


INSERT INTO texts (default_text) VALUES ('Values');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Values');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Valores');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_TEXT_FORM'),'APP_TEXT_NAME_VALUES',@lastid,'GRP','text',0,0,null,'MAIN','MVALUES','{"clazz":"org.toasthub.core.general.model.AppPageTextName","field":{"values":{"clazz":"org.toasthub.core.general.model.AppPageTextValue","type":"Set"}},"method":"setMValues","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_VALUES'),'','Values:','en',true,true,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_NAME_VALUES'),'','Valores:','es',true,true,4,'',null);

INSERT INTO texts (default_text) VALUES ('Value');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Value');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Valor');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_TEXT_FORM'),'APP_TEXT_VALUE_VALUE',@lastid,'MTXT','text',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageTextName","field":"value","type":"String","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_VALUE_VALUE'),'','Value:','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_VALUE_VALUE'),'','Valor:','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Language');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Language');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Idioma');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_TEXT_FORM'),'APP_TEXT_VALUE_LANG',@lastid,'MTXT','text',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageTextName","field":"lang","type":"String","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_VALUE_LANG'),'','Language:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_VALUE_LANG'),'','Idioma:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Rendered');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Rendered');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Rendido');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_TEXT_FORM'),'APP_TEXT_VALUE_RENDERED',@lastid,'MBLN','radioH',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageTextName","field":"rendered","type":"Boolean","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_VALUE_RENDERED'),'{"options":[{"value":true,"label":"True","default":true},{"value":false,"label":"False"}]}','Rendered:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_TEXT_VALUE_RENDERED'),'{"options":[{"value":true,"label":"Cierto","default":true},{"value":false,"label":"Falso"}]}','Rendido:','es',true,true,2,'',null);





-- Admin Option Form
INSERT INTO texts (default_text) VALUES ('Admin Option Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Option Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de opción de administración');
INSERT INTO page_name (name,text_id,category) VALUES ('APP_OPTION_FORM',@lastid,'ADMIN');

-- Option 
INSERT INTO texts (default_text) VALUES ('Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_NAME_NAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":"name","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_NAME'),'','Name:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_NAME'),'','Nombre:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_NAME_TITLE',@lastid,'GRP','text',0,0,null,'MAIN','MTITLE','{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","type":"Object"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_TITLE'),'','Title:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_TITLE'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Default Text Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Text Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título de texto predeterminado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_NAME_TITLE_DEFAULT',@lastid,'TXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":"defaultText","type":"String"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_TITLE_DEFAULT'),'','Default Text:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_TITLE_DEFAULT'),'','Texto predeterminado:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Title Text');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title Text');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Texto del título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_NAME_TITLE_TEXT',@lastid,'LTXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":{"langTexts":{"clazz":"org.toasthub.core.general.model.LangText","type":"Set","fields":[{"field":"text","type":"String"},{"field":"lang","type":"String"}]}}}},"method":"setTitleMtext","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_TITLE_TEXT'),'','Text:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_TITLE_TEXT'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_NAME_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Nombre deila:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Value Type');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Value Type');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Tipo de valor');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_NAME_VALUETYPE',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":"valueType","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_VALUETYPE'),'','Value Type:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_VALUETYPE'),'','Tipo de valor:','es',true,true,3,'',null);

INSERT INTO texts (default_text) VALUES ('Default value');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default value');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Valor por defecto');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_NAME_DEFAULTVALUE',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":"defaultValue","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_DEFAULTVALUE'),'','Default value:','en',true,false,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_DEFAULTVALUE'),'','Valor por defecto:','es',true,false,4,'',null);

INSERT INTO texts (default_text) VALUES ('Use Default');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Use Default');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Uso por defecto');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_NAME_USEDEFAULT',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":"useDefault","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_USEDEFAULT'),'{"options":[{"value":true,"label":"Yes","default":true},{"value":false,"label":"No"}]}','Use default:','en',true,true,5,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_USEDEFAULT'),'{"options":[{"value":true,"label":"Sí","default":true},{"value":false,"label":"No"}]}','Uso por defecto:','es',true,true,5,'',null);

INSERT INTO texts (default_text) VALUES ('Optional Params');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Optional Params');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Parámetros opcionales');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_NAME_OPTIONALPARAMS',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":"optionalParams","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_OPTIONALPARAMS'),'','Optional Params:','en',true,false,6,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_OPTIONALPARAMS'),'','Parámetros opcionales:','es',true,false,6,'',null);



INSERT INTO texts (default_text) VALUES ('Values');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Values');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Valores');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_NAME_VALUES',@lastid,'GRP','text',0,0,null,'MAIN','MVALUES','{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":{"values":{"clazz":"org.toasthub.core.general.model.AppPageOptionValue","type":"Set"}},"method":"setMValues","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_VALUES'),'','Values:','en',true,true,7,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_NAME_VALUES'),'','Valores:','es',true,true,7,'',null);

INSERT INTO texts (default_text) VALUES ('Value');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Value');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Valor');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_VALUE_VALUE',@lastid,'MTXT','text',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":"value","type":"String","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_VALUE_VALUE'),'','Value:','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_VALUE_VALUE'),'','Valor:','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Validation');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Validation');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Etiqueta');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_VALUE_VALIDATION',@lastid,'MTXT','text',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":"validation","type":"String","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_VALUE_VALIDATION'),'','Validation:','en',true,false,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_VALUE_VALIDATION'),'','Validación:','es',true,false,1,'',null);

INSERT INTO texts (default_text) VALUES ('Language');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Language');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Idioma');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_VALUE_LANG',@lastid,'MTXT','text',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":"lang","type":"String","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_VALUE_LANG'),'','Language:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_VALUE_LANG'),'','Idioma:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Rendered');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Rendered');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Rendido');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_OPTION_FORM'),'APP_OPTION_VALUE_RENDERED',@lastid,'MBLN','radioH',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.AppPageOptionName","field":"rendered","type":"Boolean","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_VALUE_RENDERED'),'{"options":[{"value":true,"label":"True","default":true},{"value":false,"label":"False"}]}','Rendered:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_OPTION_VALUE_RENDERED'),'{"options":[{"value":true,"label":"Cierto","default":true},{"value":false,"label":"Falso"}]}','Rendido:','es',true,true,3,'',null);





-- Admin Prefereneces Page
INSERT INTO texts (default_text) VALUES ('Admin Preference Page');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Preferenece Page');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Página Admin Preferenece');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_PREFERENCE_PAGE',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Page Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Page Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado de página');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PREFERENCE_PAGE'),'ADMIN_PREFERENCE_PAGE_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_PREFERENCE_PAGE_HEADER'),'Preferences','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_PREFERENCE_PAGE_HEADER'),'Preferencias','es',true,null);

INSERT INTO texts (default_text) VALUES ('Option Add');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Option Add');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Opción Añadir');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PREFERENCE_PAGE'),'ADMIN_PREFERENCE_PAGE_OPTION_ADD',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_PREFERENCE_PAGE_OPTION_ADD'),'Add','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_PREFERENCE_PAGE_OPTION_ADD'),'Añadir','es',true,null);

-- Labels
INSERT INTO texts (default_text) VALUES ('Tab - Form Fields');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Tab - Form Fields');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Tab - Campos del formulario');
INSERT INTO page_label_name (page_name_id,name,text_id,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PREFERENCE_PAGE'),'ADMIN_PREFERENCE_PAGE_TAB_FORMFIELD',@lastid,'{"tabCode":"formfield","selected":true}',null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PREFERENCE_PAGE_TAB_FORMFIELD'),'Form Fields','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PREFERENCE_PAGE_TAB_FORMFIELD'),'Campos del formulario','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Tab - Labels');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Tab - Labelds');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Tab - Etiquetas');
INSERT INTO page_label_name (page_name_id,name,text_id,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PREFERENCE_PAGE'),'ADMIN_PREFERENCE_PAGE_TAB_LABELS',@lastid,'{"tabCode":"label"}',null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PREFERENCE_PAGE_TAB_LABELS'),'Labels','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PREFERENCE_PAGE_TAB_LABELS'),'Etiquetas','es',true,1,null);

INSERT INTO texts (default_text) VALUES ('Tab - Texts');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Tab - Texts');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Tab - Textos');
INSERT INTO page_label_name (page_name_id,name,text_id,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PREFERENCE_PAGE'),'ADMIN_PREFERENCE_PAGE_TAB_TEXTS',@lastid,'{"tabCode":"text"}',null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PREFERENCE_PAGE_TAB_TEXTS'),'Texts','en',true,2,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PREFERENCE_PAGE_TAB_TEXTS'),'Textos','es',true,2,null);

INSERT INTO texts (default_text) VALUES ('Tab - Options');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Tab - Options');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Tab - Opciones');
INSERT INTO page_label_name (page_name_id,name,text_id,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PREFERENCE_PAGE'),'ADMIN_PREFERENCE_PAGE_TAB_OPTIONS',@lastid,'{"tabCode":"option"}',null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PREFERENCE_PAGE_TAB_OPTIONS'),'Options','en',true,3,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PREFERENCE_PAGE_TAB_OPTIONS'),'Opciones','es',true,3,null);




-- Languages
INSERT INTO texts (default_text) VALUES ('Admin Language Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Language Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de idioma de administración');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_LANGUAGE_FORM',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_LANGUAGE_FORM'),'ADMIN_LANGUAGE_FORM_TITLE',@lastid,'GRP','text',0,0,null,'MAIN','MTITLE','{"clazz":"org.toasthub.core.general.model.Language","field":"title","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_TITLE'),'','Title:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_TITLE'),'','Título:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Default Text Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Text Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título de texto predeterminado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_LANGUAGE_FORM'),'ADMIN_LANGUAGE_FORM_TITLE_DEFAULT',@lastid,'TXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.Language","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":"defaultText","type":"String"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_TITLE_DEFAULT'),'','Default Text:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_TITLE_DEFAULT'),'','Texto predeterminado:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Title Text');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title Text');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Texto del título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_LANGUAGE_FORM'),'ADMIN_LANGUAGE_FORM_TITLE_TEXT',@lastid,'LTXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.Language","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":{"langTexts":{"clazz":"org.toasthub.core.general.model.LangText","type":"Set","fields":[{"field":"text","type":"String"},{"field":"lang","type":"String"}]}}}},"method":"setTitleMtext","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_TITLE_TEXT'),'','Text:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_TITLE_TEXT'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Code');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Code');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Código');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_LANGUAGE_FORM'),'ADMIN_LANGUAGE_FORM_CODE',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.Language","field":"code","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_CODE'),'','Code:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_CODE'),'','Código:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_LANGUAGE_FORM'),'ADMIN_LANGUAGE_FORM_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.Language","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Estado:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Default');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Código');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_LANGUAGE_FORM'),'ADMIN_LANGUAGE_FORM_DEFAULT',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.Language","field":"defaultLang","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_DEFAULT'),'{"options":[{"value":true,"label":"Yes","default":true},{"value":false,"label":"No"}]}','Default:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_DEFAULT'),'{"options":[{"value":true,"label":"Sí","default":true},{"value":false,"label":"No"}]}','Defecto:','es',true,true,3,'',null);

INSERT INTO texts (default_text) VALUES ('Direction');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Direction');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Código');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_LANGUAGE_FORM'),'ADMIN_LANGUAGE_FORM_DIRECTION',@lastid,'SLT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.Language","field":"dir","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_DIRECTION'),'{"options":[{"value":"ltr","label":"Left-to-right","default":true},{"value":"rtl","label":"Right-to-left"}]}','Direction:','en',true,true,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_LANGUAGE_FORM_DIRECTION'),'{"options":[{"value":"ltr","label":"De izquierda a derecha","default":true},{"value":"rtl","label":"De derecha a izquierda"}]}','Dirección:','es',true,true,4,'',null);


-- Admin Language Page
INSERT INTO texts (default_text) VALUES ('Admin Language Page');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Language Page');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Página de idioma Admin');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_LANGUAGE_PAGE',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Page Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Page Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado de página');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_LANGUAGE_PAGE'),'ADMIN_LANGUAGE_PAGE_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_LANGUAGE_PAGE_HEADER'),'Languages','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_LANGUAGE_PAGE_HEADER'),'Idiomas','es',true,null);

INSERT INTO texts (default_text) VALUES ('Language Column 1');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Language Column 1');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Idioma Columna 1');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_LANGUAGE_PAGE'),'ADMIN_LANGUAGE_PAGE_COLUMN_1',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_LANGUAGE_PAGE_COLUMN_1'),'Title','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_LANGUAGE_PAGE_COLUMN_1'),'Título','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Language Column 2');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Language Column 2');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Idioma Columna 2');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_LANGUAGE_PAGE'),'ADMIN_LANGUAGE_PAGE_COLUMN_2',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_LANGUAGE_PAGE_COLUMN_2'),'Code','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_LANGUAGE_PAGE_COLUMN_2'),'Código','es',true,1,null);

INSERT INTO texts (default_text) VALUES ('Language Column 3');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Language Column 3');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Idioma Columna 3');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_LANGUAGE_PAGE'),'ADMIN_LANGUAGE_PAGE_COLUMN_3',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_LANGUAGE_PAGE_COLUMN_3'),'Status','en',true,2,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_LANGUAGE_PAGE_COLUMN_3'),'Estado','es',true,2,null);

INSERT INTO texts (default_text) VALUES ('Language Column 4');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Language Column 4');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Idioma Columna 4');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_LANGUAGE_PAGE'),'ADMIN_LANGUAGE_PAGE_COLUMN_4',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_LANGUAGE_PAGE_COLUMN_4'),'Default','en',true,3,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_LANGUAGE_PAGE_COLUMN_4'),'Defecto','es',true,3,null);

INSERT INTO texts (default_text) VALUES ('Language Column 5');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Language Column 5');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Idioma Columna 5');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_LANGUAGE_PAGE'),'ADMIN_LANGUAGE_PAGE_COLUMN_5',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_LANGUAGE_PAGE_COLUMN_5'),'Direction','en',true,4,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_LANGUAGE_PAGE_COLUMN_5'),'Dirección','es',true,4,null);



-- Service Crawler
INSERT INTO texts (default_text) VALUES ('Admin Service Crawler Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Service Crawler Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de rastreador de servicio de administración');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_SERVICE_CRAWLER_FORM',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Service name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Service name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre del Servicio');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM'),'ADMIN_SERVICE_CRAWLER_FORM_SERVICE_NAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.ServiceClass","field":"serviceName","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_SERVICE_NAME'),'','Service name:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_SERVICE_NAME'),'','Nombre del Servicio:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('API Version');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','API Version');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Versión de la API');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM'),'ADMIN_SERVICE_CRAWLER_FORM_API_VERSION',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.ServiceClass","field":"apiVersion","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_API_VERSION'),'','API Version:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_API_VERSION'),'','Versión de la API:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('APP Version');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','APP Version');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Version de aplicacion');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM'),'ADMIN_SERVICE_CRAWLER_FORM_APP_VERSION',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.ServiceClass","field":"appVersion","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_APP_VERSION'),'','APP Version:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_APP_VERSION'),'','Version de aplicacion:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Class name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Class name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de la clase');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM'),'ADMIN_SERVICE_CRAWLER_FORM_CLASS_NAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.ServiceClass","field":"className","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_CLASS_NAME'),'','Class name:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_CLASS_NAME'),'','Nombre de la clase:','es',true,true,3,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM'),'ADMIN_SERVICE_CRAWLER_FORM_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.ServiceClass","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Estado:','es',true,true,4,'',null);

INSERT INTO texts (default_text) VALUES ('Category');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Category');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Categoría');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM'),'ADMIN_SERVICE_CRAWLER_FORM_CATEGORY',@lastid,'SLT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.ServiceClass","field":"category","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_CATEGORY'),'{"options":[{"value":"PUBLIC","label":"PUBLIC","default":true},{"value":"MEMBER","label":"MEMBER"},{"value":"ADMIN","label":"ADMIN"},{"value":"SYSADMIN","label":"SYSADMIN"},{"value":"LOGIN","label":"LOGIN"}]}','Category:','en',true,true,5,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_CATEGORY'),'{"options":[{"value":"PUBLIC","label":"PUBLIC","default":true},{"value":"MEMBER","label":"MEMBER"},{"value":"ADMIN","label":"ADMIN"},{"value":"SYSADMIN","label":"SYSADMIN"},{"value":"LOGIN","label":"LOGIN"}]}','Categoría:','es',true,true,5,'',null);

INSERT INTO texts (default_text) VALUES ('Location');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Location');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ubicación');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM'),'ADMIN_SERVICE_CRAWLER_FORM_LOCATION',@lastid,'SLT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.ServiceClass","field":"location","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_LOCATION'),'{"options":[{"value":"LOCAL","label":"Local","default":true},{"value":"REMOTE","label":"Remote"}]}','Location:','en',true,true,6,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_SERVICE_CRAWLER_FORM_LOCATION'),'{"options":[{"value":"LOCAL","label":"Local","default":true},{"value":"REMOTE","label":"Remoto"}]}','Ubicación:','es',true,true,6,'',null);

-- Admin User Form
INSERT INTO texts (default_text) VALUES ('Admin User Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin User Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de usuario administrador');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_USER_FORM',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('First name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','First name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de pila');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_FORM'),'ADMIN_USER_FORM_FIRSTNAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"firstname","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_FIRSTNAME'),'','First name:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_FIRSTNAME'),'','Nombre de pila:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Middle name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Middle name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Segundo nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_FORM'),'ADMIN_USER_FORM_MIDDLENAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"middlename","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_MIDDLENAME'),'','Middle name:','en',true,false,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_MIDDLENAME'),'','Segundo nombre:','es',true,false,2,'',null);

INSERT INTO texts (default_text) VALUES ('Last name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Last name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Apellido');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_FORM'),'ADMIN_USER_FORM_LASTNAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"lastname","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_LASTNAME'),'','Last name:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_LASTNAME'),'','Apellido:','es',true,true,3,'',null);

INSERT INTO texts (default_text) VALUES ('Username');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Username');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de usuario');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_FORM'),'ADMIN_USER_FORM_USERNAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"username","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_USERNAME'),'','Username:','en',true,true,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_USERNAME'),'','Nombre de usuario:','es',true,true,4,'',null);

INSERT INTO texts (default_text) VALUES ('Email');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Email');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Email');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_FORM'),'ADMIN_USER_FORM_EMAIL',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"email","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_EMAIL'),'','Email:','en',true,true,5,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_EMAIL'),'','Email:','es',true,true,5,'',null);

INSERT INTO texts (default_text) VALUES ('Zipcode');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Zipcode');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Código postal');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_FORM'),'ADMIN_USER_FORM_ZIPCODE',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"zipcode","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_ZIPCODE'),'','Zipcode:','en',true,true,6,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_ZIPCODE'),'','Código postal:','es',true,true,6,'',null);

INSERT INTO texts (default_text) VALUES ('Language');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Language');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Idioma');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_FORM'),'ADMIN_USER_FORM_LANGUAGE',@lastid,'MDLSNG','select',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":{"language":{"clazz":"org.toasthub.core.system.model.Langauge","type":"Object"}},"method":"setLang","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_LANGUAGE'),'','Language:','en',true,true,7,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_LANGUAGE'),'','Idioma:','es',true,true,7,'',null);

INSERT INTO texts (default_text) VALUES ('Alternate Email');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Alternate Email');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Correo electrónico alternativo');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_FORM'),'ADMIN_USER_FORM_ALTERNATE_EMAIL',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"alternateEmail","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_ALTERNATE_EMAIL'),'','Alternate Email:','en',true,false,8,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_ALTERNATE_EMAIL'),'','Correo electrónico alternativo:','es',true,false,8,'',null);

INSERT INTO texts (default_text) VALUES ('Log Level');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Log Level');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nivel de registro');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_FORM'),'ADMIN_USER_FORM_LOGLEVEL',@lastid,'SLT','select',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"logLevel","type":"String"}',null); -- TRACE < DEBUG < INFO < WARN < ERROR < FATAL < OFF.
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_LOGLEVEL'),'{"options":[{"value":"OFF","label":"Off","default":true},{"value":"FATAL","label":"Fatal"},{"value":"ERROR","label":"Error"},{"value":"WARN","label":"Warning"},{"value":"INFO","label":"Info"},{"value":"DEBUG","label":"Debug"},{"value":"TRACE","label":"Trace"}]}','Log Level:','en',true,false,9,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_LOGLEVEL'),'{"options":[{"value":"OFF","label":"Apagado","default":true},{"value":"FATAL","label":"Fatal"},{"value":"ERROR","label":"Error"},{"value":"WARN","label":"Advertencia"},{"value":"INFO","label":"Información"},{"value":"DEBUG","label":"Depurar"},{"value":"TRACE","label":"Rastro"}]}','Nivel de registro:','es',true,false,9,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_FORM'),'ADMIN_USER_FORM_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,10,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Estado:','es',true,true,10,'',null);

INSERT INTO texts (default_text) VALUES ('Force password reset');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Force password reset');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Restablecer contraseña de la contraseña');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_FORM'),'ADMIN_USER_FORM_FORCERESET',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"forceReset","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_FORCERESET'),'{"options":[{"value":false,"label":"No","default":true},{"value":true,"label":"Yes"}]}','Force password reset:','en',true,false,11,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_USER_FORM_FORCERESET'),'{"options":[{"value":false,"label":"No","default":true},{"value":true,"label":"Yes"}]}','Restablecer contraseña de la contraseña:','es',true,false,11,'',null);



-- Admin Users Page
INSERT INTO texts (default_text) VALUES ('Admin User Page');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin User Page');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Página de usuario Admin');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_USER_PAGE',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Page Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Page Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado de página');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_PAGE'),'ADMIN_USER_PAGE_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_USER_PAGE_HEADER'),'Users','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_USER_PAGE_HEADER'),'Usuarios','es',true,null);

INSERT INTO texts (default_text) VALUES ('List Column 1');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 1');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 1');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_PAGE'),'ADMIN_USER_PAGE_COLUMN_1',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_USER_PAGE_COLUMN_1'),'First name','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_USER_PAGE_COLUMN_1'),'Nombre de pila','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('List Column 2');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 2');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 2');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_PAGE'),'ADMIN_USER_PAGE_COLUMN_2',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_USER_PAGE_COLUMN_2'),'Last name','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_USER_PAGE_COLUMN_2'),'Apellido','es',true,1,null);

INSERT INTO texts (default_text) VALUES ('List Column 3');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 3');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 3');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_PAGE'),'ADMIN_USER_PAGE_COLUMN_3',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_USER_PAGE_COLUMN_3'),'Username','en',true,2,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_USER_PAGE_COLUMN_3'),'Nombre de usuario','es',true,2,null);

INSERT INTO texts (default_text) VALUES ('List Column 4');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 4');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 4');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_PAGE'),'ADMIN_USER_PAGE_COLUMN_4',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_USER_PAGE_COLUMN_4'),'Email','en',true,3,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_USER_PAGE_COLUMN_4'),'Email','es',true,3,null);

INSERT INTO texts (default_text) VALUES ('List Column 5');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 5');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 5');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_USER_PAGE'),'ADMIN_USER_PAGE_COLUMN_5',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_USER_PAGE_COLUMN_5'),'Status','en',true,4,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_USER_PAGE_COLUMN_5'),'Estado','es',true,4,null);


-- Admin Service crawler Page
INSERT INTO texts (default_text) VALUES ('Admin Service Crawler Page');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Service Crawler Page');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Página del rastreador del servicio de administración');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_SERVICE_CRAWLER_PAGE',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Page Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Page Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado de página');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE'),'ADMIN_SERVICE_CRAWLER_PAGE_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE_HEADER'),'Services','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE_HEADER'),'Servicios','es',true,null);

INSERT INTO texts (default_text) VALUES ('List Column 1');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 1');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 1');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE'),'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_1',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_1'),'Category','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_1'),'Categoría','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('List Column 2');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 2');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 2');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE'),'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_2',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_2'),'Service name','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_2'),'Nombre del Servicio','es',true,1,null);

INSERT INTO texts (default_text) VALUES ('List Column 3');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 3');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 3');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE'),'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_3',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_3'),'API Version','en',true,2,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_3'),'Versión de la API','es',true,2,null);

INSERT INTO texts (default_text) VALUES ('List Column 4');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 4');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 4');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE'),'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_4',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_4'),'APP Version','en',true,3,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_4'),'Version de aplicacion','es',true,3,null);

INSERT INTO texts (default_text) VALUES ('List Column 5');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 5');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 5');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE'),'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_5',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_5'),'Status','en',true,4,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_SERVICE_CRAWLER_PAGE_COLUMN_5'),'Estado','es',true,4,null);


-- Client Domain
INSERT INTO texts (default_text) VALUES ('Admin Client Domain Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Client Domain Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de dominio del cliente Admin');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_CLIENT_DOMAIN_FORM',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM'),'ADMIN_CLIENT_DOMAIN_FORM_TITLE',@lastid,'GRP','text',0,0,null,'MAIN','MTITLE','{"clazz":"org.toasthub.core.system.model.ClientDomain","field":"title","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_TITLE'),'','Name:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_TITLE'),'','Nombre:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Default Text Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Text Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título de texto predeterminado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM'),'ADMIN_CLIENT_DOMAIN_FORM_TITLE_DEFAULT',@lastid,'TXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.system.model.ClientDomain","field":{"title":{"clazz":"org.toasthub.core.system.model.Text","field":"defaultText","type":"String"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_TITLE_DEFAULT'),'','Default Text:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_TITLE_DEFAULT'),'','Texto predeterminado:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Name Text');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Name Text');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Texto del título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM'),'ADMIN_CLIENT_DOMAIN_FORM_TITLE_TEXT',@lastid,'LTXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.system.model.ClientDomain","field":{"title":{"clazz":"org.toasthub.core.system.model.Text","field":{"langTexts":{"clazz":"org.toasthub.core.system.model.LangText","type":"Set","fields":[{"field":"text","type":"String"},{"field":"lang","type":"String"}]}}}},"method":"setTitleMtext","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_TITLE_TEXT'),'','Text:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_TITLE_TEXT'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('URL Domain');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','URL Domain');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Dominio de URL');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM'),'ADMIN_CLIENT_DOMAIN_FORM_URL_DOMAIN',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.ClientDomain","field":"URLDomain","type":"String"}','',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_URL_DOMAIN'),'','URL Domain:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_URL_DOMAIN'),'','Dominio de URL:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('APP Domain');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','API Domain');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Dominio APP');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM'),'ADMIN_CLIENT_DOMAIN_FORM_APP_DOMAIN',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.ClientDomain","field":"APPDomain","type":"String"}','',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_APP_DOMAIN'),'','APP Domain:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_APP_DOMAIN'),'','Dominio APP:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('APP Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','APP Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de la aplicación');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM'),'ADMIN_CLIENT_DOMAIN_FORM_APP_NAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.ClientDomain","field":"APPName","type":"String"}','',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_APP_NAME'),'','APP Name:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_APP_NAME'),'','Nombre de la aplicación:','es',true,true,3,'',null);

INSERT INTO texts (default_text) VALUES ('HTML Prefix');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','HTML Prefix');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Prefijo HTML');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM'),'ADMIN_CLIENT_DOMAIN_FORM_HTML_PREFIX',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.ClientDomain","field":"HTMLPrefix","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_HTML_PREFIX'),'','HTML Prefix:','en',true,true,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_HTML_PREFIX'),'','Prefijo HTML:','es',true,true,4,'',null);

INSERT INTO texts (default_text) VALUES ('Public Layout');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Public Layout');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Diseño público');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM'),'ADMIN_CLIENT_DOMAIN_FORM_PUBLIC_LAYOUT',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.ClientDomain","field":"publicLayout","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_PUBLIC_LAYOUT'),'','Public Layout:','en',true,true,5,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_PUBLIC_LAYOUT'),'','Diseño público:','es',true,true,5,'',null);

INSERT INTO texts (default_text) VALUES ('Admin Layout');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Layout');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Disposición del administrador');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM'),'ADMIN_CLIENT_DOMAIN_FORM_ADMIN_LAYOUT',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.ClientDomain","field":"adminLayout","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_ADMIN_LAYOUT'),'','Admin Layout:','en',true,true,6,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_ADMIN_LAYOUT'),'','Disposición del administrador:','es',true,true,6,'',null);

INSERT INTO texts (default_text) VALUES ('Member Layout');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Member Layout');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Disposición del Miembro');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM'),'ADMIN_CLIENT_DOMAIN_FORM_MEMBER_LAYOUT',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.ClientDomain","field":"memberLayout","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_MEMBER_LAYOUT'),'','Member Layout:','en',true,true,7,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_MEMBER_LAYOUT'),'','Disposición del Miembro:','es',true,true,7,'',null);

INSERT INTO texts (default_text) VALUES ('SysAdmin Layout');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','SysAdmin Layout');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Diseño de SysAdmin');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM'),'ADMIN_CLIENT_DOMAIN_FORM_SYSADMIN_LAYOUT',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.ClientDomain","field":"sysAdminLayout","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_SYSADMIN_LAYOUT'),'','SysAdmin Layout:','en',true,true,8,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_SYSADMIN_LAYOUT'),'','Diseño de SysAdmin:','es',true,true,8,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM'),'ADMIN_CLIENT_DOMAIN_FORM_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.ClientDomain","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_CLIENT_DOMAIN_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Estado:','es',true,true,4,'',null);

-- Admin Client Domain Page
INSERT INTO texts (default_text) VALUES ('Admin Client Domain Page');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Client Domain Page');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Página del dominio del cliente Admin');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_CLIENT_DOMAIN_PAGE',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Page Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Page Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado de página');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE'),'ADMIN_CLIENT_DOMAIN_PAGE_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE_HEADER'),'Client Domains','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE_HEADER'),'Dominios de cliente','es',true,null);

INSERT INTO texts (default_text) VALUES ('List Column 1');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 1');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 1');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE'),'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_1',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_1'),'Name','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_1'),'Nombre','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('List Column 2');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 2');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 2');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE'),'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_2',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_2'),'URL Domain','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_2'),'Dominio de URL','es',true,1,null);

INSERT INTO texts (default_text) VALUES ('List Column 3');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 3');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 3');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE'),'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_3',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_3'),'APP Domain','en',true,2,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_3'),'Dominio APP','es',true,2,null);

INSERT INTO texts (default_text) VALUES ('List Column 4');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 4');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 4');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE'),'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_4',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_4'),'APP Name','en',true,3,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_4'),'Nombre de la aplicación','es',true,3,null);

INSERT INTO texts (default_text) VALUES ('List Column 5');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 5');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 5');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE'),'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_5',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_5'),'Status','en',true,4,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_CLIENT_DOMAIN_PAGE_COLUMN_5'),'Estado','es',true,4,null);

-- Application ------------------------------------------------------------------
INSERT INTO texts (default_text) VALUES ('Admin Application Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Application Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de solicitud de administrador');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_APPLICATION_FORM',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_APPLICATION_FORM'),'ADMIN_APPLICATION_FORM_TITLE',@lastid,'GRP','text',0,0,null,'MAIN','MTITLE','{"clazz":"org.toasthub.core.system.model.Application","field":"title","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_APPLICATION_FORM_TITLE'),'','Name:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_APPLICATION_FORM_TITLE'),'','Nombre:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Default Text Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Text Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título de texto predeterminado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_APPLICATION_FORM'),'ADMIN_APPLICATION_FORM_TITLE_DEFAULT',@lastid,'TXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.system.model.Application","field":{"title":{"clazz":"org.toasthub.core.system.model.Text","field":"defaultText","type":"String"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_APPLICATION_FORM_TITLE_DEFAULT'),'','Default Text:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_APPLICATION_FORM_TITLE_DEFAULT'),'','Texto predeterminado:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Name Text');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Name Text');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Texto del título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_APPLICATION_FORM'),'ADMIN_APPLICATION_FORM_TITLE_TEXT',@lastid,'LTXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.system.model.Application","field":{"title":{"clazz":"org.toasthub.core.system.model.Text","field":{"langTexts":{"clazz":"org.toasthub.core.system.model.LangText","type":"Set","fields":[{"field":"text","type":"String"},{"field":"lang","type":"String"}]}}}},"method":"setTitleMtext","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_APPLICATION_FORM_TITLE_TEXT'),'','Text:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_APPLICATION_FORM_TITLE_TEXT'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Code');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Code');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Código');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_APPLICATION_FORM'),'ADMIN_APPLICATION_FORM_CODE',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.Application","field":"code","type":"String"}','',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_APPLICATION_FORM_CODE'),'','Code:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_APPLICATION_FORM_CODE'),'','Código:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_APPLICATION_FORM'),'ADMIN_APPLICATION_FORM_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.Application","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_APPLICATION_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_APPLICATION_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Estado:','es',true,true,2,'',null);

-- Admin Application Page
INSERT INTO texts (default_text) VALUES ('Admin Application Page');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Application Page');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Página de aplicación de administrador');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_APPLICATION_PAGE',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Page Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Page Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado de página');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_APPLICATION_PAGE'),'ADMIN_APPLICATION_PAGE_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_APPLICATION_PAGE_HEADER'),'Applications','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_APPLICATION_PAGE_HEADER'),'Aplicaciones','es',true,null);

INSERT INTO texts (default_text) VALUES ('List Column 1');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 1');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 1');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_APPLICATION_PAGE'),'ADMIN_APPLICATION_PAGE_COLUMN_1',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_APPLICATION_PAGE_COLUMN_1'),'Name','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_APPLICATION_PAGE_COLUMN_1'),'Nombre','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('List Column 2');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 2');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 2');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_APPLICATION_PAGE'),'ADMIN_APPLICATION_PAGE_COLUMN_2',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_APPLICATION_PAGE_COLUMN_2'),'Code','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_APPLICATION_PAGE_COLUMN_2'),'Código','es',true,1,null);

INSERT INTO texts (default_text) VALUES ('List Column 3');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 3');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 3');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_APPLICATION_PAGE'),'ADMIN_APPLICATION_PAGE_COLUMN_3',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_APPLICATION_PAGE_COLUMN_3'),'Status','en',true,2,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_APPLICATION_PAGE_COLUMN_3'),'Estado','es',true,2,null);

-- Permissions ----------------------------------------------------------------------
INSERT INTO texts (default_text) VALUES ('Admin Permission Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Permission Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de permiso de administración');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_PERMISSION_FORM',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_FORM'),'ADMIN_PERMISSION_FORM_TITLE',@lastid,'GRP','text',0,0,null,'MAIN','MTITLE','{"clazz":"org.toasthub.core.system.model.Permission","field":"title","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_TITLE'),'','Name:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_TITLE'),'','Nombre:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Default Text Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Text Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título de texto predeterminado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_FORM'),'ADMIN_PERMISSION_FORM_TITLE_DEFAULT',@lastid,'TXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.system.model.Permission","field":{"title":{"clazz":"org.toasthub.core.system.model.Text","field":"defaultText","type":"String"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_TITLE_DEFAULT'),'','Default Text:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_TITLE_DEFAULT'),'','Texto predeterminado:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Name Text');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Name Text');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Texto del título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_FORM'),'ADMIN_PERMISSION_FORM_TITLE_TEXT',@lastid,'LTXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.system.model.Permission","field":{"title":{"clazz":"org.toasthub.core.system.model.Text","field":{"langTexts":{"clazz":"org.toasthub.core.system.model.LangText","type":"Set","fields":[{"field":"text","type":"String"},{"field":"lang","type":"String"}]}}}},"method":"setTitleMtext","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_TITLE_TEXT'),'','Text:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_TITLE_TEXT'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Code');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Code');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Código');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_FORM'),'ADMIN_PERMISSION_FORM_CODE',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.Permission","field":"code","type":"String"}','',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_CODE'),'','Code:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_CODE'),'','Código:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Read');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Read');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Leer');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_FORM'),'ADMIN_PERMISSION_FORM_CAN_READ',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.Permission","field":"canRead","type":"Boolean"}','',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_CAN_READ'),'{"options":[{"value":true,"label":"Yes","default":true},{"value":false,"label":"No"}]}','Read:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_CAN_READ'),'{"options":[{"value":true,"label":"Sí","default":true},{"value":false,"label":"No"}]}','Leer:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Write');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Write');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Escribir');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_FORM'),'ADMIN_PERMISSION_FORM_CAN_WRITE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.Permission","field":"canWrite","type":"Boolean"}','',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_CAN_WRITE'),'{"options":[{"value":true,"label":"Yes","default":true},{"value":false,"label":"No"}]}','Write:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_CAN_WRITE'),'{"options":[{"value":true,"label":"Sí","default":true},{"value":false,"label":"No"}]}','Escribir:','es',true,true,3,'',null);

INSERT INTO texts (default_text) VALUES ('Application');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Application');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Solicitud');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_FORM'),'ADMIN_PERMISSION_FORM_APPLICATION',@lastid,'MDLSNG','select',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.Permission","field":{"application":{"clazz":"org.toasthub.core.system.model.Application","type":"Object"}},"method":"setApplicationId","type":"Object"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_APPLICATION'),'','Application:','en',true,true,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_APPLICATION'),'','Solicitud:','es',true,true,4,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_FORM'),'ADMIN_PERMISSION_FORM_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.Permission","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_PERMISSION_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Estado:','es',true,true,4,'',null);

-- Admin Permissions Page
INSERT INTO texts (default_text) VALUES ('Admin Permission Page');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Permission Page');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Página del permiso del administrador');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_PERMISSION_PAGE',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Page Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Page Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado de página');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_PAGE'),'ADMIN_PERMISSION_PAGE_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_PERMISSION_PAGE_HEADER'),'Permissions','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_PERMISSION_PAGE_HEADER'),'Permisos','es',true,null);

INSERT INTO texts (default_text) VALUES ('List Column 1');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 1');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 1');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_PAGE'),'ADMIN_PERMISSION_PAGE_COLUMN_1',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PERMISSION_PAGE_COLUMN_1'),'Name','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PERMISSION_PAGE_COLUMN_1'),'Nombre','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('List Column 2');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 2');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 2');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_PAGE'),'ADMIN_PERMISSION_PAGE_COLUMN_2',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PERMISSION_PAGE_COLUMN_2'),'Code','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PERMISSION_PAGE_COLUMN_2'),'Código','es',true,1,null);

INSERT INTO texts (default_text) VALUES ('List Column 3');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 3');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 3');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_PAGE'),'ADMIN_PERMISSION_PAGE_COLUMN_3',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PERMISSION_PAGE_COLUMN_3'),'Read','en',true,2,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PERMISSION_PAGE_COLUMN_3'),'Leer','es',true,2,null);

INSERT INTO texts (default_text) VALUES ('List Column 4');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 4');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 4');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_PAGE'),'ADMIN_PERMISSION_PAGE_COLUMN_4',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PERMISSION_PAGE_COLUMN_4'),'Write','en',true,3,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PERMISSION_PAGE_COLUMN_4'),'Escribir','es',true,3,null);

INSERT INTO texts (default_text) VALUES ('List Column 5');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 5');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 5');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_PERMISSION_PAGE'),'ADMIN_PERMISSION_PAGE_COLUMN_5',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PERMISSION_PAGE_COLUMN_5'),'Status','en',true,4,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_PERMISSION_PAGE_COLUMN_5'),'Estado','es',true,4,null);


-- Roles ----------------------------------------------------------------------
INSERT INTO texts (default_text) VALUES ('Admin Role Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Role Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de rol administrativo');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_ROLE_FORM',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_ROLE_FORM'),'ADMIN_ROLE_FORM_TITLE',@lastid,'GRP','text',0,0,null,'MAIN','MTITLE','{"clazz":"org.toasthub.core.system.model.Role","field":"title","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_TITLE'),'','Name:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_TITLE'),'','Nombre:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Default Text Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Text Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título de texto predeterminado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_ROLE_FORM'),'ADMIN_ROLE_FORM_TITLE_DEFAULT',@lastid,'TXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.system.model.Role","field":{"title":{"clazz":"org.toasthub.core.system.model.Text","field":"defaultText","type":"String"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_TITLE_DEFAULT'),'','Default Text:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_TITLE_DEFAULT'),'','Texto predeterminado:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Name Text');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Name Text');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Texto del título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_ROLE_FORM'),'ADMIN_ROLE_FORM_TITLE_TEXT',@lastid,'LTXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.system.model.Role","field":{"title":{"clazz":"org.toasthub.core.system.model.Text","field":{"langTexts":{"clazz":"org.toasthub.core.system.model.LangText","type":"Set","fields":[{"field":"text","type":"String"},{"field":"lang","type":"String"}]}}}},"method":"setTitleMtext","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_TITLE_TEXT'),'','Text:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_TITLE_TEXT'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Code');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Code');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Código');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_ROLE_FORM'),'ADMIN_ROLE_FORM_CODE',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.Role","field":"code","type":"String"}','',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_CODE'),'','Code:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_CODE'),'','Código:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_ROLE_FORM'),'ADMIN_ROLE_FORM_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.Role","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Estado:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Application');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Application');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Solicitud');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_ROLE_FORM'),'ADMIN_ROLE_FORM_APPLICATION',@lastid,'MDLSNG','select',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.Role","field":{"application":{"clazz":"org.toasthub.core.system.model.Application","type":"Object"}},"method":"setApplicationId","type":"Object"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_APPLICATION'),'','Application:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_APPLICATION'),'','Solicitud:','es',true,true,3,'',null);

INSERT INTO texts (default_text) VALUES ('Permissions');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Permissions');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Permisos');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_ROLE_FORM'),'ADMIN_ROLE_FORM_PERMISSIONS',@lastid,'MDLMLT','select',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.Role","field":{"permissions":{"clazz":"org.toasthub.core.system.model.Permission","type":"Object"}},"method":"setPermissionIds","type":"Object"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_PERMISSIONS'),'','Permissions:','en',true,false,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'ADMIN_ROLE_FORM_PERMISSIONS'),'','Solicitud:','es',true,false,4,'',null);


-- Admin Roles Page
INSERT INTO texts (default_text) VALUES ('Admin Role Page');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Role Page');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Página del permiso del administrador');
INSERT INTO page_name (name,text_id,category) VALUES ('ADMIN_ROLE_PAGE',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Page Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Page Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado de página');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_ROLE_PAGE'),'ADMIN_ROLE_PAGE_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_ROLE_PAGE_HEADER'),'Roles','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'ADMIN_ROLE_PAGE_HEADER'),'Permisos','es',true,null);

INSERT INTO texts (default_text) VALUES ('List Column 1');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 1');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 1');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_ROLE_PAGE'),'ADMIN_ROLE_PAGE_COLUMN_1',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_ROLE_PAGE_COLUMN_1'),'Name','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_ROLE_PAGE_COLUMN_1'),'Nombre','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('List Column 2');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 2');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 2');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_ROLE_PAGE'),'ADMIN_ROLE_PAGE_COLUMN_2',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_ROLE_PAGE_COLUMN_2'),'Code','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_ROLE_PAGE_COLUMN_2'),'Código','es',true,1,null);

INSERT INTO texts (default_text) VALUES ('List Column 3');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','List Column 3');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna de lista 3');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'ADMIN_ROLE_PAGE'),'ADMIN_ROLE_PAGE_COLUMN_3',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_ROLE_PAGE_COLUMN_3'),'Status','en',true,2,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'ADMIN_ROLE_PAGE_COLUMN_3'),'Estado','es',true,2,null);






-- Social Acquaintance Email Invite Form
INSERT INTO texts (default_text) VALUES ('Social Aquaintance Email Invite Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Aquaintance Area Email Invite Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Aquaintance Área Social Email Invite Form');
INSERT INTO page_name (name,text_id,category) VALUES ('SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM',@lastid,'MEMBER');

-- Form
INSERT INTO texts (default_text) VALUES ('Email Address');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Email Address');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Dirección de correo electrónico');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM_EMAIL',@lastid,'TXT','email',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.EmailInvite","field":"receiverEmail","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM_EMAIL'),'-Valid email address-','Email Address:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM_EMAIL'),'-Dirección de email válida-','Dirección de correo electrónico:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Message Input');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Message Input');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Mensaje de entrada');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM_MESSAGE',@lastid,'TXTA','textarea',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.EmailInvite","field":"message","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM_MESSAGE'),'-Join me on ToastHub-','Message:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM_MESSAGE'),'-Únete a mí en ToastHub-','Mensaje:','es',true,true,1,'',null);

-- Labels
INSERT INTO texts (default_text) VALUES ('Submit - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Submit - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de enviar');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_SUBMIT_BUTTON',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_SUBMIT_BUTTON'),'Submit','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_SUBMIT_BUTTON'),'Search es','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Reset - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Reset - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de reinicio');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_RESET_BUTTON',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_RESET_BUTTON'),'Reset','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_RESET_BUTTON'),'Reajustar','es',true,1,null);

-- Texts
INSERT INTO texts (default_text) VALUES ('Email Invite Successful');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Email Invite Successful');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Email Invitar Exitosa');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_SUCCESSFUL',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_SUCCESSFUL'),'Email Invite Successfully Sent','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_SUCCESSFUL'),'Invitar a un correo electrónico enviado con éxito','es',true,null);

INSERT INTO texts (default_text) VALUES ('Email Invite Failed');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Email Invite Failed');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Email invitación Falló');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FAILED',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FAILED'),'Email Invite Failed','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FAILED'),'Email Invitar Error','es',true,null);

-- Social Acquaintance Invite Form
INSERT INTO texts (default_text) VALUES ('Social Aquaintance Invite Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Aquaintance Area Invite Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Aquaintance Área Social Invite Form');
INSERT INTO page_name (name,text_id,category) VALUES ('SOCIAL_ACQUAINTANCE_INVITE_FORM',@lastid,'MEMBER');

-- Form
INSERT INTO texts (default_text) VALUES ('Receiver Id');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Receiver Id');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Receiver Id');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_INVITE_FORM_RECEIVER_ID',@lastid,'HDN','hidden',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.Invite","field":{"receiver":{"clazz":"org.toasthub.core.general.model.AppUser","field":"id","type":"Long"}},"type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM_RECEIVER_ID'),'','','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM_RECEIVER_ID'),'','','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Message Input');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Message Input');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Mensaje de entrada');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_INVITE_FORM_MESSAGE',@lastid,'TXTA','textarea',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.Invite","field":"message","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM_MESSAGE'),'-I would like to connect-','Message:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM_MESSAGE'),'-Me gustaría conectar-','Mensaje:','es',true,true,1,'',null);

-- Labels
INSERT INTO texts (default_text) VALUES ('Submit - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Submit - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de enviar');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_INVITE_SUBMIT_BUTTON',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_SUBMIT_BUTTON'),'Submit','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_SUBMIT_BUTTON'),'Search es','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Reset - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Reset - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de reinicio');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_INVITE_RESET_BUTTON',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_RESET_BUTTON'),'Reset','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_RESET_BUTTON'),'Reajustar','es',true,1,null);

-- Texts
INSERT INTO texts (default_text) VALUES ('Invite Successful');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Invite Successful');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Invitar Exitosa');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_INVITE_SUCCESSFUL',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_SUCCESSFUL'),'Invite Successfully Sent','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_SUCCESSFUL'),'Invitar a un correo electrónico enviado con éxito','es',true,null);

INSERT INTO texts (default_text) VALUES ('Invite Failed');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Invite Failed');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Invitación Falló');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_INVITE_FAILED',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FAILED'),'Invite Failed','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FAILED'),'Invitar Error','es',true,null);



-- Social Acquaintance
INSERT INTO texts (default_text) VALUES ('Social Aquaintance Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Aquaintance Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Aquaintance Área Social');
INSERT INTO page_name (name,text_id,category) VALUES ('SOCIAL_ACQUAINTANCE',@lastid,'MEMBER');

INSERT INTO texts (default_text) VALUES ('Main Tab Aquaintances');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab Aquaintances');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Principales Tab aquaintances');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE'),'SOCIAL_ACQUAINTANCE_MAIN_TAB_AQUAINTANCES',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_MAIN_TAB_AQUAINTANCES'),'Aquaintances','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_MAIN_TAB_AQUAINTANCES'),'Aquaintances','es',true,null);

INSERT INTO texts (default_text) VALUES ('Aquaintances Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Aquaintances Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Aquaintances Cabecera');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE'),'SOCIAL_ACQUAINTANCE_AQUAINTANCES_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_AQUAINTANCES_HEADER'),'My Aquaintances','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_AQUAINTANCES_HEADER'),'Mis aquaintances','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab Invites');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab Invites');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Invita ficha Principal');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE'),'SOCIAL_ACQUAINTANCE_MAIN_TAB_INVITES',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_MAIN_TAB_INVITES'),'Invites','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_MAIN_TAB_INVITES'),'Invita','es',true,null);

INSERT INTO texts (default_text) VALUES ('Invites Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Invites Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Invita Cabecera');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_ACQUAINTANCE'),'SOCIAL_ACQUAINTANCE_INVITES_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITES_HEADER'),'My Invites','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITES_HEADER'),'Invita Mi','es',true,null);

-- Social Activities
INSERT INTO texts (default_text) VALUES ('Social Activities Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Activities Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Actividades sociales Área');
INSERT INTO page_name (name,text_id,category) VALUES ('SOCIAL_ACTIVITIES',@lastid,'MEMBER');

-- Social Group
INSERT INTO texts (default_text) VALUES ('Social Group Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Group Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Área Grupo Social');
INSERT INTO page_name (name,text_id,category) VALUES ('SOCIAL_GROUP',@lastid,'MEMBER');

-- Form
INSERT INTO texts (default_text) VALUES ('Group Form - Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Group Form - Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de Grupo - Nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_NAME',@lastid,'TXT',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Group","field":"name","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_GROUP_FORM_NAME'),'','Name:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_GROUP_FORM_NAME'),'','Nombre:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Group Form - Description');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Group Form - Description');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario Group - Descripción');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_DESCRIPTION',@lastid,'TXT',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Group","field":"description","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_GROUP_FORM_DESCRIPTION'),'','Description:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_GROUP_FORM_DESCRIPTION'),'','Descripción:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Group Form - Access');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Group Form - Access');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de Grupo - Acceso');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_ACCESS',@lastid,'TXT',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Group","field":"access","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_GROUP_FORM_ACCESS'),'','Access:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_GROUP_FORM_ACCESS'),'','Acceso:','es',true,true,2,'',null);

-- Labels
INSERT INTO texts (default_text) VALUES ('Submit - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Submit - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de enviar');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_SUBMIT_BUTTON',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_GROUP_FORM_SUBMIT_BUTTON'),'Submit','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_GROUP_FORM_SUBMIT_BUTTON'),'Presentar','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Reset - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Reset - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de reinicio');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_RESET_BUTTON',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_GROUP_FORM_RESET_BUTTON'),'Reset','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_GROUP_FORM_RESET_BUTTON'),'Reajustar','es',true,1,null);

-- Texts
INSERT INTO texts (default_text) VALUES ('Form header modify group');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Form header modify group');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado Formulario modificar grupo');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_MODIFY_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_FORM_MODIFY_HEADER'),'Modify Group:','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_FORM_MODIFY_HEADER'),'Modificar grupo:','es',true,null);

INSERT INTO texts (default_text) VALUES ('Form header create group');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Form header create group');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado Formulario crear grupo');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_CREATE_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_FORM_CREATE_HEADER'),'Create new Group:','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_FORM_CREATE_HEADER'),'Crear un grupo nuevo:','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab My Groups');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab My Groups');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha Principal Mis Grupos');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_MAIN_TAB_MYGROUPS',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_MYGROUPS'),'My Groups','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_MYGROUPS'),'Mis Grupos','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab Joined Groups');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab Joined Groups');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha Principal Registrado Grupos');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_MAIN_TAB_JOINED',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_JOINED'),'Following','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_JOINED'),'Siguiente','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab Available Groups');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab Available Groups');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha Principal Grupos disponibles');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_MAIN_TAB_AVAILGROUPS',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_AVAILGROUPS'),'Available Groups','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_AVAILGROUPS'),'Grupos disponibles','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab Private Invites');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab Private Invites');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha Principal Invita privadas');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_MAIN_TAB_INVITES',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_INVITES'),'Invites','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_INVITES'),'Invita','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab Public Requests');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab Public Requests');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Solicitudes Principal Tab Públicas');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_MAIN_TAB_REQUESTS',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_REQUESTS'),'Requests','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_REQUESTS'),'Requests','es',true,null);

INSERT INTO texts (default_text) VALUES ('Groups Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Groups Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Solicitudes Principal Tab Públicas');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_GROUPS_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_GROUPS_HEADER'),'My Groups','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_GROUP_GROUPS_HEADER'),'Mis Grupos','es',true,null);


-- Social Library
INSERT INTO texts (default_text) VALUES ('Social Library Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Library Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Biblioteca Área Social');
INSERT INTO page_name (name,text_id,category) VALUES ('SOCIAL_LIBRARY',@lastid,'MEMBER');

-- Form
INSERT INTO texts (default_text) VALUES ('Library Form - Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Library Form - Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario Biblioteca - Nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_FORM_NAME',@lastid,'TXT',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.Library","field":"name","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_LIBRARY_FORM_NAME'),'','Name:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_LIBRARY_FORM_NAME'),'','Nombre:','es',true,true,0,'',null);

-- Labels
INSERT INTO texts (default_text) VALUES ('Submit - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Submit - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de enviar');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_FORM_SUBMIT_BUTTON',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_LIBRARY_FORM_SUBMIT_BUTTON'),'Submit','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_LIBRARY_FORM_SUBMIT_BUTTON'),'Presentar','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Reset - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Reset - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de reinicio');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_FORM_RESET_BUTTON',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_LIBRARY_FORM_RESET_BUTTON'),'Reset','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'SOCIAL_LIBRARY_FORM_RESET_BUTTON'),'Reajustar','es',true,1,null);

-- Texts
INSERT INTO texts (default_text) VALUES ('Library form - modify header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Library form - modify header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Forma Biblioteca - modificar cabecera');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_FORM_MODIFY_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_LIBRARY_FORM_MODIFY_HEADER'),'Modify directory:','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_LIBRARY_FORM_MODIFY_HEADER'),'Modificar directorio:','es',true,null);

INSERT INTO texts (default_text) VALUES ('Library form - create header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Library form - create header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Forma Biblioteca - crear cabecera');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_FORM_CREATE_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_LIBRARY_FORM_CREATE_HEADER'),'Create directory:','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_LIBRARY_FORM_CREATE_HEADER'),'Crear directorio:','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab my directories and files');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab my directories and files');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha Principal mis directorios y archivos');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_MAIN_TAB_MINE',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_LIBRARY_MAIN_TAB_MINE'),'My Directories and Files','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_LIBRARY_MAIN_TAB_MINE'),'Mis directorios y archivos','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab shared directories and files');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab shared directories and files');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Tab principal directorios y archivos compartidos');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_MAIN_TAB_SHARED',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_LIBRARY_MAIN_TAB_SHARED'),'Shared Directories and Files','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_LIBRARY_MAIN_TAB_SHARED'),'Directorios y archivos compartidos','es',true,null);

INSERT INTO texts (default_text) VALUES ('Library Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Library Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Biblioteca de Cabecera');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_LIBRARY_HEADER'),'File and Image Library','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'SOCIAL_LIBRARY_HEADER'),'Archivo y Biblioteca de imágenes','es',true,null);


-- Social Event
INSERT INTO texts (default_text) VALUES ('Social Event Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Event Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Área para eventos sociales');
INSERT INTO page_name (name,text_id,category) VALUES ('SOCIAL_EVENT',@lastid,'MEMBER');

-- Form
INSERT INTO texts (default_text) VALUES ('Event Form - Message');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form - Message');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha evento - Mensaje');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_MESSAGE',@lastid,'TXT','textarea',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Event","field":"message","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_MESSAGE'),'What do you see?','Message','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_MESSAGE'),'¿Que ves?','Mensaje','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Event Form - Type Code');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form - Type Code');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha Evento - Código Tipo');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_TYPE_CODE',@lastid,'TXT','hidden',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Event","field":"code","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_TYPE_CODE'),'','Title','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_TYPE_CODE'),'','Título','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Event Form - Latitude');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form - Latitude');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha evento - Latitud');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_LATITUDE',@lastid,'TXTDOUBLE','hidden',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Event","field":"latitude","type":"Double"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_LATITUDE'),'','Latitude','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_LATITUDE'),'','Latitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Event Form - Longitude');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form - Longitude');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha evento - Longitud');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_LONGITUDE',@lastid,'TXTDOUBLE','hidden',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Event","field":"longitude","type":"Double"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_LONGITUDE'),'','Longitude','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_LONGITUDE'),'','Longitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Event Form - Altitude');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form - Altitude');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha evento - Altitud');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_ALTITUDE',@lastid,'TXTDOUBLE','hidden',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Event","field":"altitude","type":"Double"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_ALTITUDE'),'','Altitude','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_ALTITUDE'),'','Altitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Event Form - Accuracy');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form - Accuracy');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha evento - Exactitud');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_ACCURACY',@lastid,'TXTFLOAT','hidden',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Event","field":"accuracy","type":"Float"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_ACCURACY'),'','Accuracy','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_ACCURACY'),'','Exactitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Event Form - Provider');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form -Provider');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha evento - Proveedor');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_PROVIDER',@lastid,'TXT','hidden',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Event","field":"provider","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_PROVIDER'),'','Provider','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_PROVIDER'),'','Proveedor','es',true,false,0,'',null);


-- Social Location
INSERT INTO texts (default_text) VALUES ('Social Location Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Location Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Social Área de Localización');
INSERT INTO page_name (name,text_id,category) VALUES ('SOCIAL_LOCATION',@lastid,'MEMBER');

-- Form
INSERT INTO texts (default_text) VALUES ('Location Form - Provider');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Location Form -Provider');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Localización Formulario - Proveedor');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_LOCATION'),'SOCIAL_LOCATION_FORM_PROVIDER',@lastid,'TXT','hidden',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Location","field":"provider","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_PROVIDER'),'','Provider','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_PROVIDER'),'','Proveedor','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Location Form - Latitude');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Location Form - Latitude');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Localización Formulario - Latitud');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_LOCATION'),'SOCIAL_LOCATION_FORM_LATITUDE',@lastid,'TXTDOUBLE','hidden',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Location","field":"latitude","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_LATITUDE'),'','Latitude','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_LATITUDE'),'','Latitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Location Form - Longitude');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Location Form - Longitude');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Localización Formulario - Longitud');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_LOCATION'),'SOCIAL_LOCATION_FORM_LONGITUDE',@lastid,'TXTDOUBLE','hidden',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Location","field":"longitude","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_LONGITUDE'),'','Longitude','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_LONGITUDE'),'','Longitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Location Form - Altitude');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Location Form - Altitude');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Localización Formulario - Altitud');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_LOCATION'),'SOCIAL_LOCATION_FORM_ALTITUDE',@lastid,'TXTDOUBLE','hidden',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Location","field":"altitude","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_ALTITUDE'),'','Altitude','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_ALTITUDE'),'','Altitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Location Form - Accuracy');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Location Form - Accuracy');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Localización Formulario - Exactitud');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'SOCIAL_LOCATION'),'SOCIAL_LOCATION_FORM_ACCURACY',@lastid,'TXTFLOAT','hidden',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.social.model.Location","field":"accuracy","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_ACCURACY'),'','Accuracy','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_ACCURACY'),'','Exactitud','es',true,false,0,'',null);


-- ------------------- Menu Form
-- 
INSERT INTO texts (default_text) VALUES ('Menu form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Menu form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de Menú');
INSERT INTO page_name (name,text_id,category) VALUES ('APP_MENU_FORM',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Code');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Code');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Código');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_FORM'),'APP_MENU_FORM_CODE',@lastid,'TXT',2,25,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.Menu","field":"code","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_CODE'),'','Code:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_CODE'),'','Código:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_FORM'),'APP_MENU_FORM_TITLE',@lastid,'GRP','text',0,0,null,'MAIN','MTITLE','{"clazz":"org.toasthub.core.general.model.Menu","field":"title","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_TITLE'),'','Title:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_TITLE'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Default Text Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Default Text Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título de texto predeterminado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_FORM'),'APP_MENU_FORM_TITLE_DEFAULT',@lastid,'TXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.Menu","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":"defaultText","type":"String"}},"method":"setTitleDefaultText","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_TITLE_DEFAULT'),'','Default Text:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_TITLE_DEFAULT'),'','Texto predeterminado:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Title Text');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title Text');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Texto del título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_FORM'),'APP_MENU_FORM_TITLE_TEXT',@lastid,'LTXT','text',0,0,null,'MTITLE',null,'{"clazz":"org.toasthub.core.general.model.Menu","field":{"title":{"clazz":"org.toasthub.core.general.model.Text","field":{"langTexts":{"clazz":"org.toasthub.core.general.model.LangText","type":"Set","fields":[{"field":"text","type":"String"},{"field":"lang","type":"String"}]}}}},"method":"setTitleMtext","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_TITLE_TEXT'),'','Text:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_TITLE_TEXT'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('API Version');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','API Version');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Versión API');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_FORM'),'APP_MENU_FORM_APIVERSION',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.Menu","field":"apiVersion","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_APIVERSION'),'','API Version:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_APIVERSION'),'','Versión de la API:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('APP Version');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','APP Version');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Versión APP');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_FORM'),'APP_MENU_FORM_APPVERSION',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.Menu","field":"appVersion","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_APPVERSION'),'','APP Version:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_APPVERSION'),'','Version de aplicacion:','es',true,true,3,'',null);

INSERT INTO texts (default_text) VALUES ('Category');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Category');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Categoría');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_FORM'),'APP_MENU_FORM_CATEGORY',@lastid,'SLT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.Menu","field":"category","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_CATEGORY'),'{"options":[{"value":"PUBLIC","label":"PUBLIC","default":true},{"value":"MEMBER","label":"MEMBER"},{"value":"ADMIN","label":"ADMIN"},{"value":"SYSADMIN","label":"SYSADMIN"},{"value":"LOGIN","label":"LOGIN"}]}','Category:','en',true,true,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_CATEGORY'),'{"options":[{"value":"PUBLIC","label":"PUBLIC","default":true},{"value":"MEMBER","label":"MEMBER"},{"value":"ADMIN","label":"ADMIN"},{"value":"SYSADMIN","label":"SYSADMIN"},{"value":"LOGIN","label":"LOGIN"}]}','Categoría:','es',true,true,4,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_FORM'),'APP_MENU_FORM_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.Menu","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,6,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Nombre deila:','es',true,true,6,'',null);


-- ---- Menu Item Form
INSERT INTO texts (default_text) VALUES ('Menu item form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Menu item form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de elemento de menú');
INSERT INTO page_name (name,text_id,category) VALUES ('APP_MENU_ITEM_FORM',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Code');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Code');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Código');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_ITEM_FORM'),'APP_MENU_ITEM_FORM_CODE',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.MenuItem","field":"code","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_CODE'),'','Code:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_CODE'),'','Código:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_ITEM_FORM'),'APP_MENU_ITEM_FORM_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.general.model.MenuItem","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Nombre deila:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Values');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Values');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Valores');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_ITEM_FORM'),'APP_MENU_ITEM_FORM_VALUES',@lastid,'GRP','text',0,0,null,'MAIN','MVALUES','{"clazz":"org.toasthub.core.general.model.MenuItem","field":{"values":{"clazz":"org.toasthub.core.general.model.MenuItemValue","type":"Set"}},"method":"setMValues","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_VALUES'),'','Values:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_VALUES'),'','Valores:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Value');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Value');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Valor');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_ITEM_FORM'),'APP_MENU_ITEM_FORM_VALUE',@lastid,'MTXT','text',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.MenuItem","field":"value","type":"String","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_VALUE'),'','Value:','en',true,false,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_VALUE'),'','Valor:','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Href');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Href');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Href');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_ITEM_FORM'),'APP_MENU_ITEM_FORM_HREF',@lastid,'MTXT','text',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.MenuItem","field":"href","type":"String","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_HREF'),'','Href:','en',true,false,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_HREF'),'','Href:','es',true,false,1,'',null);

INSERT INTO texts (default_text) VALUES ('Image');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Image');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Imagen');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_ITEM_FORM'),'APP_MENU_ITEM_FORM_IMAGE',@lastid,'MTXT','text',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.MenuItem","field":"image","type":"String","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_IMAGE'),'','Image:','en',true,false,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_IMAGE'),'','Imagen:','es',true,false,2,'',null);

INSERT INTO texts (default_text) VALUES ('Rendered');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Rendered');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Rendido');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_ITEM_FORM'),'APP_MENU_ITEM_FORM_RENDERED',@lastid,'MBLN','radioH',0,0,null,'MVALUES',null,'{"clazz":"org.toasthub.core.general.model.MenuItem","field":"rendered","type":"Boolean","method":"setMValues"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_RENDERED'),'{"options":[{"value":true,"label":"True","default":true},{"value":false,"label":"False"}]}','Rendered:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'APP_MENU_ITEM_FORM_RENDERED'),'{"options":[{"value":true,"label":"Cierto","default":true},{"value":false,"label":"Falso"}]}','Rendido:','es',true,true,3,'',null);



-- ------------------- Menu Page
INSERT INTO texts (default_text) VALUES ('Menu page');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Menu page');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Página de menú');
INSERT INTO page_name (name,text_id,category) VALUES ('APP_MENU_PAGE',@lastid,'ADMIN');

INSERT INTO texts (default_text) VALUES ('Menu Page - Page header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Menu Page - Page header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Página de menú - Encabezado de página');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'APP_MENU_PAGE'),'APP_MENU_PAGE_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'APP_MENU_PAGE_HEADER'),'Menus','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'APP_MENU_PAGE_HEADER'),'Menús','es',true,null);




-- User profile Form
INSERT INTO texts (default_text) VALUES ('User Profile Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User Profile Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de perfil de usuario');
INSERT INTO page_name (name,text_id,category) VALUES ('USER_PROFILE_FORM',@lastid,'MEMBER');

INSERT INTO texts (default_text) VALUES ('First name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','First name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de pila');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'USER_PROFILE_FORM'),'USER_PROFILE_FORM_FIRSTNAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"firstname","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_FIRSTNAME'),'','First name:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_FIRSTNAME'),'','Nombre de pila:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Middle name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Middle name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Segundo nombre');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'USER_PROFILE_FORM'),'USER_PROFILE_FORM_MIDDLENAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"middlename","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_MIDDLENAME'),'','Middle name:','en',true,false,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_MIDDLENAME'),'','Segundo nombre:','es',true,false,2,'',null);

INSERT INTO texts (default_text) VALUES ('Last name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Last name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Apellido');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'USER_PROFILE_FORM'),'USER_PROFILE_FORM_LASTNAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"lastname","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_LASTNAME'),'','Last name:','en',true,true,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_LASTNAME'),'','Apellido:','es',true,true,3,'',null);

INSERT INTO texts (default_text) VALUES ('Username');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Username');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de usuario');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'USER_PROFILE_FORM'),'USER_PROFILE_FORM_USERNAME',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"username","type":"String"}','{"modify":"disabled"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_USERNAME'),'','Username:','en',true,true,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_USERNAME'),'','Nombre de usuario:','es',true,true,4,'',null);

INSERT INTO texts (default_text) VALUES ('Email');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Email');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Email');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'USER_PROFILE_FORM'),'USER_PROFILE_FORM_EMAIL',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"email","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_EMAIL'),'','Email:','en',true,true,5,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_EMAIL'),'','Email:','es',true,true,5,'',null);

INSERT INTO texts (default_text) VALUES ('Zipcode');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Zipcode');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Código postal');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,optional_params,created) VALUES((SELECT id FROM page_name WHERE name = 'USER_PROFILE_FORM'),'USER_PROFILE_FORM_ZIPCODE',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"zipcode","type":"String"}',null,null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_ZIPCODE'),'','Zipcode:','en',true,true,6,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_ZIPCODE'),'','Código postal:','es',true,true,6,'',null);

INSERT INTO texts (default_text) VALUES ('Language');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Language');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Idioma');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'USER_PROFILE_FORM'),'USER_PROFILE_FORM_LANGUAGE',@lastid,'SLT','text',0,0,null,'MAIN',null,'{"clazz":"org.toasthub.core.system.model.User","field":"lang","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_LANGUAGE'),'{"localList":"toastHub.languages"}','Language:','en',true,true,7,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'USER_PROFILE_FORM_LANGUAGE'),'{"localList":"toastHub.languages"}','Idioma:','es',true,true,7,'',null);

-- User profile Page
INSERT INTO texts (default_text) VALUES ('User Profile Page');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User Profile Page');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Página de perfil de usuario');
INSERT INTO page_name (name,text_id,category) VALUES ('USER_PROFILE_PAGE',@lastid,'MEMBER');

INSERT INTO texts (default_text) VALUES ('Page Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Page Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado de página');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'USER_PROFILE_PAGE'),'USER_PROFILE_PAGE_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'USER_PROFILE_PAGE_HEADER'),'My Profile','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'USER_PROFILE_PAGE_HEADER'),'Mi perfil','es',true,null);




-- service classes
-- admin
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('ADMIN_SVC','1.0','1.0','org.toasthub.admin.svc.AdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('MENU_SVC','1.0','1.0','org.toasthub.admin.svc.MenuAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('APPPAGE_SVC','1.0','1.0','org.toasthub.admin.preferences.svc.AppPageAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('FORM_SVC','1.0','1.0','org.toasthub.admin.svc.FormAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('LANGUAGE_SVC','1.0','1.0','org.toasthub.admin.svc.LanguageAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('SYSPAGE_SVC','1.0','1.0','org.toasthub.admin.svc.SysPageSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('USERS_SVC','1.0','1.0','org.toasthub.admin.system.svc.UsersAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('MAIL_SVC','1.0','1.0','org.toasthub.core.general.svc.MailSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('PAGE_OPTIONS_SVC','1.0','1.0','org.toasthub.core.admin.svc.PageOptionsSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('LOGOUT_SVC','1.0','1.0','org.toasthub.core.general.svc.LogOutSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('CATEGORY_SVC','1.0','1.0','com.toasthub.admin.svc.CategoryAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('STATUS_SVC','1.0','1.0','com.toasthub.admin.svc.StatusAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('WORKFLOW_SVC','1.0','1.0','com.toasthub.admin.svc.WorkFlowSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('ROLES_SVC','1.0','1.0','org.toasthub.admin.system.svc.RoleAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('PERMISSIONS_SVC','1.0','1.0','org.toasthub.admin.system.svc.PermissionAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('APPFORMFIELD_SVC','1.0','1.0','org.toasthub.admin.preferences.svc.AppFormFieldAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('APPLABEL_SVC','1.0','1.0','org.toasthub.admin.preferences.svc.AppLabelAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('APPOPTION_SVC','1.0','1.0','org.toasthub.admin.preferences.svc.AppOptionAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('APPTEXT_SVC','1.0','1.0','org.toasthub.admin.preferences.svc.AppTextAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('SERVICE_CRAWLER_SVC','1.0','1.0','org.toasthub.admin.svc.ServiceCrawlerAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('CLIENT_DOMAIN_SVC','1.0','1.0','org.toasthub.admin.system.svc.ClientDomainAdminSvc','ADMIN','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('APPLICATION_SVC','1.0','1.0','org.toasthub.admin.system.svc.ApplicationAdminSvc','ADMIN','LOCAL',null);

-- public
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('PUBLIC_SVC','1.0','1.0','org.toasthub.core.general.svc.PublicSvc','PUBLIC','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('PUBLIC_MENU_SVC','1.0','1.0','org.toasthub.core.general.svc.PublicMenuSvc','PUBLIC','LOCAL',null);

-- member
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('MEMBER_SVC','1.0','1.0','org.toasthub.core.general.svc.MemberSvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('ACQUAINTANCE_SVC','1.0','1.0','org.toasthub.social.svc.AcquaintanceSvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('ATTACHMENT_SVC','1.0','1.0','org.toasthub.social.svc.AttachmentSvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('DASHBOARD_SVC','1.0','1.0','org.toasthub.social.svc.DashBoardSvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('EVENT_SVC','1.0','1.0','org.toasthub.social.svc.EventSvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('GROUP_SVC','1.0','1.0','org.toasthub.social.svc.GroupSvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('NOTE_SVC','1.0','1.0','org.toasthub.social.svc.NoteSvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('WATCH_SVC','1.0','1.0','org.toasthub.social.svc.WatchSvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('ACTIVITY_SVC','1.0','1.0','org.toasthub.social.svc.ActivitySvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('CHAT_SVC','1.0','1.0','org.toasthub.social.svc.ChatSvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('LIBRARY_SVC','1.0','1.0','org.toasthub.social.svc.LibrarySvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('MESSAGE_SVC','1.0','1.0','org.toasthub.social.svc.MessageSvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('LOCATION_SVC','1.0','1.0','org.toasthub.social.svc.LocationSvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('LOGOUT_SVC','1.0','1.0','org.toasthub.core.general.svc.LogOutSvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('CATEGORY_SVC','1.0','1.0','com.toasthub.core.general.svc.CategorySvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('STATUS_SVC','1.0','1.0','com.toasthub.core.general.svc.StatusSvc','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('WORKFLOW_SVC','1.0','1.0','com.toasthub.core.general.svc.WorkFlowSvc','MEMBER','LOCAL',null);

-- sys admin
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('SYSADMIN_SVC','1.0','1.0','org.toasthub.sysadmin.svc.SysAdminSvc','SYSADMIN','LOCAL',null);

-- login
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('LOGIN_SVC','1.0','1.0','org.toasthub.core.general.svc.UserManagerSvc','LOGIN','LOCAL',null);
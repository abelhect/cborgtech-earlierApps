INSERT INTO texts (default_text) VALUES ('CThreat Public Menu Right');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','CThreat Public Menu Right');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','CThreat Menú público derecho');

INSERT INTO menus (name,category,title_id,api_version,app_version,created) VALUES ('CTHREAT_PUBLIC_MENU_RIGHT','PUBLIC',@lastid,'1.0','1.0',null);
INSERT INTO menu_items (menu_id,role_id,name,sort_order,created) VALUES ((SELECT id FROM menus WHERE name = 'CTHREAT_PUBLIC_MENU_RIGHT'),(SELECT id FROM app_roles WHERE role_name = 'viewer' and domain = 'toasthub-general'),'SERVICES',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'SERVICES' and menus.name = 'CTHREAT_PUBLIC_MENU_RIGHT'),'Services','#services','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'SERVICES' and menus.name = 'CTHREAT_PUBLIC_MENU_RIGHT'),'Servicios','#services?lang=es','es',true,null);
INSERT INTO menu_items (menu_id,role_id,name,sort_order,created) VALUES ((SELECT id FROM menus WHERE name = 'CTHREAT_PUBLIC_MENU_RIGHT'),(SELECT id FROM app_roles WHERE role_name = 'viewer' and domain = 'toasthub-general'),'PORTFOLIO',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'PORTFOLIO' and menus.name = 'CTHREAT_PUBLIC_MENU_RIGHT'),'Portfolio','#portfolio','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'PORTFOLIO' and menus.name = 'CTHREAT_PUBLIC_MENU_RIGHT'),'Portafolio','#portfolio?lang=es','es',true,null);
INSERT INTO menu_items (menu_id,role_id,name,sort_order,created) VALUES ((SELECT id FROM menus WHERE name = 'CTHREAT_PUBLIC_MENU_RIGHT'),(SELECT id FROM app_roles WHERE role_name = 'viewer' and domain = 'toasthub-general'),'ABOUT',2,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'ABOUT' and menus.name = 'CTHREAT_PUBLIC_MENU_RIGHT'),'About','#about','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'ABOUT' and menus.name = 'CTHREAT_PUBLIC_MENU_RIGHT'),'Acerca de','#about?lang=es','es',true,null);
INSERT INTO menu_items (menu_id,role_id,name,sort_order,created) VALUES ((SELECT id FROM menus WHERE name = 'CTHREAT_PUBLIC_MENU_RIGHT'),(SELECT id FROM app_roles WHERE role_name = 'viewer' and domain = 'toasthub-general'),'TEAM',3,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'TEAM' and menus.name = 'CTHREAT_PUBLIC_MENU_RIGHT'),'Team','#team','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'TEAM' and menus.name = 'CTHREAT_PUBLIC_MENU_RIGHT'),'Equipo','#team?lang=es','es',true,null);
INSERT INTO menu_items (menu_id,role_id,name,sort_order,created) VALUES ((SELECT id FROM menus WHERE name = 'CTHREAT_PUBLIC_MENU_RIGHT'),(SELECT id FROM app_roles WHERE role_name = 'viewer' and domain = 'toasthub-general'),'CONTACT',4,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'CONTACT' and menus.name = 'CTHREAT_PUBLIC_MENU_RIGHT'),'Contact','#contact','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'CONTACT' and menus.name = 'CTHREAT_PUBLIC_MENU_RIGHT'),'Contacto','#contact?lang=es','es',true,null);
INSERT INTO menu_items (menu_id,role_id,name,sort_order,created) VALUES ((SELECT id FROM menus WHERE name = 'CTHREAT_PUBLIC_MENU_RIGHT'),(SELECT id FROM app_roles WHERE role_name = 'viewer' and domain = 'toasthub-general'),'LOGIN',5,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'LOGIN' and menus.name = 'CTHREAT_PUBLIC_MENU_RIGHT'),'Login','/login/login.html','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'LOGIN' and menus.name = 'CTHREAT_PUBLIC_MENU_RIGHT'),'Iniciar sesión','/login/login.html?lang=es','es',true,null);

INSERT INTO texts (default_text) VALUES ('CThreat Member Menu Right');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','CThreat Member Menu Right');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','CThreat Menú Menú Derecho');

INSERT INTO menus (name,category,title_id,api_version,app_version,created) VALUES ('CTHREAT_MEMBER_MENU_RIGHT','MEMBER',@lastid,'1.0','1.0',null);
INSERT INTO menu_items (menu_id,role_id,name,sort_order,created) VALUES ((SELECT id FROM menus WHERE name = 'CTHREAT_MEMBER_MENU_RIGHT'),(SELECT id FROM app_roles WHERE role_name = 'viewer' and domain = 'toasthub-general'),'ACQUAINTANCES',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,image,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'ACQUAINTANCES' and menus.name = 'CTHREAT_MEMBER_MENU_RIGHT'),'Acquaintances','#acquaintances','acquaintances.jpg','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,image,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'ACQUAINTANCES' and menus.name = 'CTHREAT_MEMBER_MENU_RIGHT'),'Conocidos','#acquaintances?lang=es','acquaintances.jpg','es',true,null);
INSERT INTO menu_items (menu_id,role_id,name,sort_order,created) VALUES ((SELECT id FROM menus WHERE name = 'CTHREAT_MEMBER_MENU_RIGHT'),(SELECT id FROM app_roles WHERE role_name = 'viewer' and domain = 'toasthub-general'),'EVENTS',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,image,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'EVENTS' and menus.name = 'CTHREAT_MEMBER_MENU_RIGHT'),'Events','#events','events.jpg','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,image,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'EVENTS' and menus.name = 'CTHREAT_MEMBER_MENU_RIGHT'),'Eventos','#events?lang=es','events.jpg','es',true,null);

INSERT INTO texts (default_text) VALUES ('CThreat Member Menu Left');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','CThreat Member Menu Left');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','CThreat Menú Menú Derecho');

INSERT INTO menus (name,category,title_id,api_version,app_version,created) VALUES ('CTHREAT_MEMBER_MENU_LEFT','MEMBER',@lastid,'1.0','1.0',null);
INSERT INTO menu_items (menu_id,role_id,name,sort_order,created) VALUES ((SELECT id FROM menus WHERE name = 'CTHREAT_MEMBER_MENU_LEFT'),(SELECT id FROM app_roles WHERE role_name = 'viewer' and domain = 'toasthub-general'),'MAPVIEW',0,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'MAPVIEW' and menus.name = 'CTHREAT_MEMBER_MENU_LEFT'),'Map view','#mapview','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'MAPVIEW' and menus.name = 'CTHREAT_MEMBER_MENU_LEFT'),'Vista del mapa','#mapview?lang=es','es',true,null);
INSERT INTO menu_items (menu_id,role_id,name,sort_order,created) VALUES ((SELECT id FROM menus WHERE name = 'CTHREAT_MEMBER_MENU_LEFT'),(SELECT id FROM app_roles WHERE role_name = 'viewer' and domain = 'toasthub-general'),'TECHSUPPORT',1,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'TECHSUPPORT' and menus.name = 'CTHREAT_MEMBER_MENU_LEFT'),'Tech Support','#techsupport','en',true,null);
INSERT INTO menu_item_values (menu_item_id,menu_value,href,lang,rendered,created) VALUES ((SELECT menu_items.id FROM menu_items JOIN menus on menu_items.menu_id = menus.id WHERE menu_items.name = 'TECHSUPPORT' and menus.name = 'CTHREAT_MEMBER_MENU_LEFT'),'Apoyo técnico','#techsupport?lang=es','es',true,null);

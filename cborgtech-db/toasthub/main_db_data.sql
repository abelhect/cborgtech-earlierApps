-- applications
INSERT INTO texts (default_text) VALUES ('Cborgcust');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Cborgcust');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Cborgcust');
INSERT INTO application (code,title_id,created) VALUES ('APP_CBORGCUST',@lastid,null);

INSERT INTO texts (default_text) VALUES ('Bugdog');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Bugdog');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Bugdog');
INSERT INTO application (code,title_id,created) VALUES ('APP_BUGDOG',@lastid,null);

-- permissions
INSERT INTO texts (default_text) VALUES ('Access Member Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Access Member Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Acceder al área de miembros');
INSERT INTO permission (code,title_id,can_read,can_write,application_id,created) VALUES ('PRM_MEMBER_AREA',@lastid,true,true,(SELECT id FROM application WHERE code = 'APP_CBORGCUST'),null);

INSERT INTO texts (default_text) VALUES ('Access Admin Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Access Admin Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Acceso al área de administración');
INSERT INTO permission (code,title_id,can_read,can_write,application_id,created) VALUES ('PRM_ADMIN_AREA',@lastid,true,true,(SELECT id FROM application WHERE code = 'APP_CBORGCUST'),null);

-- role
INSERT INTO texts (default_text) VALUES ('Member');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Member');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Miembro');
INSERT INTO role (code,title_id,application_id,created) VALUES ('ROLE_MEMBER',@lastid,(SELECT id FROM application WHERE code = 'APP_CBORGCUST'),null);

INSERT INTO texts (default_text) VALUES ('Admin');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Administración');
INSERT INTO role (code,title_id,application_id,created) VALUES ('ROLE_ADMIN',@lastid,(SELECT id FROM application WHERE code = 'APP_CBORGCUST'),null);

INSERT INTO role_permission (role_id,permission_id) SELECT id,(SELECT id FROM permission WHERE code = 'PRM_MEMBER_AREA') AS permissionid FROM role WHERE code = 'ROLE_MEMBER';
INSERT INTO role_permission (role_id,permission_id) SELECT id,(SELECT id FROM permission WHERE code = 'PRM_ADMIN_AREA') AS permissionid FROM role WHERE code = 'ROLE_ADMIN';

-- Base users
INSERT INTO users (username,password,salt,firstname,middlename,lastname,zipcode,email,session_token,email_token,email_confirm,is_active,lang,created) VALUES ('cborgadmin','tpOdfWGybw5Kwp1Xoym3YxLhCKk=','LrS8Hv/zqFw=','admin','admin','admin',33544,'guru@cborgtech.com','QcyiKaCZipA=','PUaxya0BS+00',1,1,'en',null);
INSERT INTO user_role (user_id,role_id) SELECT id,(SELECT id FROM role WHERE code='ROLE_ADMIN') FROM users WHERE username='cborgadmin';
INSERT INTO user_role (user_id,role_id) SELECT id,(SELECT id FROM role WHERE code='ROLE_MEMBER') FROM users WHERE username='cborgadmin';

INSERT INTO users (username,password,salt,firstname,middlename,lastname,zipcode,email,session_token,email_token,email_confirm,is_active,lang,created) VALUES ('cborgmember','tpOdfWGybw5Kwp1Xoym3YxLhCKk=','LrS8Hv/zqFw=','admin','admin','admin',33544,'member@cborgtech.com','QcyiKaCZipA=','PUaxya0BS+00',1,1,'en',null);
INSERT INTO user_role (user_id,role_id) SELECT id,(SELECT id FROM role WHERE code='ROLE_MEMBER') FROM users WHERE username='cborgmember';


-- Page Category
INSERT INTO texts (default_text) VALUES ('Global Page Options');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Global Page Options');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Opciones globales');
INSERT INTO sys_page_category (name,text_id) VALUES ('GLOBAL_PAGE_OPTIONS',@lastid);

INSERT INTO texts (default_text) VALUES ('Modules Page Options');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Modules Page Options');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Opciones Módulos Página');
INSERT INTO sys_page_category (name,text_id) VALUES ('MODULES_PAGE_OPTIONS',@lastid);

INSERT INTO texts (default_text) VALUES ('Admin Modules Page Options');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin Modules Page Options');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Opciones Módulos de administración de Página');
INSERT INTO sys_page_category (name,text_id) VALUES ('ADMIN_MODULES_PAGE_OPTIONS',@lastid);

-- PageName Password Change
INSERT INTO texts (default_text) VALUES ('Password change Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Password change Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de cambio de contraseña');
INSERT INTO sys_page_name (name,text_id,category_id) VALUES ('PASSWORD_CHANGE_FORM',@lastid,(SELECT id FROM sys_page_category WHERE name = 'GLOBAL_PAGE_OPTIONS'));

-- Form Field Password Change
INSERT INTO texts (default_text) VALUES ('Password');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Password');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Clave');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'PASSWORD_CHANGE_FORM'),'PASSWORD_CHANGE_FORM_PASSWORD',@lastid,'TXT',2,25,null,'MAIN',null,null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'PASSWORD_CHANGE_FORM_PASSWORD'),'','Password:','en',true,true,1,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'PASSWORD_CHANGE_FORM_PASSWORD'),'','Contraseña:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Verify Password');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Verify Password');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Verificar contraseña');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'PASSWORD_CHANGE_FORM'),'PASSWORD_CHANGE_FORM_VERIFYPASSWORD',@lastid,'TXT',2,25,null,'MAIN',null,null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'PASSWORD_CHANGE_FORM_VERIFYPASSWORD'),'','Verify Password:','en',true,true,2,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'PASSWORD_CHANGE_FORM_VERIFYPASSWORD'),'','Verifique su contraseña:','es',true,true,2,'',null);

-- Labels Password Change
INSERT INTO texts (default_text) VALUES ('Submit - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Submit - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de enviar');
INSERT INTO sys_page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'PASSWORD_CHANGE_FORM'),'PASSWORD_CHANGE_FORM_SUBMIT_BUTTON',@lastid,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'PASSWORD_CHANGE_FORM_SUBMIT_BUTTON'),'Submit','en',true,0,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'PASSWORD_CHANGE_FORM_SUBMIT_BUTTON'),'Presentar','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Reset - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Reset - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de reinicio');
INSERT INTO sys_page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'PASSWORD_CHANGE_FORM'),'PASSWORD_CHANGE_FORM_RESET_BUTTON',@lastid,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'PASSWORD_CHANGE_FORM_RESET_BUTTON'),'Reset','en',true,1,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'PASSWORD_CHANGE_FORM_RESET_BUTTON'),'Reajustar','es',true,1,null);

-- Texts Password Change
INSERT INTO texts (default_text) VALUES ('Email Verify');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Email Verify');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Correo electrónico Confirme');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'PASSWORD_CHANGE_FORM'),'PASSWORD_CHANGE_FORM_EMAIL_VERIFY',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'PASSWORD_CHANGE_FORM_EMAIL_VERIFY'),'Verification Email has been sent!','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'PASSWORD_CHANGE_FORM_EMAIL_VERIFY'),'Correo electrónico de verificación ha sido enviado!','es',true,null);

INSERT INTO texts (default_text) VALUES ('User missing');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User missing');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Perdidos por el usuario');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'PASSWORD_CHANGE_FORM'),'PASSWORD_CHANGE_FORM_USERMISSING',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'PASSWORD_CHANGE_FORM_USERMISSING'),'The user name you provided is not registered','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'PASSWORD_CHANGE_FORM_USERMISSING'),'El nombre de usuario que ha proporcionado no está registrado','es',true,null);

-- PageName  Registration
INSERT INTO texts (default_text) VALUES ('Registration Check Name Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Registration Check Name Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de inscripción Comprobar nombre');
INSERT INTO sys_page_name (name,text_id,category_id) VALUES ('REGISTRATION_CHECKNAME_FORM',@lastid,(SELECT id FROM sys_page_category WHERE name = 'GLOBAL_PAGE_OPTIONS'));

-- Form Field  Registration Checkname
INSERT INTO texts (default_text) VALUES ('User name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Nombre de usuario');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'REGISTRATION_CHECKNAME_FORM'),'REGISTRATION_CHECKNAME_FORM_USERNAME',@lastid,'TXT',2,25,null,'MAIN',null,'username',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'REGISTRATION_CHECKNAME_FORM_USERNAME'),'-Valid email address-','User name:','en',true,true,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'REGISTRATION_CHECKNAME_FORM_USERNAME'),'-Dirección de email válida-','Nombre de usuari:','es',true,true,0,'',null);

-- Labels Registration Check Name
INSERT INTO texts (default_text) VALUES ('Search Username - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Search Username - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Buscar Nombre de usuario - Botón');
INSERT INTO sys_page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'REGISTRATION_CHECKNAME_FORM'),'REGISTRATION_CHECKNAME_FORM_SEARCH_USERNAME_BUTTON',@lastid,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'REGISTRATION_CHECKNAME_FORM_SEARCH_USERNAME_BUTTON'),'Search','en',true,0,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'REGISTRATION_CHECKNAME_FORM_SEARCH_USERNAME_BUTTON'),'Search es','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Reset - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Reset - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de reinicio');
INSERT INTO sys_page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'REGISTRATION_CHECKNAME_FORM'),'REGISTRATION_CHECKNAME_FORM_RESET_BUTTON',@lastid,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'REGISTRATION_CHECKNAME_FORM_RESET_BUTTON'),'Reset','en',true,1,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'REGISTRATION_CHECKNAME_FORM_RESET_BUTTON'),'Reajustar','es',true,1,null);

-- Social Acquaintance Email Invite Form
INSERT INTO texts (default_text) VALUES ('Social Aquaintance Email Invite Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Aquaintance Area Email Invite Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Aquaintance Área Social Email Invite Form');
INSERT INTO sys_page_name (name,text_id,category_id) VALUES ('SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM',@lastid,(SELECT id FROM sys_page_category WHERE name = 'MODULES_PAGE_OPTIONS'));

-- Form
INSERT INTO texts (default_text) VALUES ('Email Address');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Email Address');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Dirección de correo electrónico');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM_EMAIL',@lastid,'TXT','email',2,25,null,'MAIN',null,'receiverEmail',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM_EMAIL'),'-Valid email address-','Email Address:','en',true,true,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM_EMAIL'),'-Dirección de email válida-','Dirección de correo electrónico:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Message Input');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Message Input');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Mensaje de entrada');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM_MESSAGE',@lastid,'TXTA','textarea',2,25,null,'MAIN',null,'message',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM_MESSAGE'),'-Join me on ToastHub-','Message:','en',true,true,1,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM_MESSAGE'),'-Únete a mí en ToastHub-','Mensaje:','es',true,true,1,'',null);

-- Labels
INSERT INTO texts (default_text) VALUES ('Submit - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Submit - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de enviar');
INSERT INTO sys_page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_SUBMIT_BUTTON',@lastid,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_SUBMIT_BUTTON'),'Submit','en',true,0,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_SUBMIT_BUTTON'),'Search es','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Reset - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Reset - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de reinicio');
INSERT INTO sys_page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_RESET_BUTTON',@lastid,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_RESET_BUTTON'),'Reset','en',true,1,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_RESET_BUTTON'),'Reajustar','es',true,1,null);

-- Texts
INSERT INTO texts (default_text) VALUES ('Email Invite Successful');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Email Invite Successful');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Email Invitar Exitosa');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_SUCCESSFUL',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_SUCCESSFUL'),'Email Invite Successfully Sent','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_SUCCESSFUL'),'Invitar a un correo electrónico enviado con éxito','es',true,null);

INSERT INTO texts (default_text) VALUES ('Email Invite Failed');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Email Invite Failed');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Email invitación Falló');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FAILED',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FAILED'),'Email Invite Failed','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_EMAIL_INVITE_FAILED'),'Email Invitar Error','es',true,null);

-- Social Acquaintance Invite Form
INSERT INTO texts (default_text) VALUES ('Social Aquaintance Invite Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Aquaintance Area Invite Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Aquaintance Área Social Invite Form');
INSERT INTO sys_page_name (name,text_id,category_id) VALUES ('SOCIAL_ACQUAINTANCE_INVITE_FORM',@lastid,(SELECT id FROM sys_page_category WHERE name = 'MODULES_PAGE_OPTIONS'));

-- Form
INSERT INTO texts (default_text) VALUES ('Receiver Id');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Receiver Id');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Receiver Id');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_INVITE_FORM_RECEIVER_ID',@lastid,'HDN','hidden',2,25,null,'MAIN',null,'receiver-id',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM_RECEIVER_ID'),'','','en',true,true,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM_RECEIVER_ID'),'','','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Message Input');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Message Input');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Mensaje de entrada');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_INVITE_FORM_MESSAGE',@lastid,'TXTA','textarea',2,25,null,'MAIN',null,'message',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM_MESSAGE'),'-I would like to connect-','Message:','en',true,true,1,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM_MESSAGE'),'-Me gustaría conectar-','Mensaje:','es',true,true,1,'',null);

-- Labels
INSERT INTO texts (default_text) VALUES ('Submit - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Submit - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de enviar');
INSERT INTO sys_page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_INVITE_SUBMIT_BUTTON',@lastid,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_SUBMIT_BUTTON'),'Submit','en',true,0,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_SUBMIT_BUTTON'),'Search es','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Reset - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Reset - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de reinicio');
INSERT INTO sys_page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_INVITE_RESET_BUTTON',@lastid,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_RESET_BUTTON'),'Reset','en',true,1,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_RESET_BUTTON'),'Reajustar','es',true,1,null);

-- Texts
INSERT INTO texts (default_text) VALUES ('Invite Successful');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Invite Successful');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Invitar Exitosa');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_INVITE_SUCCESSFUL',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_SUCCESSFUL'),'Invite Successfully Sent','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_SUCCESSFUL'),'Invitar a un correo electrónico enviado con éxito','es',true,null);

INSERT INTO texts (default_text) VALUES ('Invite Failed');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Invite Failed');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Invitación Falló');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FORM'),'SOCIAL_ACQUAINTANCE_INVITE_FAILED',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FAILED'),'Invite Failed','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITE_FAILED'),'Invitar Error','es',true,null);



-- Social Acquaintance
INSERT INTO texts (default_text) VALUES ('Social Aquaintance Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Aquaintance Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Aquaintance Área Social');
INSERT INTO sys_page_name (name,text_id,category_id) VALUES ('SOCIAL_ACQUAINTANCE',@lastid,(SELECT id FROM sys_page_category WHERE name = 'MODULES_PAGE_OPTIONS'));

INSERT INTO texts (default_text) VALUES ('Main Tab Aquaintances');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab Aquaintances');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Principales Tab aquaintances');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE'),'SOCIAL_ACQUAINTANCE_MAIN_TAB_AQUAINTANCES',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_MAIN_TAB_AQUAINTANCES'),'Aquaintances','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_MAIN_TAB_AQUAINTANCES'),'Aquaintances','es',true,null);

INSERT INTO texts (default_text) VALUES ('Aquaintances Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Aquaintances Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Aquaintances Cabecera');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE'),'SOCIAL_ACQUAINTANCE_AQUAINTANCES_HEADER',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_AQUAINTANCES_HEADER'),'My Aquaintances','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_AQUAINTANCES_HEADER'),'Mis aquaintances','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab Invites');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab Invites');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Invita ficha Principal');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE'),'SOCIAL_ACQUAINTANCE_MAIN_TAB_INVITES',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_MAIN_TAB_INVITES'),'Invites','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_MAIN_TAB_INVITES'),'Invita','es',true,null);

INSERT INTO texts (default_text) VALUES ('Invites Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Invites Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Invita Cabecera');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_ACQUAINTANCE'),'SOCIAL_ACQUAINTANCE_INVITES_HEADER',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITES_HEADER'),'My Invites','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_ACQUAINTANCE_INVITES_HEADER'),'Invita Mi','es',true,null);

-- Social Activities
INSERT INTO texts (default_text) VALUES ('Social Activities Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Activities Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Actividades sociales Área');
INSERT INTO sys_page_name (name,text_id,category_id) VALUES ('SOCIAL_ACTIVITIES',@lastid,(SELECT id FROM sys_page_category WHERE name = 'MODULES_PAGE_OPTIONS'));

-- Social Group
INSERT INTO texts (default_text) VALUES ('Social Group Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Group Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Área Grupo Social');
INSERT INTO sys_page_name (name,text_id,category_id) VALUES ('SOCIAL_GROUP',@lastid,(SELECT id FROM sys_page_category WHERE name = 'MODULES_PAGE_OPTIONS'));

-- Form
INSERT INTO texts (default_text) VALUES ('Group Form - Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Group Form - Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de Grupo - Nombre');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_NAME',@lastid,'TXT',2,25,null,'MAIN',null,null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_GROUP_FORM_NAME'),'','Name:','en',true,true,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_GROUP_FORM_NAME'),'','Nombre:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Group Form - Description');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Group Form - Description');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario Group - Descripción');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_DESCRIPTION',@lastid,'TXT',2,25,null,'MAIN',null,null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_GROUP_FORM_DESCRIPTION'),'','Description:','en',true,true,1,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_GROUP_FORM_DESCRIPTION'),'','Descripción:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Group Form - Access');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Group Form - Access');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de Grupo - Acceso');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_ACCESS',@lastid,'TXT',2,25,null,'MAIN',null,null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_GROUP_FORM_ACCESS'),'','Access:','en',true,true,2,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_GROUP_FORM_ACCESS'),'','Acceso:','es',true,true,2,'',null);

-- Labels
INSERT INTO texts (default_text) VALUES ('Submit - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Submit - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de enviar');
INSERT INTO sys_page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_SUBMIT_BUTTON',@lastid,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_GROUP_FORM_SUBMIT_BUTTON'),'Submit','en',true,0,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_GROUP_FORM_SUBMIT_BUTTON'),'Presentar','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Reset - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Reset - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de reinicio');
INSERT INTO sys_page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_RESET_BUTTON',@lastid,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_GROUP_FORM_RESET_BUTTON'),'Reset','en',true,1,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_GROUP_FORM_RESET_BUTTON'),'Reajustar','es',true,1,null);

-- Texts
INSERT INTO texts (default_text) VALUES ('Form header modify group');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Form header modify group');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado Formulario modificar grupo');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_MODIFY_HEADER',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_FORM_MODIFY_HEADER'),'Modify Group:','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_FORM_MODIFY_HEADER'),'Modificar grupo:','es',true,null);

INSERT INTO texts (default_text) VALUES ('Form header create group');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Form header create group');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado Formulario crear grupo');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_FORM_CREATE_HEADER',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_FORM_CREATE_HEADER'),'Create new Group:','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_FORM_CREATE_HEADER'),'Crear un grupo nuevo:','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab My Groups');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab My Groups');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha Principal Mis Grupos');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_MAIN_TAB_MYGROUPS',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_MYGROUPS'),'My Groups','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_MYGROUPS'),'Mis Grupos','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab Joined Groups');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab Joined Groups');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha Principal Registrado Grupos');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_MAIN_TAB_JOINED',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_JOINED'),'Following','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_JOINED'),'Siguiente','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab Available Groups');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab Available Groups');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha Principal Grupos disponibles');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_MAIN_TAB_AVAILGROUPS',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_AVAILGROUPS'),'Available Groups','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_AVAILGROUPS'),'Grupos disponibles','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab Private Invites');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab Private Invites');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha Principal Invita privadas');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_MAIN_TAB_INVITES',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_INVITES'),'Invites','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_INVITES'),'Invita','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab Public Requests');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab Public Requests');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Solicitudes Principal Tab Públicas');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_MAIN_TAB_REQUESTS',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_REQUESTS'),'Requests','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_MAIN_TAB_REQUESTS'),'Requests','es',true,null);

INSERT INTO texts (default_text) VALUES ('Groups Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Groups Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Solicitudes Principal Tab Públicas');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_GROUP'),'SOCIAL_GROUP_GROUPS_HEADER',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_GROUPS_HEADER'),'My Groups','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_GROUP_GROUPS_HEADER'),'Mis Grupos','es',true,null);


-- Social Library
INSERT INTO texts (default_text) VALUES ('Social Library Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Library Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Biblioteca Área Social');
INSERT INTO sys_page_name (name,text_id,category_id) VALUES ('SOCIAL_LIBRARY',@lastid,(SELECT id FROM sys_page_category WHERE name = 'MODULES_PAGE_OPTIONS'));

-- Form
INSERT INTO texts (default_text) VALUES ('Library Form - Name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Library Form - Name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario Biblioteca - Nombre');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_FORM_NAME',@lastid,'TXT',2,25,null,'MAIN',null,null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_LIBRARY_FORM_NAME'),'','Name:','en',true,true,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_LIBRARY_FORM_NAME'),'','Nombre:','es',true,true,0,'',null);

-- Labels
INSERT INTO texts (default_text) VALUES ('Submit - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Submit - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de enviar');
INSERT INTO sys_page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_FORM_SUBMIT_BUTTON',@lastid,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_LIBRARY_FORM_SUBMIT_BUTTON'),'Submit','en',true,0,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_LIBRARY_FORM_SUBMIT_BUTTON'),'Presentar','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Reset - Button');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Reset - Button');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Botón de reinicio');
INSERT INTO sys_page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_FORM_RESET_BUTTON',@lastid,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_LIBRARY_FORM_RESET_BUTTON'),'Reset','en',true,1,null);
INSERT INTO sys_page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM sys_page_label_name WHERE name = 'SOCIAL_LIBRARY_FORM_RESET_BUTTON'),'Reajustar','es',true,1,null);

-- Texts
INSERT INTO texts (default_text) VALUES ('Library form - modify header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Library form - modify header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Forma Biblioteca - modificar cabecera');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_FORM_MODIFY_HEADER',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_LIBRARY_FORM_MODIFY_HEADER'),'Modify directory:','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_LIBRARY_FORM_MODIFY_HEADER'),'Modificar directorio:','es',true,null);

INSERT INTO texts (default_text) VALUES ('Library form - create header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Library form - create header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Forma Biblioteca - crear cabecera');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_FORM_CREATE_HEADER',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_LIBRARY_FORM_CREATE_HEADER'),'Create directory:','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_LIBRARY_FORM_CREATE_HEADER'),'Crear directorio:','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab my directories and files');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab my directories and files');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha Principal mis directorios y archivos');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_MAIN_TAB_MINE',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_LIBRARY_MAIN_TAB_MINE'),'My Directories and Files','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_LIBRARY_MAIN_TAB_MINE'),'Mis directorios y archivos','es',true,null);

INSERT INTO texts (default_text) VALUES ('Main Tab shared directories and files');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Main Tab shared directories and files');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Tab principal directorios y archivos compartidos');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_MAIN_TAB_SHARED',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_LIBRARY_MAIN_TAB_SHARED'),'Shared Directories and Files','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_LIBRARY_MAIN_TAB_SHARED'),'Directorios y archivos compartidos','es',true,null);

INSERT INTO texts (default_text) VALUES ('Library Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Library Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Biblioteca de Cabecera');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_LIBRARY'),'SOCIAL_LIBRARY_HEADER',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_LIBRARY_HEADER'),'File and Image Library','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'SOCIAL_LIBRARY_HEADER'),'Archivo y Biblioteca de imágenes','es',true,null);


-- Social Event
INSERT INTO texts (default_text) VALUES ('Social Event Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Event Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Área para eventos sociales');
INSERT INTO sys_page_name (name,text_id,category_id) VALUES ('SOCIAL_EVENT',@lastid,(SELECT id FROM sys_page_category WHERE name = 'MODULES_PAGE_OPTIONS'));

-- Form
INSERT INTO texts (default_text) VALUES ('Event Form - Message');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form - Message');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha evento - Mensaje');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_MESSAGE',@lastid,'TXT','textarea',2,25,null,'MAIN',null,'message',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_MESSAGE'),'What do you see?','Message','en',true,false,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_MESSAGE'),'¿Que ves?','Mensaje','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Event Form - Type Code');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form - Type Code');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha Evento - Código Tipo');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_TYPE_CODE',@lastid,'TXT','hidden',2,25,null,'MAIN',null,'code',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_TYPE_CODE'),'','Title','en',true,false,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_TYPE_CODE'),'','Título','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Event Form - Latitude');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form - Latitude');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha evento - Latitud');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_LATITUDE',@lastid,'TXTDOUBLE','hidden',2,25,null,'MAIN',null,'latitude',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_LATITUDE'),'','Latitude','en',true,false,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_LATITUDE'),'','Latitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Event Form - Longitude');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form - Longitude');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha evento - Longitud');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_LONGITUDE',@lastid,'TXTDOUBLE','hidden',2,25,null,'MAIN',null,'longitude',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_LONGITUDE'),'','Longitude','en',true,false,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_LONGITUDE'),'','Longitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Event Form - Altitude');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form - Altitude');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha evento - Altitud');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_ALTITUDE',@lastid,'TXTDOUBLE','hidden',2,25,null,'MAIN',null,'altitude',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_ALTITUDE'),'','Altitude','en',true,false,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_ALTITUDE'),'','Altitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Event Form - Accuracy');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form - Accuracy');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha evento - Exactitud');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_ACCURACY',@lastid,'TXTFLOAT','hidden',2,25,null,'MAIN',null,'accuracy',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_ACCURACY'),'','Accuracy','en',true,false,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_ACCURACY'),'','Exactitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Event Form - Provider');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Event Form -Provider');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Ficha evento - Proveedor');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_EVENT'),'SOCIAL_EVENT_FORM_PROVIDER',@lastid,'TXT','hidden',2,25,null,'MAIN',null,'provider',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_PROVIDER'),'','Provider','en',true,false,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_EVENT_FORM_PROVIDER'),'','Proveedor','es',true,false,0,'',null);


-- Social Location
INSERT INTO texts (default_text) VALUES ('Social Location Area');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Social Location Area');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Social Área de Localización');
INSERT INTO sys_page_name (name,text_id,category_id) VALUES ('SOCIAL_LOCATION',@lastid,(SELECT id FROM sys_page_category WHERE name = 'MODULES_PAGE_OPTIONS'));

-- Form
INSERT INTO texts (default_text) VALUES ('Location Form - Provider');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Location Form -Provider');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Localización Formulario - Proveedor');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_LOCATION'),'SOCIAL_LOCATION_FORM_PROVIDER',@lastid,'TXT','hidden',2,25,null,'MAIN',null,'provider',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_PROVIDER'),'','Provider','en',true,false,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_PROVIDER'),'','Proveedor','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Location Form - Latitude');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Location Form - Latitude');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Localización Formulario - Latitud');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_LOCATION'),'SOCIAL_LOCATION_FORM_LATITUDE',@lastid,'TXTDOUBLE','hidden',2,25,null,'MAIN',null,'latitude',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_LATITUDE'),'','Latitude','en',true,false,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_LATITUDE'),'','Latitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Location Form - Longitude');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Location Form - Longitude');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Localización Formulario - Longitud');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_LOCATION'),'SOCIAL_LOCATION_FORM_LONGITUDE',@lastid,'TXTDOUBLE','hidden',2,25,null,'MAIN',null,'longitude',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_LONGITUDE'),'','Longitude','en',true,false,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_LONGITUDE'),'','Longitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Location Form - Altitude');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Location Form - Altitude');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Localización Formulario - Altitud');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_LOCATION'),'SOCIAL_LOCATION_FORM_ALTITUDE',@lastid,'TXTDOUBLE','hidden',2,25,null,'MAIN',null,'altitude',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_ALTITUDE'),'','Altitude','en',true,false,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_ALTITUDE'),'','Altitud','es',true,false,0,'',null);

INSERT INTO texts (default_text) VALUES ('Location Form - Accuracy');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Location Form - Accuracy');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Localización Formulario - Exactitud');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,jfield_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'SOCIAL_LOCATION'),'SOCIAL_LOCATION_FORM_ACCURACY',@lastid,'TXTFLOAT','hidden',2,25,null,'MAIN',null,'accuracy',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_ACCURACY'),'','Accuracy','en',true,false,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'SOCIAL_LOCATION_FORM_ACCURACY'),'','Exactitud','es',true,false,0,'',null);


-- ---------------------------------------------------- Admin Users
-- 
INSERT INTO texts (default_text) VALUES ('Admin users form edit');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin users form edit');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Admin users form edit');
INSERT INTO sys_page_name (name,text_id,category_id) VALUES ('ADMIN_USERS_FORM_EDIT',@lastid,(SELECT id FROM sys_page_category WHERE name = 'ADMIN_MODULES_PAGE_OPTIONS'));

-- Form
INSERT INTO texts (default_text) VALUES ('User Form - First name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User Form - First name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de usuario - Nombre');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'ADMIN_USERS_FORM_EDIT'),'ADMIN_USERS_FORM_FIRSTNAME',@lastid,'TXT',2,25,null,'MAIN',null,null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_USERS_FORM_FIRSTNAME'),'','First name:','en',true,true,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_USERS_FORM_FIRSTNAME'),'','Nombre:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('User Form - Middle name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User Form - Middle name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de usuario - Segundo nombre');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'ADMIN_USERS_FORM_EDIT'),'ADMIN_USERS_FORM_MIDDLENAME',@lastid,'TXT',2,25,null,'MAIN',null,null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_USERS_FORM_MIDDLENAME'),'','Middle name:','en',true,true,1,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_USERS_FORM_MIDDLENAME'),'','Segundo nombre:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('User Form - Last name');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','User Form - Last name');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de usuario - Apellido');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'ADMIN_USERS_FORM_EDIT'),'ADMIN_USERS_FORM_LASTNAME',@lastid,'TXT',2,25,null,'MAIN',null,null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_USERS_FORM_LASTNAME'),'','Last name:','en',true,true,2,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_USERS_FORM_LASTNAME'),'','Apellido:','es',true,true,2,'',null);

-- Text
INSERT INTO texts (default_text) VALUES ('Edit user');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Edit user');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Editar usuario');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'ADMIN_USERS_FORM_EDIT'),'ADMIN_USERS_FORM_EDIT_HEADER',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'ADMIN_USERS_FORM_EDIT_HEADER'),'Edit user','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'ADMIN_USERS_FORM_EDIT_HEADER'),'Editar usuario','es',true,null);

-- ---------------------------------------------------- Admin menu
-- 
INSERT INTO texts (default_text) VALUES ('Admin menu form edit');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Admin menu form edit');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de menú de administración de edición');
INSERT INTO sys_page_name (name,text_id,category_id) VALUES ('ADMIN_MENU_FORM_EDIT',@lastid,(SELECT id FROM sys_page_category WHERE name = 'ADMIN_MODULES_PAGE_OPTIONS'));

-- Form
INSERT INTO texts (default_text) VALUES ('Menu Form - Code');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Menu Form - Code');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de Menú - Código');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'ADMIN_MENU_FORM_EDIT'),'ADMIN_MENU_FORM_CODE',@lastid,'TXT',2,25,null,'MAIN',null,null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_MENU_FORM_CODE'),'','Code:','en',true,true,0,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_MENU_FORM_CODE'),'','Código:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Menu Form - Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Menu Form - Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de Menú - Título');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'ADMIN_MENU_FORM_EDIT'),'ADMIN_MENU_FORM_TITLE',@lastid,'MTXT',2,25,null,'MAIN',null,null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_MENU_FORM_TITLE'),'','Title:','en',true,true,1,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_MENU_FORM_TITLE'),'','Título:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Menu Form - API Version');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Menu Form - API Version');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de Menú - Versión API');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'ADMIN_MENU_FORM_EDIT'),'ADMIN_MENU_FORM_APIVERSION',@lastid,'DBL',2,25,null,'MAIN',null,null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_MENU_FORM_APIVERSION'),'','API Version:','en',true,true,2,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_MENU_FORM_APIVERSION'),'','API Versión:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Menu Form - APP Version');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Menu Form - APP Version');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de Menú - Versión APP');
INSERT INTO sys_page_form_field_name (page_name_id,name,text_id,field_type,row_count,column_count,class_name,group_name,sub_group_name,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'ADMIN_MENU_FORM_EDIT'),'ADMIN_MENU_FORM_APPVERSION',@lastid,'DBL',2,25,null,'MAIN',null,null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_MENU_FORM_APPVERSION'),'','APP Version:','en',true,true,3,'',null);
INSERT INTO sys_page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM sys_page_form_field_name WHERE name = 'ADMIN_MENU_FORM_APPVERSION'),'','APP Versión:','es',true,true,3,'',null);


-- Text
INSERT INTO texts (default_text) VALUES ('Menu Text - Edit header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Menu Text - Edit header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Texto Menú - Editar cabecera');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'ADMIN_MENU_FORM_EDIT'),'ADMIN_MENU_FORM_EDIT_HEADER',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'ADMIN_MENU_FORM_EDIT_HEADER'),'Edit menu','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'ADMIN_MENU_FORM_EDIT_HEADER'),'Menú de edición','es',true,null);

INSERT INTO texts (default_text) VALUES ('Menu Text - Create header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Menu Text - Create header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Texto Menú - Crear cabecera');
INSERT INTO sys_page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM sys_page_name WHERE name = 'ADMIN_MENU_FORM_EDIT'),'ADMIN_MENU_FORM_EDIT_CREATE_HEADER',@lastid,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'ADMIN_MENU_FORM_EDIT_CREATE_HEADER'),'Create menu','en',true,null);
INSERT INTO sys_page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM sys_page_text_name WHERE name = 'ADMIN_MENU_FORM_EDIT_CREATE_HEADER'),'Crear menú','es',true,null);

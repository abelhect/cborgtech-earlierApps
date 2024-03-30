
-- Category
INSERT INTO texts (default_text,created) VALUES ('Critical',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO category (name_id,code,parent_id,category_group,category_order,created) VALUES (@lastid,'CRITICAL',null,'FA_FEATURE_DEFAULT',1,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Critical',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Crítico',null);

INSERT INTO texts (default_text,created) VALUES ('Minor',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO category (name_id,code,parent_id,category_group,category_order,created) VALUES (@lastid,'MINOR',null,'FA_FEATURE_DEFAULT',2,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Minor',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Menor',null);

INSERT INTO texts (default_text,created) VALUES ('Critical',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO category (name_id,code,parent_id,category_group,category_order,created) VALUES (@lastid,'CRITICAL',null,'FA_ISSUE_DEFAULT',1,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Critical',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Crítico',null);

INSERT INTO texts (default_text,created) VALUES ('Minor',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO category (name_id,code,parent_id,category_group,category_order,created) VALUES (@lastid,'MINOR',null,'FA_ISSUE_DEFAULT',2,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Minor',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Menor',null);

-- Status
INSERT INTO texts (default_text,created) VALUES ('Active',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO status (name_id,code,status_group,status_order,created) VALUES (@lastid,'ACTIVE','FA_FEATURE_DEFAULT',1,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Active',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Activo',null);

INSERT INTO texts (default_text,created) VALUES ('Denied',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO status (name_id,code,status_group,status_order,created) VALUES (@lastid,'DENY','FA_FEATURE_DEFAULT',2,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Denied',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Denegado',null);

INSERT INTO texts (default_text,created) VALUES ('Need More Info',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO status (name_id,code,status_group,status_order,created) VALUES (@lastid,'NEEDMOREINFO','FA_FEATURE_DEFAULT',3,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Need More Info',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','¿Necesita más información',null);

INSERT INTO texts (default_text,created) VALUES ('Complete',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO status (name_id,code,status_group,status_order,created) VALUES (@lastid,'COMPLETE','FA_FEATURE_DEFAULT',4,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Complete',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Completar',null);

INSERT INTO texts (default_text,created) VALUES ('Active',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO status (name_id,code,status_group,status_order,created) VALUES (@lastid,'ACTIVE','FA_ISSUE_DEFAULT',1,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Active',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Activo',null);

INSERT INTO texts (default_text,created) VALUES ('Denied',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO status (name_id,code,status_group,status_order,created) VALUES (@lastid,'DENY','FA_ISSUE_DEFAULT',2,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Denied',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Denegado',null);

INSERT INTO texts (default_text,created) VALUES ('Need More Info',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO status (name_id,code,status_group,status_order,created) VALUES (@lastid,'NEEDMOREINFO','FA_ISSUE_DEFAULT',3,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Need More Info',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','¿Necesita más información',null);

INSERT INTO texts (default_text,created) VALUES ('Complete',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO status (name_id,code,status_group,status_order,created) VALUES (@lastid,'COMPLETE','FA_ISSUE_DEFAULT',4,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Complete',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Completar',null);

-- Workflow
INSERT INTO texts (default_text,created) VALUES ('Request',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO workflow (name_id,code,flow_group,flow_order,created) VALUES (@lastid,'REQUEST','FA_FEATURE_DEFAULT',1,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Request',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Solicitud',null);

INSERT INTO texts (default_text,created) VALUES ('Evaluate',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO workflow (name_id,code,flow_group,flow_order,created) VALUES (@lastid,'EVALUATE','FA_FEATURE_DEFAULT',2,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Evaluate',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Evaluar',null);

INSERT INTO texts (default_text,created) VALUES ('Development',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO workflow (name_id,code,flow_group,flow_order,created) VALUES (@lastid,'DEVELOPMENT','FA_FEATURE_DEFAULT',3,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Development',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Desarrollo',null);

INSERT INTO texts (default_text,created) VALUES ('Ready for QA pending Build',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO workflow (name_id,code,flow_group,flow_order,created) VALUES (@lastid,'READYQAPENDBUILD','FA_FEATURE_DEFAULT',4,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Ready for QA pending Build',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Listo para control de calidad de construcción pendiente',null);

INSERT INTO texts (default_text,created) VALUES ('Ready for QA',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO workflow (name_id,code,flow_group,flow_order,created) VALUES (@lastid,'READYQA','FA_FEATURE_DEFAULT',5,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Ready for QA',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Listo para control de calidad',null);

INSERT INTO texts (default_text,created) VALUES ('Prod Deploy',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO workflow (name_id,code,flow_group,flow_order,created) VALUES (@lastid,'PRODDEPLOY','FA_FEATURE_DEFAULT',6,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Prod Deploy',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Implementar prod',null);

INSERT INTO texts (default_text,created) VALUES ('Request',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO workflow (name_id,code,flow_group,flow_order,created) VALUES (@lastid,'REQUEST','FA_ISSUE_DEFAULT',1,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Request',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Solicitud',null);

INSERT INTO texts (default_text,created) VALUES ('Evaluate',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO workflow (name_id,code,flow_group,flow_order,created) VALUES (@lastid,'EVALUATE','FA_ISSUE_DEFAULT',2,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Evaluate',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Evaluar',null);

INSERT INTO texts (default_text,created) VALUES ('Development',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO workflow (name_id,code,flow_group,flow_order,created) VALUES (@lastid,'DEVELOPMENT','FA_ISSUE_DEFAULT',3,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Development',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Desarrollo',null);

INSERT INTO texts (default_text,created) VALUES ('Ready for QA pending Build',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO workflow (name_id,code,flow_group,flow_order,created) VALUES (@lastid,'READYQAPENDBUILD','FA_ISSUE_DEFAULT',4,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Ready for QA pending Build',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Listo para control de calidad de construcción pendiente',null);

INSERT INTO texts (default_text,created) VALUES ('Ready for QA',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO workflow (name_id,code,flow_group,flow_order,created) VALUES (@lastid,'READYQA','FA_ISSUE_DEFAULT',5,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Ready for QA',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Listo para control de calidad',null);

INSERT INTO texts (default_text,created) VALUES ('Prod Deploy',null);
SET @lastid = LAST_INSERT_ID();
INSERT INTO workflow (name_id,code,flow_group,flow_order,created) VALUES (@lastid,'PRODDEPLOY','FA_ISSUE_DEFAULT',6,null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'en','Prod Deploy',null);
INSERT INTO langtexts (text_id,lang,text,created) VALUES (@lastid,'es','Implementar prod',null);



-- Feature
INSERT INTO texts (default_text) VALUES ('Feature Form');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Feature Form');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Formulario de idioma de administración');
INSERT INTO page_name (name,text_id,category) VALUES ('FA_FEATURE_FORM',@lastid,'MEMBER');

INSERT INTO texts (default_text) VALUES ('Title');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Title');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_TITLE',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":"title","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_TITLE'),'','Title:','en',true,true,0,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_TITLE'),'','Título:','es',true,true,0,'',null);

INSERT INTO texts (default_text) VALUES ('Description');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Description');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Título de texto predeterminado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_DESCRIPTION',@lastid,'TXTAREA','text',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":"desc","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_DESCRIPTION'),'','Description:','en',true,true,1,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_DESCRIPTION'),'','Texto predeterminado:','es',true,true,1,'',null);

INSERT INTO texts (default_text) VALUES ('Owner');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Owner');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Propietario');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_OWNER_REFID',@lastid,'ID','ref',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":"ownerRefId","type":"Long"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_OWNER_REFID'),'','Owner:','en',true,true,2,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_OWNER_REFID'),'','Propietario:','es',true,true,2,'',null);

INSERT INTO texts (default_text) VALUES ('Hour estimate');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Hour estimate');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estimación de la hora');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_HOUR_ESTIMATE',@lastid,'DOUBLE','text',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":"hourEstimate","type":"double"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_HOUR_ESTIMATE'),'','Hours Estimated:','en',true,false,3,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_HOUR_ESTIMATE'),'','Estimación de la hora:','es',true,false,3,'',null);

INSERT INTO texts (default_text) VALUES ('Actual hours');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Actual hours');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Horas reales');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_ACTUAL_HOURS',@lastid,'DOUBLE','text',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":"actualHours","type":"double"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_ACTUAL_HOURS'),'','Actual hours:','en',true,false,4,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_ACTUAL_HOURS'),'','Horas reales:','es',true,false,4,'',null);

INSERT INTO texts (default_text) VALUES ('Start date');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Start date');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Fecha de inicio');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_START_DATE',@lastid,'DATE','date',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":"startDate","type":"Date"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_START_DATE'),'','Start date:','en',true,false,5,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_START_DATE'),'','Fecha de inicio:','es',true,false,5,'',null);

INSERT INTO texts (default_text) VALUES ('End date');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','End date');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Fecha final');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_END_DATE',@lastid,'DATE','date',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":"endDate","type":"Date"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_END_DATE'),'','End date:','en',true,false,6,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_END_DATE'),'','Fecha final:','es',true,false,6,'',null);

INSERT INTO texts (default_text) VALUES ('Creator');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Creator');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Creador');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_CREATOR',@lastid,'ID','ref',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":"creatorRefId","type":"Long"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_CREATOR'),'','Creator:','en',true,true,7,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_CREATOR'),'','Creador:','es',true,true,7,'',null);

INSERT INTO texts (default_text) VALUES ('Workflow');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Workflow');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Flujo de trabajo');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_WORKFLOW',@lastid,'MDLSNG','select',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":{"parent":{"clazz":"com.pidragon.fa.model.WorkFlow","type":"Object"}},"method":"setWorkflowId","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_WORKFLOW'),'','Workflow:','en',true,false,8,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_WORKFLOW'),'','Flujo de trabajo:','es',true,false,8,'',null);

INSERT INTO texts (default_text) VALUES ('Category');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Category');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Categoría');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_CATEGORY',@lastid,'TXT','text',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":"category","type":"String"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_CATEGORY'),'','Category:','en',true,false,9,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_CATEGORY'),'','Categoría:','es',true,false,9,'',null);

INSERT INTO texts (default_text) VALUES ('Blueprint');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Blueprint');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Cianotipo');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_BLUEPRINT',@lastid,'MDLSNG','select',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":{"bluePrint":{"clazz":"com.pidragon.fa.model.BluePrint","type":"Object"}},"method":"setBluePrintId","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_BLUEPRINT'),'','Blueprint:','en',true,false,10,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_BLUEPRINT'),'','Cianotipo:','es',true,false,10,'',null);

INSERT INTO texts (default_text) VALUES ('Code branch');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Code branch');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Código de sucursal');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_CODE_BRANCH',@lastid,'MDLSNG','select',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":{"codeBranch":{"clazz":"com.pidragon.fa.model.CodeBranch","type":"Object"}},"method":"setCodeBranchId","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_CODE_BRANCH'),'','Code branch:','en',true,false,11,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_CODE_BRANCH'),'','Código de sucursal:','es',true,false,11,'',null);

INSERT INTO texts (default_text) VALUES ('Backlog');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Backlog');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Reserva');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_BACKLOG',@lastid,'MDLSNG','select',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":{"backLog":{"clazz":"com.pidragon.fa.model.BackLog","type":"Object"}},"method":"setBackLogId","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_BACKLOG'),'','Backlog:','en',true,false,12,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_BACKLOG'),'','Reserva:','es',true,false,12,'',null);

INSERT INTO texts (default_text) VALUES ('Release');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Release');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Lanzamiento');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_RELEASE',@lastid,'MDLSNG','select',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":{"release":{"clazz":"com.pidragon.fa.model.Release","type":"Object"}},"method":"setReleaseId","type":"Object"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_RELEASE'),'','Release:','en',true,false,13,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_RELEASE'),'','Lanzamiento:','es',true,false,13,'',null);


INSERT INTO texts (default_text) VALUES ('Status');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Status');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Estado');
INSERT INTO page_form_field_name (page_name_id,name,text_id,field_type,html_type,row_count,column_count,class_name,group_name,sub_group_name,class_model,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_FORM'),'FA_FEATURE_FORM_ACTIVE',@lastid,'BLN','radioH',0,0,null,'MAIN',null,'{"clazz":"com.pidragon.fa.model.Feature","field":"active","type":"Boolean"}',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Active","default":true},{"value":false,"label":"Disable"}]}','Status:','en',true,true,14,'',null);
INSERT INTO page_form_field_value (page_form_field_name_id,field_value,field_label,lang,rendered,required,sort_order,validation,created) VALUES ((SELECT id FROM page_form_field_name WHERE name = 'FA_FEATURE_FORM_ACTIVE'),'{"options":[{"value":true,"label":"Activo","default":true},{"value":false,"label":"Inhabilitar"}]}','Estado:','es',true,true,14,'',null);


-- Feature Page
INSERT INTO texts (default_text) VALUES ('Feature Page');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Feature Page');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Página de características');
INSERT INTO page_name (name,text_id,category) VALUES ('FA_FEATURE_PAGE',@lastid,'MEMBER');

INSERT INTO texts (default_text) VALUES ('Page Header');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Page Header');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Encabezado de página');
INSERT INTO page_text_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_PAGE'),'FA_FEATURE_PAGE_HEADER',@lastid,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'FA_FEATURE_PAGE_HEADER'),'Feature Enhancements','en',true,null);
INSERT INTO page_text_value (page_text_name_id,text_value,lang,rendered,created) VALUES ((SELECT id FROM page_text_name WHERE name = 'FA_FEATURE_PAGE_HEADER'),'Mejoras de funciones','es',true,null);

INSERT INTO texts (default_text) VALUES ('Column 1');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Column 1');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna 1');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_PAGE'),'FA_FEATURE_PAGE_COLUMN_1',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'FA_FEATURE_PAGE_COLUMN_1'),'Title','en',true,0,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'FA_FEATURE_PAGE_COLUMN_1'),'Título','es',true,0,null);

INSERT INTO texts (default_text) VALUES ('Column 2');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Column 2');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna 2');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_PAGE'),'FA_FEATURE_PAGE_COLUMN_2',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'FA_FEATURE_PAGE_COLUMN_2'),'Workflow','en',true,1,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'FA_FEATURE_PAGE_COLUMN_2'),'Flujo de trabajo','es',true,1,null);

INSERT INTO texts (default_text) VALUES ('Column 3');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Column 3');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna 3');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_PAGE'),'FA_FEATURE_PAGE_COLUMN_3',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'FA_FEATURE_PAGE_COLUMN_3'),'Start date','en',true,2,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'FA_FEATURE_PAGE_COLUMN_3'),'Fecha de inicio','es',true,2,null);

INSERT INTO texts (default_text) VALUES ('Column 4');
SET @lastid = LAST_INSERT_ID();
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'en','Column 4');
INSERT INTO langtexts (text_id,lang,text) VALUES (@lastid,'es','Columna 4');
INSERT INTO page_label_name (page_name_id,name,text_id,created) VALUES((SELECT id FROM page_name WHERE name = 'FA_FEATURE_PAGE'),'FA_FEATURE_PAGE_COLUMN_4',@lastid,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'FA_FEATURE_PAGE_COLUMN_4'),'Status','en',true,3,null);
INSERT INTO page_label_value (page_label_name_id,label_value,lang,rendered,sort_order,created) VALUES ((SELECT id FROM page_label_name WHERE name = 'FA_FEATURE_PAGE_COLUMN_4'),'Estado','es',true,3,null);


-- Services
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('FA_FEATURE_SVC','1.0','1.0','com.pidragon.fa.svc.FeatureSvcImpl','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('FA_ISSUE_SVC','1.0','1.0','com.pidragon.fa.svc.IssueSvcImpl','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('FA_RELEASE_SVC','1.0','1.0','com.pidragon.fa.svc.ReleaseSvcImpl','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('FA_BACKLOG_SVC','1.0','1.0','com.pidragon.fa.svc.BackLogSvcImpl','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('FA_CODEBRANCH_SVC','1.0','1.0','com.pidragon.fa.svc.CodeBranchSvcImpl','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('FA_BLUEPRINT_SVC','1.0','1.0','com.pidragon.fa.svc.BluePrintSvcImpl','MEMBER','LOCAL',null);
INSERT INTO service_class (service_name,api_version,app_version,class_name,category,location,created) VALUES ('FA_REQUIREMENT_SVC','1.0','1.0','com.pidragon.fa.svc.RequirementSvcImpl','MEMBER','LOCAL',null);

SET NEWPAGE NONE
SET PAGESIZE 0
SET SPACE 0
SET LINESIZE 16000
SET ECHO OFF
SET FEEDBACK OFF
SET VERIFY OFF
SET HEADING OFF
SET TERMOUT OFF
SET TRIMOUT ON
SET TRIMSPOOL ON
SET COLSEP '|'

spool 'features/support/sql/&1'

var p_project_number varchar2(20);
var p_project_uuid varchar2(36);

exec :p_project_number := '&1';
exec :p_project_uuid := '&2';

PRINT :p_project_number;
PRINT :p_project_uuid;

  DELETE
  FROM billing_event
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM content_security_audit_event
  WHERE PROJECT_NUM = :p_project_number;

  DELETE
  FROM datasite_audit_detail
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM disclaimer_audit
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM doc_audit_event
  WHERE PROJECT_NUM = :p_project_number;

  DELETE
  FROM doc_processing_document
  WHERE PROJECT_ID = :p_project_number;

  DELETE
  FROM email_audit
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM event_audit
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM hosting_metric
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM project_session
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM search_audit
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM security_details_permission
  WHERE AUTHORITY_NAME like '%P16-000-0461%';

  DELETE
  FROM security_task
  WHERE PROJECT_UUID = :p_project_uuid;

  DELETE
  FROM sox_report_run
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM user_auth_audit_event
  WHERE PROJECT_NUM = :p_project_number;

  DELETE
  FROM user_project
  WHERE PROJECT_UUID = :p_project_uuid;

  DELETE
  FROM workflow_task
  WHERE SECURITY_ROLE like '%P15-000-0421%';

  DELETE
  FROM XXCG_DIST_LOCATIONS_INTERFACE
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM XXCG_DISTRIBUTIONS_INTERFACE
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM XXCG_PROJ_NOTE_INTERFACE
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM XXCG_PROJ_REP_INTERFACE
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM XXCG_PROJECT_INTERFACE
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM XXCG_TASK_INTERFACE
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM XXCG_TRANSACTION_INTERFACE
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM MCG_SALES_REP
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM MCG_NOTE
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM MCG_LINE_ITEM
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM MCG_FILEROOM
  WHERE PROJECT_NUMBER = :p_project_number;

  DELETE
  FROM MCG_PROJECT
  WHERE PROJECT_NUMBER = :p_project_number;

spool off
exit 0;
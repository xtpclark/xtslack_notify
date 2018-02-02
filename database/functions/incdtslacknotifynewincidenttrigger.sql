CREATE OR REPLACE FUNCTION public._incdtSlackNotifyNewIncidentTrigger()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

DECLARE

 _crm TEXT;

BEGIN
 SELECT crmacct_number INTO _crm FROM crmacct WHERE crmacct_id=NEW.incdt_crmacct_id;

PERFORM
 pg_notify('slack_notify_watcher',
'*i'||NEW.incdt_number||'*-'||NEW.incdt_summary||'
'||
'Account: '||_crm
||
' Created by: '||NEW.incdt_owner_username||' IP:'||inet_client_addr()
 )::text;

  RETURN NEW;
END;
$function$;

DROP TRIGGER IF EXISTS incdtSlackNotifyNewIncidentTrigger ON public.incdt;

CREATE TRIGGER incdtSlackNotifyNewIncidentTrigger
  AFTER INSERT ON public.incdt
  FOR EACH ROW
  EXECUTE PROCEDURE public._incdtSlackNotifyNewIncidentTrigger();


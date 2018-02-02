CREATE OR REPLACE FUNCTION xtbatch._batchslacknotifyexiterrorbeforeupserttrigger()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

BEGIN

IF (NULLIF(NEW.batch_exitstatus,'') IS NOT NULL)
 THEN
  PERFORM
    pg_notify('slack_notify_watcher','*xTConnect Error:* '||NEW.batch_action||' '||NEW.batch_exitstatus||' User:'|| NEW.batch_user )::text;
END IF;
  RETURN NEW;

END;

$function$;

DROP TRIGGER IF EXISTS batchSlackNotifyExitErrorBeforeUpsertTrigger ON xtbatch.batch;

CREATE TRIGGER batchSlackNotifyExitErrorBeforeUpsertTrigger
  BEFORE INSERT OR UPDATE ON xtbatch.batch
  FOR EACH ROW
  EXECUTE PROCEDURE xtbatch._batchSlackNotifyExitErrorBeforeUpsertTrigger();

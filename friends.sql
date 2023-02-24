CREATE OR REPLACE FUNCTION table_to_json(p_table_name text) RETURNS text AS $$ 
DECLARE
    v_sql text;
    v_result text; 
BEGIN
    v_sql := 'SELECT json_agg(row_to_json(t)) FROM ' || p_table_name || ' t';
    EXECUTE v_sql INTO v_result;
    RETURN v_result;
END;    
$$ LANGUAGE plpgsql;

SELECT table_to_json('FRIENDS');
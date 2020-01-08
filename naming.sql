SET SERVEROUTPUT ON;

DECLARE
    -- Declaration of variables
    pattern_name VARCHAR2(40);
    n INTEGER;
    a VARCHAR2(1); b VARCHAR2(1); c VARCHAR2(1);
    
    TYPE each_char_array IS TABLE OF VARCHAR2(20);
    each_numbers each_char_array;
    each_patt_char each_char_array;

FUNCTION getName(num IN NUMBER, patt IN VARCHAR2) RETURN VARCHAR2 IS name VARCHAR2(40);
    BEGIN
        -- initializing table variables 
        each_numbers := each_char_array();
        each_patt_char := each_char_array();
    
        -- separating individual numbers from input number
        n := LENGTH(num);
        FOR i IN 1 .. n LOOP
            IF NOT each_numbers.exists(i) THEN
                each_numbers.extend();
                each_numbers(i) := SUBSTR(num, i, 1);
            END IF;
        END LOOP;
        
        -- separating individual characters from input pattern
        n := LENGTH(patt);
        FOR i IN 1 .. n LOOP
            IF NOT each_patt_char.exists(i) THEN
                each_patt_char.extend();
                each_patt_char(i) := SUBSTR(patt, i, 1);
            END IF;
        END LOOP;
        
        
        FOR i IN each_patt_char.FIRST .. each_patt_char.LAST LOOP
            IF(i = each_patt_char.FIRST) THEN
                dbms_output.put_line('first');
            ELSIF(i = each_patt_char.LAST) THEN
                dbms_output.put_line('last');
            ELSE
                dbms_output.put_line('middle');
            END IF;
        END LOOP;
        
        name:= 'double';
        RETURN name;
    END;

BEGIN
    pattern_name := getName(2233, 'xxyy');
    -- dbms_output.put_line(pattern_name);
END;

SET SERVEROUTPUT ON;

DECLARE
    TYPE num_table IS TABLE OF VARCHAR2(20) INDEX BY VARCHAR2(20);
    TYPE labell IS TABLE Of VARCHAR2(20) INDEX BY VARCHAR2(20);
    TYPE exp IS TABLE Of VARCHAR2(20) INDEX BY VARCHAR2(20);
    x NUMBER ;
    type namesarray IS VARRAY(5) OF VARCHAR2(10);
    name namesarray;
    type numarray IS TABLE OF VARCHAR2(20); 
    char VARCHAR2(20);
    numss numarray ;
    n integer;
    countt integer;
    tables num_table;
    nums2 numarray ;
    nums3 numarray;
    labels labell ;
    expr exp ;
    patt VARCHAR2(20);
    
    
FUNCTION getPattern(X IN NUMBER)RETURN VARCHAR2 IS patt VARCHAR2(20);
    
    BEGIN
        name := namesarray('x','y','z','w');  
        char := to_char(X);  
        n := LENGTH(char);
        --DBMS_OUTPUT.PUT_LINE(LPAD(char,10));
        numss := numarray();
    
        for i in 1 .. n LOOP 
            IF  not numss.exists(i) THEN
                numss.extend;
                numss(i) := SUBSTR(char, i, 1);
            END IF;
        END LOOP;
        --DBMS_OUTPUT.PUT_LINE(numss(2)); 
        nums3 := numss;
        nums2 := numss;
        numss := numss MULTISET UNION DISTINCT nums2;
        for i in numss.FIRST .. numss.LAST LOOP
        --DBMS_OUTPUT.PUT_LINE(i);
            n := REGEXP_COUNT(char,numss(i));
            tables(numss(i)) := n;
            if (n>=2) then
                labels(numss(i)) := 'multiple';
            else
                labels(numss(i)) := 'single'; 
            end if;
        --DBMS_OUTPUT.PUT_LINE(numss(i)||'----------------'||tables(numss(i))||'---------'||labels(numss(i)));   
        END LOOP;
        countt := 1;
        for i in numss.FIRST .. numss.LAST loop
            if (labels(numss(i)) = 'multiple') then
                --DBMS_OUTPUT.PUT_LINE(i);
               expr(numss(i)) := name(countt);
                countt := countt + 1;
            else
                expr(numss(i)) := 'o';
            --DBMS_OUTPUT.PUT_LINE(i);
            end if;
        --DBMS_OUTPUT.PUT_LINE(labels(numss(i))||'---------- ------'||numss(i)||expr(numss(i)));
        end loop;
        patt := '';
        --DBMS_OUTPUT.PUT_LINE(tables('2'));
        for i in nums3.First .. nums3.LAST loop
        --DBMS_OUTPUT.PUT_LINE(nums3(i)||'-----------------'||tables(nums3(i))||'--------------'||labels((nums3(i)))||'-------'||expr(nums3(i)));
            if (expr(nums3(i)) != 'o') then
                patt := concat(patt,expr(nums3(i)));
             --DBMS_OUTPUT.PUT_LINE(nums3(i));
            else 
                patt := concat(patt,'*');
            end if;
        end loop;
        --DBMS_OUTPUT.PUT_LINE(x||'----------------------'||patt);
        RETURN patt;
    END;  
    

BEGIN 
    x := 4455611;
   patt := getPattern(x); 
   DBMS_OUTPUT.PUT_LINE(x||'----------------------'||patt);
END; 

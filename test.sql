SET SERVEROUTPUT ON;
DECLARE
    pattern_name VARCHAR2(50);

FUNCTION getName(pattern IN VARCHAR2) RETURN VARCHAR2 IS name VARCHAR2(50);
    BEGIN
        IF (REGEXP_LIKE(pattern, '\+7')) THEN
            name := 'Ladder of 8 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '\-7')) THEN
            name := 'Ladder of 8 dec';
            
        ELSIF (REGEXP_LIKE(pattern, '\+6')) THEN
            name := 'Ladder of 7 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '\-6')) THEN
            name := 'Ladder of 7 dec';
        
        ELSIF (REGEXP_LIKE(pattern, '\+5')) THEN
            name := 'Ladder of 6 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '\-5')) THEN
            name := 'Ladder of 6 dec';
            
        ELSIF (REGEXP_LIKE(pattern, '\+4')) THEN
            name := 'Ladder of 5 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '\-4')) THEN
            name := 'Ladder of 5 dec';
            
        ELSIF (REGEXP_LIKE(pattern, '\+3')) THEN
            name := 'Ladder of 4 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '\-3')) THEN
            name := 'Ladder of 4 dec';
        
        ELSIF (REGEXP_COUNT(pattern, '\+2') = 2) THEN
            name := 'Ladder of 3 3 inc inc';
            
        ELSIF (REGEXP_COUNT(pattern, '\-2') = 2) THEN
            name := 'Ladder of 3 3 dec dec';
            
        ELSIF (REGEXP_LIKE(pattern, '\+2') and REGEXP_LIKE(pattern, '\-2')) THEN
            name := 'Ladder of 3 3 inc dec';
        
        ELSIF (REGEXP_COUNT(pattern, 'x') = 8) THEN
            name := 'same 8';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1\1') = 2) THEN
            name := 'same 4 double adj';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1\1\1\1\1') = 1) THEN
            name := 'same 7 adj';
        
        ELSIF (REGEXP_COUNT(pattern, 'x') = 7) THEN
            name := 'same 7 non adj';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 2 and REGEXP_COUNT(pattern, '([xyz])\1') = 4 
                and (REGEXP_COUNT(pattern, 'x') = 6) or (REGEXP_COUNT(pattern, 'y') = 6)
                or (REGEXP_COUNT(pattern, 'z') = 6)) THEN
            name := '2 triplets 1 pair same number';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1\1\1\1') = 1) THEN
            name := 'same 6 adj';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 1 and REGEXP_COUNT(pattern, '([xyz])\1') = 3 
                and (REGEXP_COUNT(pattern, 'x') = 5) or (REGEXP_COUNT(pattern, 'y') = 5)
                or (REGEXP_COUNT(pattern, 'z') = 5)) THEN
            name := '1 triplet 2 pairs same number';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1\1\1') = 1) THEN
            name := 'same 5 adj';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1\1') = 1) THEN
            name := 'same 4 adj';  
        
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 2 and REGEXP_COUNT(pattern, '([xyz])\1') = 3) THEN
            name := '2 triplets 1 pair';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 2) THEN
            name := '2 triplets';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 1 and REGEXP_COUNT(pattern, '([xyz])\1') = 3) THEN
            name := '1 triplet and 2 pairs';
        
        ELSIF (REGEXP_COUNT(pattern, 'x') = 6) THEN
            name := 'same 6 non adj';
        
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1') = 4) THEN
            name :=  '4 doubles including same number';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyzw]\1)') = 4) THEN
            name := '4 doubles';
            
        ELSIF (REGEXP_COUNT(pattern, '([xy])\1') = 3) THEN
            name :=  '3 doubles including same number';
        
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1') = 3) THEN
            name :=  '3 doubles';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1') = 2) THEN
            name :=  '2 pairs any where';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 1) THEN
            name := '1 triplet';
        
        ELSIF (REGEXP_LIKE(pattern, 'xyzwwzyx')) THEN
            name := 'mirror 8';
            
        ELSIF (REGEXP_LIKE(pattern, 'xyzwzyx')) THEN
            name := 'mirror 7';
        
        ELSIF (REGEXP_LIKE(pattern, 'xyzzyx')) THEN
            name := 'abccba';
        
        ELSIF (REGEXP_LIKE(pattern, 'xyxzxz')) THEN
            name := 'abacac';
            
        ELSIF (REGEXP_LIKE(pattern, 'xzxyxy')) THEN
            name := 'acabab';
            
        ELSIF (REGEXP_COUNT(pattern, '(xyzw)') = 2) THEN
            name := 'abcd abcd';
        
        ELSIF (REGEXP_COUNT(pattern, '(xyz)') = 2) THEN
            name := 'abc abc';
            
        ELSIF (REGEXP_COUNT(pattern, '(xyy)') = 2) THEN
            name := 'abb abb';
            
        ELSIF (REGEXP_COUNT(pattern, '(xy)') = 3) THEN
            name := 'ababab anywhere';
            
        ELSIF (REGEXP_COUNT(pattern, 'x') = 5) THEN
            name := 'same 5 non adj';
            
        ELSIF (REGEXP_COUNT(pattern, 'x') = 4) THEN
            name := 'same 4 non adj'; 
          
        ELSE
            name := 'no match found';
        END IF;
        RETURN name;
    END;

BEGIN
    pattern_name := getName('xyxy**xy');
    dbms_output.put_line('name: ' || pattern_name);
END;
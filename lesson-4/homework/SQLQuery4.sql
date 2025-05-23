SELECT letter
FROM letters
ORDER BY 
    CASE 
        WHEN letter = 'b' THEN 0
        ELSE 1
    END,
    letter;


SELECT letter
FROM letters
ORDER BY 
    CASE 
        WHEN letter = 'b' THEN 1
        ELSE 0
    END,
    letter;


SELECT letter
FROM letters
ORDER BY 
    CASE 
        WHEN letter = 'b' THEN 2       -- `'b'` is given weight `2` to ensure it appears 3rd
        WHEN letter < 'b' THEN 1       -- Letters alphabetically before `'b'` come first
        WHEN letter > 'b' THEN 3       -- Letters alphabetically after `'b'` come after 3rd position
    END,
    letter;


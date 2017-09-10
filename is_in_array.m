function k = is_in_array(a, string) % se verifica daca caracterul string este
  % in sirul de caractere a
  p = length(a);
  n = 0 % numarul de aparitii al caracterului string in a
  for i = 1:p;
    if (string == a(1, i))
      n++; % daca apare, se incrementeaza numarul de aparitii
    endif
  endfor
  if (n > 0) % se verifica care e numarul de aparitii in sirul a al lui string 
    k = 1; % da, este in sirul a
  else
    k = 0; % nu, nu e in sirul a
  endif
endfunction
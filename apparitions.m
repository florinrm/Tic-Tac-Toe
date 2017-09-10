function n = apparitions(str, character) %se calculeaza numarul de aparitii al unui
% caracter intr-un string
  p = length(str); %numarul total de caractere din string 
  n = 0; % initializarea numarului de aparitii 
  for i = 1:p % parcurgerea sirului de caractere str
    if (str(1, i) == character)
      n++; % daca apare caracterul respectiv in stringul dat, se calculeaza numarul
      % de aparitii al acestuia
    endif
  endfor
endfunction
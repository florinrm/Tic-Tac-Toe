function ok = is_in_position_game(table, i, j, character) %se verifica daca un caracter e intr-o pozitie anume
  line = i - '0'; % indici de pozitie
  row = 2 * (j - '0');
  ok = 0; % initializarea valorii de retur, care va ramane asa daca nu se verifica
  % conditia de mai jos
  if (table(line, row) == character)
    ok = 1; % da, este in tabel caracterul character
  endif
endfunction
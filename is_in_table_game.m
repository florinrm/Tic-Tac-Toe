function n = is_in_table_game(table, string) % se verifica daca un caracter e
  % in tabela
  if ((is_in_array(table(1, :), string) == 1)||(is_in_array(table(1, :), string) == 1)
     ||(is_in_array(table(1, :), string) == 1))
     % verificarea linie cu linie
    n = 1; % da, este in tabel caracterul dat
  else
    n = 0; % nu, nu este in tabel
  endif
endfunction
function game_table = position_game (table, i, j, character) %insereaza un element intr-o pozitie precizata
  line = i - '0'; % conversia din string in numar - line si row
  row = 2 * (j - '0'); % inmultim cu 2 caci pozitia lui _, X si 0 este para in
  % cadrul tabelei noastre
  game_table = table; % copierea tabelei in tabela de retur 
  game_table(line, row) = character; % inserarea in pozitia precizata
endfunction
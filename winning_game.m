function yes = winning_game(table, done) % se verifica daca se afla X sau 0 pe
% aceeasi coloana, linie sau diagonala in tabel
  yes = 0; % initializam valoarea de retur, care va ramane asa daca nu sunt
  % indeplinite conditiile de mai jos
  if (((table(1, 2) == done) && (table(1, 4) == done) && (table(1, 6) == done)) ||
    ((table(2, 2) == done) && (table(2, 4) == done) && (table(2, 6) == done)) ||
    ((table(3, 2) == done) && (table(3, 4) == done) && (table(3, 6) == done)) ||
    ((table(1, 2) == done) && (table(2, 2) == done) && (table(3, 2) == done)) ||
    ((table(1, 4) == done) && (table(2, 4) == done) && (table(3, 4) == done)) ||
    ((table(1, 6) == done) && (table(2, 6) == done) && (table(3, 6) == done)) ||
    ((table(1, 2) == done) && (table(2, 4) == done) && (table(3, 6) == done)) ||
    ((table(1, 6) == done) && (table(2, 4) == done) && (table(3, 2) == done)))
      yes = 1; % asta inseamna ca X sau 0 se afla pe aceeasi coloana, linie sau
      % diagonala
  endif
endfunction
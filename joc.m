function [] = joc()
  table = ["|_|_|_|"; "|_|_|_|"; "|_|_|_|"]; % tabelul jocului
  printf("How do you want to play? Press q to quit now\n");
  human = input("Choose between X and 0\n", "s"); % cum va juca utilizatorul
  disp(table);
  if (human == "q") % daca utizatorul doreste sa iasa din joc, se va iesi
  % din joc la apasarea tastei q
    printf("You've just quit the game\n"); % mesaj de iesire din joc
    return; % iesirea din joc
  endif
  while ((human != "X") && (human != "0")) % daca nu se alege nimic intre X si 0
  % (cu exceptia q, prin care se iese automat din joc), utilizatorul va fi pus
  % sa aleaga din nou
    printf("Please, choose either X or 0\n");
    human = input("Choose between X and 0\n", "s"); % realegerea de X sau 0
  count = 0; % verificam cine incepe primul - 0 utilizatorul sau 1 calculatorul
  endwhile
  if (human == "X") % daca utilizatorul a ales X, computerul alege 0 sau viceversa
    computer = "0";
    count = 0; % incepe utilizatorul
  else 
    computer = "X";
    count = 1; % incepe calculatorul
  endif
  % atat timp cat "_" e in tabel sau daca s-a completat pe diagonala 
  % sau pe orizontala sau verticala
  if (count == 0)
    printf("Choose a position, please\n");
    i = input("Choose a position for lines or quit the game\n", "s");
    if (i == "q")
     disp("Game ended");
     return;
    endif
    j = input("Choose a position for rows\n", "s");
    while (((i != "1")&&(i != "2")&&(i != "3"))||((j != "1")&&(j != "2")&&(j != "3")))
     % daca indicii de pozitie nu sunt corespunzatori, utilizatorul va fi pus sa
    % aleaga alti indici de pozitie 
      printf("Please, choose a valid position index!\n");
      i = input("Choose a position for lines\n", "s");
      j = input("Choose a position for rows\n", "s");
    endwhile
  endif
  %strategii pentru joc in modul impossible pe pozitii, vede cate casute libere sunt 
  %daca nu, lasa cu random pur si simplu
  human_score = 0; % scorul utilizatorului
  computer_score = 0; % scorul calculatorului
  while (i != "q") % atata timp cat nu se apare q pentru iesire din joc
    %jocul propriu zis
    if ((is_in_table_game(table, "_") == 1) && (winning_game(table, computer) == 0) && (winning_game(table, human) == 0))
      if (count == 0)
        table = position_game(table, i, j, human); % inserarea intr-o pozitie data
        % atata timp cat tabela nu e completata sau daca jocul a fost castigat
        disp(table);
        if (winning_game(table, human) == 0) % daca jocul a fost castigat de catre
        % utilizator, calculatorul nu va mai alege pozitia pentru joc, care s-a terminat
          computer_i = randi(3); % alegerea pozitiilor random de catre calculator
          computer_j = randi(3);
          computer_i = mat2str(computer_i); % conversia din numar in string
          computer_j = mat2str(computer_j);
          while ((is_in_position_game(table, computer_i, computer_j, "X") == 1) || 
          (is_in_position_game(table, computer_i, computer_j, "0") == 1))
          % daca pozitiile alese mai devreme deja contin X sau 0, se va alege alta
          % pozitie pana cand se va da de o pozitie care nu are X sau 0
            computer_i = randi(3);
            computer_j = randi(3);
            computer_i = mat2str(computer_i);
            computer_j = mat2str(computer_j);
          endwhile
        endif
        table = position_game(table, computer_i, computer_j, computer);
        disp(table);
        % inserarea in tabel a alegerii computer-ului
      elseif (count == 1)
        if (winning_game(table, human) == 0) % daca jocul a fost castigat de catre
        % utilizator, calculatorul nu va mai alege pozitia pentru joc, care s-a terminat
          computer_i = randi(3); % alegerea pozitiilor random de catre calculator
          computer_j = randi(3);
          computer_i = mat2str(computer_i); % conversia din numar in string
          computer_j = mat2str(computer_j);
          while ((is_in_position_game(table, computer_i, computer_j, "X") == 1) || 
          (is_in_position_game(table, computer_i, computer_j, "0") == 1))
          % daca pozitiile alese mai devreme deja contin X sau 0, se va alege alta
          % pozitie pana cand se va da de o pozitie care nu are X sau 0
            computer_i = randi(3);
            computer_j = randi(3);
            computer_i = mat2str(computer_i);
            computer_j = mat2str(computer_j);
          endwhile
        endif
        table = position_game(table, computer_i, computer_j, computer);
        disp(table);
        printf("Choose a position, please\n");
        i = input("Choose a position for lines or quit the game\n", "s");
        if (i == "q")
          disp("Game ended");
          return;
        endif
        j = input("Choose a position for rows\n", "s");
        while (((i != "1")&&(i != "2")&&(i != "3"))||((j != "1")&&(j != "2")&&(j != "3")))
          % daca indicii de pozitie nu sunt corespunzatori, utilizatorul va fi pus sa
          % aleaga alti indici de pozitie 
          printf("Please, choose a valid position index!\n");
          i = input("Choose a position for lines\n", "s");
          j = input("Choose a position for rows\n", "s");
        endwhile
        table = position_game(table, computer_i, computer_j, computer);
        disp(table);
        % inserarea in tabel a alegerii computer-ului
        table = position_game(table, i, j, human); % inserarea intr-o pozitie data
        % atata timp cat tabela nu e completata sau daca jocul a fost castigat
        disp(table);
      endif
    endif
    if (winning_game(table, computer) == 1)
     % in cazul in care calculatorul castiga
      computer_score++;
      printf("\nYou lost! The score is:\n%d - %d\n", human_score, computer_score);
      % afisarea scorului cu mesajul de partida pierduta
      table = ["|_|_|_|"; "|_|_|_|"; "|_|_|_|"]; % reinitializarea tabelului
      disp(table);
    elseif (winning_game(table, human) == 1)
      % in cazul in care utilizatorul castiga
      human_score++;
      printf("\nYou won! The score is:\n%d - %d\n", human_score, computer_score);
      % afisarea scorului cu mesajul de partida castigata
      table = ["|_|_|_|"; "|_|_|_|"; "|_|_|_|"];
      disp(table);
    endif
    if ((is_in_table_game(table, "_") == 0)) % in caz de remiza
      printf("\nDraw! The score is:\n%d - %d\n", human_score, computer_score)
      % afisarea scorului cu mesajul de partida terminata la egalitate
      table = ["|_|_|_|"; "|_|_|_|"; "|_|_|_|"];
      disp(table);
    endif
    if (count == 0)
    i = input("Choose a position for lines or quit the game by pressing q\n", "s");
    % linia din tabel
    if (i == "q") % iesirea din joc
      return;
    endif;
    j = input("Choose a position for row\n", "s");
    % coloana din tabel
      while ((((i != "1")&&(i != "2")&&(i != "3"))||((j != "1")&&(j != "2")&&(j != "3")))||(is_in_position_game(table, i, j, "0") == 1)||(is_in_position_game(table, i, j, "X") == 1))
        % daca indicii nu sunt buni sau daca utilizatorul alege unde e deja
        % completat, el va fi pus sa alega alti indici de pozitie
        printf("Please, choose a valid position index!\n");
        i = input("Choose a position for lines or quit the game by pressing q\n", "s");
        if (i == "q") % iesirea din joc
          return;
        endif
        j = input("Choose a position for row\n", "s");
        disp(table); % afisarea tabelului
      endwhile
    elseif (count == 1)
       computer_i = randi(3); % alegerea pozitiilor random de catre calculator
       computer_j = randi(3);
       computer_i = mat2str(computer_i); % conversia din numar in string
       computer_j = mat2str(computer_j);
       while ((is_in_position_game(table, computer_i, computer_j, "X") == 1) || 
       (is_in_position_game(table, computer_i, computer_j, "0") == 1))
       % daca pozitiile alese mai devreme deja contin X sau 0, se va alege alta
       % pozitie pana cand se va da de o pozitie care nu are X sau 0
         computer_i = randi(3);
         computer_j = randi(3);
         computer_i = mat2str(computer_i);
         computer_j = mat2str(computer_j);
       endwhile
    endif
  endwhile
  disp("Game ended\n"); % joc terminat
endfunction
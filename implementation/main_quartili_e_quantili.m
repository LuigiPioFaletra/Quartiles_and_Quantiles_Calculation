% Main da eseguire per il calcolo dei quartili e dei quantili
% Esempio 1: alle richieste del programma, premere nell'ordine:
% 2, 1, 1, 4, 0, 0.5, 10, 1, 8, 1.5, 6, 2, 3
% Input:    |   Classi   |   fi   |   pi   |   Fi   |
%           |  [0,0.5[   |   10   |  0.37  |  0.37  |
%           |  [0.5,1[   |    8   |  0.3   |  0.67  |
%           |  [1,1.5[   |    6   |  0.22  |  0.89  |
%           |  [1.5,2]   |    3   |  0.11  |  1     |
% Output programma:     q0.25=0.34    q0.5=0.72     q0.75=1.18
% Output carta e penna: q0.25=0.34    q0.5=0.72     q0.75=1.2
% Esempio 2: alle richieste del programma, premere nell'ordine:
% 2, 2, 2, 6, 5, 1, 6, 5, 7.5, 6, 8.5, 3, 9, 4, 10, 1, 80, 1, 90, 2
% Input:    |    Voto    |   fi   |   pi   |   Fi   |
%           |      5     |    1   |  0.05  |  0.05  |
%           |      6     |    5   |  0.25  |  0.3   |
%           |     7.5    |    6   |  0.3   |  0.6   |
%           |     8.5    |    3   |  0.15  |  0,75  |
%           |      9     |    4   |  0.2   |  0.95  |
%           |     10     |    1   |  0.05  |  1     |
% Output programma:     q0.8=8.63    q0.9=8.88
% Output carta e penna: q0.8=8.62    q0.9=8.875

clear all               % Rimozione di tutti gli elementi nel workspace
close all               % Chiusura di tutte le figure e i grafici aperti
clc                     % Pulizia della finestra di comando

dataset_proposti=5;     % Numero di dataset pronti e utilizzabili
k=4;                    % Numero di classi previste usando i dataset
numero_max_classi=20;   % Numero massimo di classi previste senza i dataset
numero_max_valori=20;   % Numero massimo di valori previsti senza i dataset
limite_minimo=-1000;    % Cifra minima da inserire immettendo i valori
% Messaggio di esplicitazione del compito eseguito dal programma
fprintf("Programma che esegue il calcolo dei quartili, dei quantili e degli indici di dispersione\nPer chiudere il programma, usare Ctrl+C\n");
[creazione,tipo_classi,tipo_quantili]=dati_input();     % Utilizzo funzione
                                                        % "dati_input"
if creazione==1 && tipo_classi==1       % Caso di creazione classi espresse
                                        % come intervalli e con dataset
    % Utilizzo funzione "procedura_intervalli_con_e_senza_dataset"
    [T,quantili,quartili,indici_di_asimmetria]=procedura_intervalli_con_e_senza_dataset(creazione,dataset_proposti,k,tipo_classi,tipo_quantili);
elseif creazione==1 && tipo_classi==2   % Caso di creazione classi espresse
                                        % come valori e con dataset
    % Utilizzo funzione "procedura_valori_con_e_senza_dataset"
    [T1,T2,quantili,quartili,indici_di_asimmetria]=procedura_valori_con_e_senza_dataset(creazione,dataset_proposti,k,tipo_classi,tipo_quantili);
elseif creazione==2 && tipo_classi==1   % Caso di creazione classi espresse
                                        % come intervalli e senza dataset
    % Utilizzo funzione "procedura_intervalli_con_e_senza_dataset"
    [T,quantili,quartili,indici_di_asimmetria]=procedura_intervalli_con_e_senza_dataset(creazione,limite_minimo,numero_max_classi,tipo_classi,tipo_quantili);
elseif creazione==2 && tipo_classi==2   % Caso di creazione classi espresse
                                        % come valori e senza dataset
    % Utilizzo funzione "procedura_valori_con_e_senza_dataset"
    [T1,T2,quantili,quartili,indici_di_asimmetria]=procedura_valori_con_e_senza_dataset(creazione,limite_minimo,numero_max_valori,tipo_classi,tipo_quantili);
end
clear creazione;            % Rimozione della modalità di creazione classi
clear dataset_proposti;     % Rimozione del numero di dataset disponibili
clear limite_minimo;        % Rimozione del limite minimo per i valori
clear k;                    % Rimozione del numero di classi con dataset
clear numero_max_classi;    % Rimozione del numero massimo di classi
clear numero_max_valori;    % Rimozione del numero massimo di valori
clear tipo_classi;          % Rimozione del modo di esprimere le classi
if tipo_quantili==1         % Caso in cui si calcolano solo i quartili
    clear quantili;         % Rimozione della matrice dei quantili
elseif tipo_quantili==2     % Caso in cui si calcolano solo i quantili
    clear quartili;         % Rimozione della matrice dei quartili
end
clear tipo_quantili;        % Rimozione del tipo di quantili da calcolare
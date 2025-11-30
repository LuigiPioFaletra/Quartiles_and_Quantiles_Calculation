function [creazione,tipo_classi,tipo_quantili]=dati_input()
% Funzione di inserimento di dati da input
% creazione specifica se creare la tabella con o senza dataset
% tipo_classi è il numero che esprime se le classi sono intervalli o valori
% tipo_quantili è il valore che specifica se si vogliono calcolare solo i
% quartili o solo i quantili o entrambi

creazione=0;        % Inizializzazione del valore di creazione
tipo_classi=0;      % Inizializzazione del valore di tipo_classi
tipo_quantili=0;    % Inizializzazione del valore di tipo_quantili
% Ciclo di controllo degli errori inserendo il valore di creazione
while creazione<1 || creazione>2
    % Procedura di inserimento della modalità di creazione delle classi
    creazione=input("\nScelta 1 - Utilizzo di un dataset già esistente\nScelta 2 - Nessun utilizzo di dataset\nScegliere come creare le classi: ");
    if creazione<1 || creazione>2           % Caso di valore errato per
                                            % creazione
       % Messaggio di errore per creazione
       fprintf("\nErrore! Deve essere inserito un valore che sia 1 o 2!");
    end
end
% Ciclo di controllo degli errori inserendo il valore di tipo_classi
while tipo_classi<1 || tipo_classi>2
    % Procedura di inserimento della modalità di espressione delle classi
    tipo_classi=input("\nScelta 1 - Classi espresse come intervalli\nScelta 2 - Classi espresse come valori\nScegliere come esprimere le classi: ");
    if tipo_classi<1 || tipo_classi>2       % Caso di valore errato per
                                            % tipo_classi
       % Messaggio di errore per tipo_classi
       fprintf("\nErrore! Deve essere inserito un valore che sia 1 o 2!");
    end
end
% Ciclo di controllo degli errori inserendo il valore di tipo_quantili
while tipo_quantili<1 || tipo_quantili>3
    % Procedura di inserimento della tipologia di quantili da calcolare
    tipo_quantili=input("\nScelta 1 - Quartili\nScelta 2 - Quantili\nScelta 3 - Entrambi\nScegliere la tipologia di quantili da calcolare: ");
    if tipo_quantili<1 || tipo_quantili>3   % Caso di valore errato per
                                            % tipo_quantili
       % Messaggio di errore per tipo_quantili
       fprintf("\nErrore! Deve essere inserito un valore compreso tra 1 e 3!");
    end
end
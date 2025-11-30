function [T1,T2,Fi,intervalli]=costruzione_tabella_con_valori(creazione,fi,n,Valori)
% Funzione di costruzione della tabella con classi di valori, frequenze
% assolute, relative e cumulate per ogni classe, con e senza dataset
% creazione specifica se creare la tabella con o senza dataset
% fi è il vettore colonna contenente le frequenze assolute per ogni classe
% n è il numero di valori da inserire nelle classi, nonché la somma di
% tutte le frequenze assolute
% Valori è il vettore riga contenente i valori inseriti dall'utente
% T1 è la tabella avente al suo interno i valori e ogni propria frequenza
% T2 è la tabella avente al suo interno le classi e ogni propria frequenza
% Fi è il vettore colonna contenente le frequenze cumulate per ogni classe
% intervalli è il vettore riga contenente gli estremi di ogni classe

Classi=[];      % Inizializzazione del vettore colonna Classi
pi=[];          % Inizializzazione del vettore colonna pi
Fi=[];          % Inizializzazione del vettore colonna Fi
for i=1:length(Valori)                  % Ciclo di riempimento dei vettori
                                        % colonna appena inizializzati
    pi=[pi;round(fi(i)/n,2)];   % Incolonnamento delle frequenze relative
    if i==1     % Caso in cui si esprimono gli estremi della prima classe
        Fi=[Fi;pi(i)];          % Incolonnamento delle frequenze cumulate
        stringa="[0-"+Fi(i)+"[";            % Scrittura estremi con solo
                                            % il primo di essi compreso
    else        % Caso in cui si esprimono gli estremi delle altre classi
        Fi=[Fi;Fi(i-1)+pi(i)];  % Incolonnamento delle frequenze cumulate
        stringa="["+Fi(i-1)+"-"+Fi(i)+"[";  % Scrittura estremi con solo
                                            % il primo di essi compreso
    end
    Classi=[Classi;stringa];    % Incolonnamento delle classi
end
intervalli=Valori;          % Uguaglianza elementi di intervalli e Valori
if creazione==1             % Caso in cui si utilizza un dataset
    fi=fi.';    % Trasformazione di fi da vettore riga a vettore colonna
end
Valori=Valori.';            % Trasformazione di Valori da vettore riga a
                            % vettore colonna
T1=table(Valori,fi,pi,Fi)   % Visualizzazione della tabella con valori
T2=table(Classi,fi,pi,Fi)   % Visualizzazione della tabella con intervalli
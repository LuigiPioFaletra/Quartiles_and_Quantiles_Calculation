function [T,Fi]=costruzione_tabella_con_intervalli(creazione,fi,intervalli,n)
% Funzione di costruzione della tabella con classi di intervalli, frequenze
% assolute, relative e cumulate per ogni classe, con e senza dataset
% creazione specifica se creare la tabella con o senza dataset
% fi è il vettore colonna contenente le frequenze assolute per ogni classe
% intervalli è il vettore riga contenente gli estremi di ogni classe
% n è il numero di valori da inserire nelle classi, nonché la somma di
% tutte le frequenze assolute
% T è la tabella avente al suo interno le classi e ogni propria frequenza
% Fi è il vettore colonna contenente le frequenze cumulate per ogni classe

Classi=[];      % Inizializzazione del vettore colonna Classi
pi=[];          % Inizializzazione del vettore colonna pi
Fi=[];          % Inizializzazione del vettore colonna Fi
for i=1:length(intervalli)-1    % Ciclo di riempimento dei vettori colonna
                                % appena inizializzati
    % Scrittura degli intervalli con solo il primo estremo compreso
    stringa="["+round(intervalli(i),2)+"-"+round(intervalli(i+1),2)+"[";
    Classi=[Classi;stringa];    % Incolonnamento delle classi
    pi=[pi;round(fi(i)/n,2)];   % Incolonnamento delle frequenze relative
    if i==1                     % Caso in cui si tratta la frequenza
                                % relativa della prima classe
        Fi=[Fi;pi(i)];          % Incolonnamento delle frequenze cumulate
    else                        % Caso in cui si trattano le frequenze
                                % relative delle classi successive
        Fi=[Fi;Fi(i-1)+pi(i)];  % Incolonnamento delle frequenze cumulate
    end
end
if creazione==1                 % Caso in cui si utilizza un dataset
    fi=fi.';    % Trasformazione di fi da vettore riga a vettore colonna
end
T=table(Classi,fi,pi,Fi)    % Visualizzazione della tabella con intervalli
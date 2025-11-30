function [intervalli,k,n,w]=scelta_dataset(dataset_proposti,tipo_classi)
% Funzione di selezione dataset ed estrazione di una sua colonna di valori
% dataset_proposti è il numero di dataset pronti e utilizzabili
% tipo_classi è il numero che esprime se le classi sono intervalli o valori
% intervalli è il vettore riga contenente gli estremi di ogni classe
% k è il numero di classi previste usando i dataset
% n è il numero di valori da inserire nelle classi, nonché la somma
% di tutte le frequenze assolute
% w è il vettore colonna di elementi della colonna estratta dal dataset

dataset=0;                  % Inizializzazione del valore di dataset
intervalli=[];              % Inizializzazione del vettore intervalli
% Ciclo di controllo degli errori inserendo il numero del dataset
while dataset<1 || dataset>dataset_proposti
    % Messaggio per il numero del dataset
    fprintf("\nDataset 1 - Automobili\nDataset 2 - Cellulari\nDataset 3 - Laptop\nDataset 4 - Libri\nDataset 5 - Stati mondiali\nScegliere il dataset da utilizzare (Da 1 a %d)",dataset_proposti);
    dataset=input(": ");    % Inserimento del numero del dataset
    % Caso di valore errato per dataset
    if dataset<1 || dataset>dataset_proposti
        % Messaggio di errore per dataset
        fprintf("\nErrore! Deve essere inserito un valore compreso tra 1 e %d!",dataset_proposti);
    end
end
cartella=pwd+"\dataset\";   % Scrittura del percorso per il dataset
% Scrittura di un vettore riga con i nomi dei dataset in formato tsv
nomi=["Automobili.tsv", "Cellulari.tsv", "Laptop.tsv", "Libri.tsv", "Stati mondiali.tsv"];
% Lettura del dataset scelto
T=readtable(cartella+nomi(dataset), "FileType", "text", "Delimiter", "\t");
switch dataset      % Selezione della colonna del dataset da estrarre
    case {1,3,5}
        colonna=5;  % Selezione della 5° colonna per 1°, 3° e 5° dataset
    case 2
        colonna=6;  % Selezione della 6° colonna per 2° dataset
    case 4
        colonna=4;  % Selezione della 4° colonna per 4° dataset
end
w=T{:,colonna};         % Creazione vettore colonna con i valori estratti
n=length(w);            % Ricavo del numero di elementi del vettore colonna
k=(fix(sqrt(n)))+1;     % Calcolo del numero di classi della popolazione
R=max(w)-min(w);        % Calcolo differenza tra massimo e minimo dei dati
valore=min(w);          % Individuazione del valore minimo tra i dati
a=R/k;                  % Calcolo dell'ampiezza delle classi
% Realizzazione di intervalli aventi la stessa lunghezza per le classi
for i=1:k+1
    intervalli=[intervalli,valore];     % Inserimento valore in intervalli
    valore=valore+a;                    % Incremento di valore con a
end
% Visualizzazione di numero e ampiezza delle classi per i dati disponibili
fprintf("\nIl numero di dati a disposizione è n=%d",n);
fprintf("\nIl numero di classi necessarie per i dati disponibili è k=[√n]+1=%d",(fix(sqrt(n))));
fprintf("+1=%d",k);
if tipo_classi==1
    fprintf("\nIl campo di variazione dei dati è R=%d",R);
    fprintf("\nL'ampiezza delle classi è a=R/k=%d",R);
    fprintf("/%d",k);
    fprintf("=%d",a);
end
fprintf("\n");
function [T1,T2,quantili,quartili,indici_di_asimmetria]=procedura_valori_con_e_senza_dataset(creazione,dataset_o_limite,k_o_kmax,tipo_classi,tipo_quantili)
% Funzione di creazione delle classi espresse come valori con dataset
% creazione specifica se creare la tabella con o senza dataset
% dataset_o_limite è il numero di dataset pronti e utilizzabili, nel caso
% di uso di dataset, o la cifra minima da inserire immettendo l'estremo
% inferiore del primo intervallo, nel caso di mancato uso di dataset
% k_o_kmax è il numero di classi previste usando i dataset o il numero
% massimo di classi previste senza i dataset
% tipo_classi è il numero che esprime se le classi sono intervalli o valori
% tipo_quantili è il valore che specifica se si vogliono calcolare solo i
% quartili o solo i quantili o entrambi
% T1 è la tabella avente al suo interno i valori e ogni propria frequenza
% T2 è la tabella avente al suo interno le classi e ogni propria frequenza
% quantili è la matrice n*n contenente i nomi dei quantili e dei relativi
% percentili e i rispettivi valori
% quartili è la matrice 3x2 contenente i nomi dei quartili e dei relativi
% percentili e i rispettivi valori
% indici_di_asimmetria è il vettore con gli indici di asimmetria calcolati

if creazione==1         % Caso di creazione delle classi con dataset
    dataset_proposti=dataset_o_limite;  % Uguaglianza tra dataset_proposti
                                        % e dataset_o_limite
    % Utilizzo funzione "scelta_dataset"
    [~,k,~,w]=scelta_dataset(dataset_proposti,tipo_classi);
    % Utilizzo funzione "suddivisione_con_dataset"
    [fi,Valori]=suddivisione_con_dataset([],k,tipo_classi,w);
    % Utilizzo funzione "calcolo_indici_di_asimmetria"
    indici_di_asimmetria=calcolo_indici_di_asimmetria(w);
    n=sum(fi);          % Calcolo del numero totale di frequenze assolute
elseif creazione==2     % Caso di creazione delle classi senza dataset
    limite_minimo=dataset_o_limite;     % Uguaglianza tra limite_minimo
                                        % e dataset_o_limite
    numero_valori=0;    % Inizializzazione di numero_valori
    % Ciclo di controllo errori inserendo il numero di valori
    while numero_valori<1 || numero_valori>k_o_kmax
        % Messaggio per il numero di valori
        fprintf("\nInserire il numero di valori da considerare (Da 1 a %d)",k_o_kmax);
        numero_valori=input(": ");      % Inserimento del numero di valori
        % Caso di valore errato per numero_valori
        if numero_valori<1 || numero_valori>k_o_kmax
            % Messaggio di errore per numero_valori
            fprintf("\nErrore! Deve essere inserito un valore compreso tra 1 e %d!",k_o_kmax);
        end
    end
    % Utilizzo funzione "suddivisione_senza_dataset"
    [fi,~,n,Valori]=suddivisione_senza_dataset(numero_valori,limite_minimo,tipo_classi);
    % Utilizzo funzione "calcolo_indici_di_asimmetria"
    indici_di_asimmetria=calcolo_indici_di_asimmetria(Valori);
end
% Utilizzo funzione "costruzione_tabella_con_valori"
[T1,T2,Fi,intervalli]=costruzione_tabella_con_valori(creazione,fi,n,Valori);
if tipo_quantili==1         % Caso di calcolo di soli quartili
    % Utilizzo funzione "calcolo_quartili"
    [quartili]=calcolo_quartili(Fi,intervalli);
    quantili=[];            % Creazione matrice vuota per quantili
elseif tipo_quantili==2     % Caso di calcolo di soli quantili
    % Utilizzo funzione "calcolo_quantili"
    [quantili]=calcolo_quantili(Fi,intervalli,tipo_classi);
    quartili=[];            % Creazione matrice vuota per quartili
elseif tipo_quantili==3     % Caso di calcolo di quartili e quantili
    % Utilizzo funzione "calcolo_quartili"
    [quartili]=calcolo_quartili(Fi,intervalli);
    % Utilizzo funzione "calcolo_quantili"
    [quantili]=calcolo_quantili(Fi,intervalli,tipo_classi);
end
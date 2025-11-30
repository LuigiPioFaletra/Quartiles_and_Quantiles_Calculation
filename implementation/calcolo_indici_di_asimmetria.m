function [indici_di_asimmetria]=calcolo_indici_di_asimmetria(w_o_intervalli_o_Valori)
% Funzione di calcolo di alcuni indici di asimmetria dal dataset estratto.
% Gli indici di asimmetria scelti sono 5 e sono nello specifico:
% 1) Momento centrato empirico di ordine 4
% 2) Varianza empirica
% 3) Deviazione standard empirica
% 4) Indice di Kurtosi
% 5) Differenza interquartile
% w_o_intervalli_o_valori è il vettore contenente i dati da cui ricavare
% gli indici di asimmetria
% indici_di_asimmetria è il vettore con gli indici di asimmetria calcolati

numero_indici=5;            % Inizializzazione numero di indici da trovare
ordine_momento_centrato=4;  % Inizializzazione ordine del momento centrale
% Calcolo degli indici di asimmetria
momento_centrato=moment(w_o_intervalli_o_Valori,ordine_momento_centrato);
varianza=var(w_o_intervalli_o_Valori);
deviazione_standard=std(w_o_intervalli_o_Valori);
indice_di_kurtosi=kurtosis(w_o_intervalli_o_Valori);
differenza_interquartile=iqr(w_o_intervalli_o_Valori);
% Inizializzazione vettore colonna con i nomi degli indici
nomi=["Momento centrato di ordine "+ordine_momento_centrato;"Varianza";"Deviazione standard";"Indice di Kurtosi";"Differenza interquartile"];   
% Inizializzazione vettore colonna con i valori degli indici
val=[round(momento_centrato,2);round(varianza,2);round(deviazione_standard,2);round(indice_di_kurtosi,2);round(differenza_interquartile,2)];
% Visualizzazione dei risultati ottenuti per gli indici di asimmetria
fprintf("\nIndici di asimmetria");
for i=1:numero_indici
    switch(i)
        case 1
            spazio=": ";
        case 2
            spazio=":                     ";
        case 3
            spazio=":          ";
        case 4
            spazio=":            ";
        case 5
            spazio=":     ";
    end
    frase=nomi(i)+spazio+round(val(i),2);
    fprintf("\n%s",frase);
end
indici_di_asimmetria=[nomi,val];    % Inserimento dei risultati trovati nel
                                    % vettore degli indici di asimmetria
fprintf("\n");                      % Stampa per andare a capo
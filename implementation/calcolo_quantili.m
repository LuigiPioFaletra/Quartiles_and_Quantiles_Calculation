function [quantili]=calcolo_quantili(Fi,intervalli,tipo_classi)
% Funzione di calcolo dei quantili di ordine diverso da 0.25, 0.5 e 0.75
% Fi è il vettore colonna contenente le frequenze cumulate per ogni classe
% intervalli è il vettore riga con gli estremi delle classi
% tipo_classi è il numero che esprime se le classi sono intervalli o valori
% quantili è la matrice avente nella prima colonna il nome del quantile e
% del relativo percentile e nella seconda colonna il suo valore

percentile_scelto=0;            % Inizializzazione di percentile_scelto
percentili_scelti=[25,50,75];   % Inizializzazione di percentili_scelti
presenza=false;                 % Inizializzazione di presenza
quantili=[];                    % Inizializzazione di quantili
quartili=[];                    % Inizializzazione di quartili
stringhe=[];                    % Inizializzazione di stringhe
scelta=0;                       % Inizializzazione di scelta
while true  % Codice ripetuto se si vogliono calcolare altri quantili
    % Ciclo di controllo errori inserendo il valore di percentile_scelto
    while percentile_scelto<1 || percentile_scelto>100 || presenza==true
        % Messaggio per il percentile di cui trovare il quantile
        fprintf("Percentili da 1 a 100 disponibili per il calcolo del relativo quantile: tutti tranne ");
        fprintf("%d ",percentili_scelti);
        fprintf("\nScegliere il percentile");
        percentile_scelto=input(": ");  % Inserimento di percentile_scelto
        % Ciclo di controllo del percentile scelto tra quelli selezionabili
        for i=1:length(percentili_scelti)
            % Caso in cui il percentile scelto non è tra quelli già scelti
            if percentile_scelto==percentili_scelti(i)
                presenza=true;      % Uguaglianza a true di presenza
                break;              % Interruzione del ciclo for
            % Caso di percentile già scelto o relativo a un quartile
            else
                presenza=false;     % Uguaglianza a false di presenza
            end
        end
        % Caso di valore errato per percentile_scelto
        if percentile_scelto<1 || percentile_scelto>100 || presenza==true
            % Messaggio di errore per percentile_scelto
            fprintf("\nErrore! Deve essere inserito un valore da 1 a 100 diverso da ");
            fprintf("%d ",percentili_scelti);
            fprintf("\n");
        end
    end
    % Aggiunta percentile scelto nel vettore riga dei percentili già scelti
    percentili_scelti=[percentili_scelti,percentile_scelto];
    percentili_scelti=sort(percentili_scelti);  % Ordinamento dei
                                                % percentili scelti
    ordine_quantile=percentile_scelto/100;      % Calcolo dell'ordine del
                                                % quantile associato al
                                                % percentile scelto
    if Fi(1)>ordine_quantile    % Caso in cui l'ordine del quantile è
                                % compreso tra 0 e il primo valore di Fi
        i_q=0;          % Uguaglianza a 0 dell'indice dell'estremo
                        % inferiore dell'intervallo del quantile trovato
        i_q_s=1;        % Uguaglianza a 1 dell'indice dell'estremo
                        % superiore dell'intervallo del quantile trovato
    end
    for i=1:length(Fi)-1        % Caso in cui il quantile non è compreso
                                % tra 0 e il primo valore di Fi
        % Ricerca del quantile tra valori di Fi successivi al primo
        if Fi(i)<=ordine_quantile && Fi(i+1)>ordine_quantile
            i_q=i;      % Uguaglianza a i dell'indice dell'estremo
                        % inferiore dell'intervallo del quantile trovato
            i_q_s=i+1;  % Uguaglianza a i+1 dell'indice dell'estremo
                        % superiore dell'intervallo del quantile trovato
        end
    end
    if i_q==0   % Caso in cui l'indice dell'estremo inferiore è pari a 0
        % Calcolo del quantile per indice nullo
        q=intervalli(1)+(ordine_quantile/Fi(i_q_s))*(intervalli(2)-intervalli(1));
    else    % Caso in cui l'indice dell'estremo inferiore è diverso da 0
        if tipo_classi==1       % Caso di classi espresse come intervalli
            % Calcolo del quantile per classi espresse come intervalli
            q=intervalli(i_q+1)+((ordine_quantile-Fi(i_q))/(Fi(i_q_s)-Fi(i_q)))*(intervalli(i_q_s+1)-intervalli(i_q+1));
        elseif tipo_classi==2   % Caso di classi espresse come valori
            % Calcolo del quantile per classi espresse come valori
            q=intervalli(i_q)+((ordine_quantile-Fi(i_q))/(Fi(i_q_s)-Fi(i_q)))*(intervalli(i_q_s)-intervalli(i_q));
        end
    end
    % Visualizzazione del valore del quantile precedentemente calcolato
    fprintf("\nQuantile associato al %d° percentile: %g",percentile_scelto,round(q,2));
    % Scrittura dei quantili e relativi percentili in due vettori colonna
    stringa="Quantile associato al "+percentile_scelto+"°percentile: q"+ordine_quantile+" =";
    stringhe=[stringhe;stringa];
    quartili=[quartili;round(q,2)];
    % Ciclo di controllo degli errori inserendo il valore di scelta
    while scelta<1 || scelta>2
        % Procedura di inserimento del valore di scelta
        scelta=input("\n1 - Si\n2 - No\nSi desidera continuare a calcolare quantili? ");
        if scelta<1 || scelta>2         % Caso di valore errato per scelta
            % Messaggio di errore per scelta
            fprintf("\nErrore! Deve essere inserito un valore che sia 1 o 2!");
        end
    end
    if scelta==2    % Caso in cui non si vogliono più calcolare quantili
        % Inserimento dei due vettori colonna creati in una matrice n*n
        quantili=[stringhe,quartili];
        break       % Interruzione del ciclo while true
    else            % Caso in cui si vogliono calcolare altri quantili
        presenza=true;  % Aggiornamento di presenza per inserire percentile
        scelta=0;       % Aggiornamento di scelta per chiedere in seguito
                        % se si vuole continuare a calcolare quantili
        continue        % Continuazione del ciclo while true
    end
end
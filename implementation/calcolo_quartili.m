function [quartili]=calcolo_quartili(Fi,intervalli)
% Funzione di calcolo dei quartili, cioè quantili d'ordine 0.25, 0.5 e 0.75
% Fi è il vettore colonna contenente le frequenze cumulate per ogni classe
% intervalli è il vettore riga con gli estremi delle classi
% quartili è la matrice 3x2 avente nella prima colonna il nome del quartile
% e del relativo percentile e nella seconda colonna il suo valore

% Caso in cui il quantile di ordine 0.75 è tra 0 e il primo valore di Fi
if Fi(1)>0.75
    i_q075=0;       % Uguaglianza a 0 dell'indice dell'estremo inferiore
                    % dell'intervallo relativo al quantile di ordine 0.75
    i_q075_s=1;     % Uguaglianza a 1 dell'indice dell'estremo superiore
                    % dell'intervallo relativo al quantile di ordine 0.75
    i_q050=0;       % Uguaglianza a 0 dell'indice dell'estremo inferiore
                    % dell'intervallo relativo al quantile di ordine 0.5
    i_q050_s=1;     % Uguaglianza a 1 dell'indice dell'estremo superiore
                    % dell'intervallo relativo al quantile di ordine 0.5
    i_q025=0;       % Uguaglianza a 0 dell'indice dell'estremo inferiore
                    % dell'intervallo relativo al quantile di ordine 0.25
    i_q025_s=1;     % Uguaglianza a 1 dell'indice dell'estremo superiore
                    % dell'intervallo relativo al quantile di ordine 0.25
% Caso in cui il quantile di ordine 0.5 è tra 0 e il primo valore di Fi
elseif Fi(1)>0.5
    i_q050=0;       % Uguaglianza a 0 dell'indice dell'estremo inferiore
                    % dell'intervallo relativo al quantile di ordine 0.5
    i_q050_s=1;     % Uguaglianza a 1 dell'indice dell'estremo superiore
                    % dell'intervallo relativo al quantile di ordine 0.5
    i_q025=0;       % Uguaglianza a 0 dell'indice dell'estremo inferiore
                    % dell'intervallo relativo al quantile di ordine 0.25
    i_q025_s=1;     % Uguaglianza a 1 dell'indice dell'estremo superiore
                    % dell'intervallo relativo al quantile di ordine 0.25
% Caso in cui il quantile di ordine 0.25 è tra 0 e il primo valore di Fi
elseif Fi(1)>0.25
    i_q025=0;       % Uguaglianza a 0 dell'indice dell'estremo inferiore
                    % dell'intervallo relativo al quantile di ordine 0.25
    i_q025_s=1;     % Uguaglianza a 1 dell'indice dell'estremo superiore
                    % dell'intervallo relativo al quantile di ordine 0.25
end
% Caso in cui i quantili non sono compresi tra 0 e il primo valore di Fi
for i=1:length(Fi)-1
    % Ricerca quantile di ordine 0.25 tra valori di Fi successivi al primo
    if Fi(i)<=0.25 && Fi(i+1)>0.25
        i_q025=i;           % Uguaglianza a i dell'indice dell'estremo
                            % inferiore dell'intervallo del quantile 0.25
        i_q025_s=i+1;       % Uguaglianza a i+1 dell'indice dell'estremo
                            % superiore dell'intervallo del quantile 0.25
    end
    % Ricerca quantile di ordine 0.5 tra valori di Fi successivi al primo
    if Fi(i)<=0.5 && Fi(i+1)>0.5
        i_q050=i;           % Uguaglianza a i dell'indice dell'estremo
                            % inferiore dell'intervallo del quantile 0.5
        i_q050_s=i+1;       % Uguaglianza a i+1 dell'indice dell'estremo
                            % superiore dell'intervallo del quantile 0.5
    end
    % Ricerca quantile di ordine 0.75 tra valori di Fi successivi al primo
    if Fi(i)<=0.75 && Fi(i+1)>0.75
        i_q075=i;           % Uguaglianza a i dell'indice dell'estremo
                            % inferiore dell'intervallo del quantile 0.75
        i_q075_s=i+1;       % Uguaglianza a i+1 dell'indice dell'estremo
                            % superiore dell'intervallo del quantile 0.75
    end
end
% Caso in cui almeno uno degli indici degli estremi inferiori è pari a 0
if i_q025==0 || i_q050==0 || i_q075==0
    if i_q025==0            % Caso di indice dell'estremo inferiore del
                            % quantile di ordine 0.25 pari a 0
        % Calcolo del primo quartile per indice nullo
        q025=intervalli(1)+((0.25-0)/(Fi(i_q025_s)-0))*(intervalli(2)-intervalli(1));
    else                    % Caso di indice dell'estremo inferiore del
                            % quantile di ordine 0.25 diverso da 0
        % Calcolo del primo quartile per indice non nullo
        q025=intervalli(i_q025+1)+((0.25-Fi(i_q025))/(Fi(i_q025_s)-Fi(i_q025)))*(intervalli(i_q025_s+1)-intervalli(i_q025+1));
    end
    if i_q050==0            % Caso di indice dell'estremo inferiore del
                            % quantile di ordine 0.5 pari a 0
        % Calcolo del secondo quartile per indice nullo
        q050=intervalli(1)+((0.5-0)/(Fi(i_q050_s)-0))*(intervalli(2)-intervalli(1));
    else                    % Caso di indice dell'estremo inferiore del
                            % quantile di ordine 0.5 diverso da 0
        % Calcolo del secondo quartile per indice non nullo
        q050=intervalli(i_q050+1)+((0.5-Fi(i_q050))/(Fi(i_q050_s)-Fi(i_q050)))*(intervalli(i_q050_s+1)-intervalli(i_q050+1));
    end
    if i_q075==0            % Caso di indice dell'estremo inferiore del
                            % quantile di ordine 0.75 pari a 0
        % Calcolo del terzo quartile per indice nullo
        q075=intervalli(1)+((0.75-0)/(Fi(i_q075_s)-0))*(intervalli(2)-intervalli(1));
    else                    % Caso di indice dell'estremo inferiore del
                            % quantile di ordine 0.75 diverso da 0
        % Calcolo del terzo quartile per indice non nullo
        q075=intervalli(i_q075+1)+((0.75-Fi(i_q075))/(Fi(i_q075_s)-Fi(i_q075)))*(intervalli(i_q075_s+1)-intervalli(i_q075+1));
    end
else    % Caso in cui ogni indice degli estremi inferiori è diverso da 0
    % Calcolo del primo, secondo e terzo quartile per indici non nulli
    q025=intervalli(i_q025)+((0.25-Fi(i_q025))/(Fi(i_q025_s)-Fi(i_q025)))*(intervalli(i_q025_s)-intervalli(i_q025));
    q050=intervalli(i_q050)+((0.5-Fi(i_q050))/(Fi(i_q050_s)-Fi(i_q050)))*(intervalli(i_q050_s)-intervalli(i_q050));
    q075=intervalli(i_q075)+((0.75-Fi(i_q075))/(Fi(i_q075_s)-Fi(i_q075)))*(intervalli(i_q075_s)-intervalli(i_q075));
end
% Scrittura dei quartili calcolati e relativi percentili in una matrice 3x2
quartili=["1° quartile (25° percentile): q0.25 =",round(q025,2);"2° quartile (50° percentile): q0.5 =",round(q050,2);"3° quartile (75° percentile): q0.75 =",round(q075,2)];
% Visualizzazione dei valori dei quartili precedentemente ricavati
fprintf("1° quartile (25° percentile): q0.25 = %g",round(q025,2));
fprintf("\n2° quartile (50° percentile):  q0.5 = %g",round(q050,2));
fprintf("\n3° quartile (75° percentile): q0.75 = %g",round(q075,2));
fprintf("\n");      % Stampa per andare a capo
function [fi,intervalli,n,Valori]=suddivisione_senza_dataset(k_o_valori,limite_minimo,tipo_classi)
% Funzione di suddivisione degli elementi inseriti dall'utente in classi
% k_o_valori è il numero di classi o valori scelto dall'utente
% limite_minimo è la cifra minima da inserire immettendo l'estremo
% inferiore del primo intervallo
% tipo_classi è il numero che esprime se le classi sono intervalli o valori
% fi è il vettore colonna contenente le frequenze assolute per ogni classe
% intervalli è il vettore riga contenente gli estremi di ogni classe, nel
% caso di espressione delle classi come intervalli
% n è il numero di valori da inserire nelle classi, nonché la somma di
% tutte le frequenze assolute
% Valori è il vettore riga contenente gli estremi di ogni classe, nel caso
% di espressione delle classi come valori

f=0;                        % Inizializzazione di f
n=0;                        % Inizializzazione di n
fi=[];                      % Inizializzazione del vettore colonna fi
intervalli=[];              % Inizializzazione del vettore riga intervalli
Valori=[];                  % Inizializzazione del vettore riga Valori
if tipo_classi==1           % Caso classi espresse come intervalli
    inf=limite_minimo-1;    % Inizializzazione di inf
    for i=1:k_o_valori      % Assegnazione di ogni elemento di w a una
                            % classe in base all'intervallo in cui risiede
        if i==1             % Caso del primo intervallo
            % Ciclo di controllo degli errori inserendo il valore di inf
            while inf<limite_minimo
                % Messaggio per l'estremo inferiore della prima classe
                fprintf("Inserire l'estremo inferiore della %d° classe (Almeno uguale a %d)",i,limite_minimo);
                inf=input(": ");        % Inserimento estremo inferiore
                if inf<limite_minimo    % Caso di valore errato per inf
                    % Messaggio di errore per inf
                    fprintf("\nErrore! Deve essere inserito un numero almeno uguale a %d!\n",limite_minimo);
                end
            end
            intervalli=[intervalli,inf];    % Inserimento inf in intervalli
        end
        sup=inf-1;                      % Uguaglianza di sup a inf-1 per
                                        % accedere al prossimo ciclo while
        % Ciclo di controllo degli errori inserendo il valore di sup
        while sup<=inf
            % Messaggio per l'estremo superiore delle varie classi
            fprintf("Inserire l'estremo superiore della %d° classe (Maggiore di %g)",i,inf);
            sup=input(": ");            % Inserimento estremo superiore
            if sup<=inf                 % Caso di valore errato per sup
                % Messaggio di errore per sup
                fprintf("\nErrore! Deve essere inserito un numero maggiore di %g!\n",inf);
            end
        end
        % Ciclo di controllo degli errori inserendo il valore di f
        while f<=0
            % Messaggio per il numero di frequenze assolute delle classi
            fprintf("Inserire il numero di frequenze assolute per la %d° classe (Maggiore di 0)",i);
            f=input(": ");          % Inserimento della frequenza assoluta
            if f<=0                 % Caso di valore errato per f
                % Messaggio di errore per f
                fprintf("\nErrore! Deve essere inserito un numero superiore a 0!\n");
            end
        end
        intervalli=[intervalli,sup];    % Inserimento sup in intervalli
        fi=[fi;f];                      % Incolonnamento di f in fi
        inf=sup;                        % Uguaglianza tra inf e sup
        n=n+f;                          % Calcolo totale frequenze assolute
        f=0;                            % Azzeramento di f
    end
elseif tipo_classi==2                   % Caso classi espresse come valori
    valore=limite_minimo-1;             % Inizializzazione di valore
    for i=1:k_o_valori      % Assegnazione di ogni elemento di w a una
                            % classe in base all'intervallo in cui risiede
        if i==1             % Caso del primo intervallo
            % Ciclo di controllo degli errori inserendo il valore
            while valore<limite_minimo
                % Messaggio per il primo valore
                fprintf("Inserire il %d° valore (Almeno uguale a %d)",i,limite_minimo);
                valore=input(": ");         % Inserimento del primo valore
                if valore<limite_minimo     % Caso errore per primo valore
                    % Messaggio di errore per il primo valore
                    fprintf("\nErrore! Deve essere inserito un numero almeno uguale a %d!\n",limite_minimo);
                end
            end
        else                % Caso di tutti gli altri intervalli
            valore=valore_prec-1;   % Uguaglianza di valore a valore_prec-1
                                    % per accedere al prossimo ciclo while
            % Ciclo di controllo degli errori inserendo il valore
            while valore<=valore_prec
                % Messaggio per gli altri valori, escluso il primo
                fprintf("Inserire il %d° valore (Maggiore di %g)",i,valore_prec);
                valore=input(": ");     % Inserimento degli altri valori
                if valore<=valore_prec  % Caso errore altri valori
                    % Messaggio di errore per gli altri valori
                    fprintf("\nErrore! Deve essere inserito un numero almeno uguale a %g!\n",valore_prec);
                end
            end
        end
        % Ciclo di controllo degli errori inserendo il valore di f
        while f<=0
            % Messaggio per il numero di frequenze assolute delle classi
            fprintf("Inserire il numero di frequenze assolute per il %d° valore (Maggiore di 0)",i);
            f=input(": ");          % Inserimento della frequenza assoluta
            if f<=0                 % Caso di valore errato per f
                % Messaggio di errore per f
                fprintf("\nErrore! Deve essere inserito un numero superiore a 0!\n");
            end
        end
        Valori=[Valori,valore];     % Inserimento valore in Valori
        fi=[fi;f];                  % Incolonnamento di f in fi
        valore_prec=valore;         % Uguaglianza tra valore_prec e valore
        n=n+f;                      % Calcolo totale frequenze assolute
        f=0;                        % Azzeramento di f
    end
end
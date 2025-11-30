function [fi,Valori]=suddivisione_con_dataset(intervalli,k,tipo_classi,w)
% Funzione di suddivisione degli elementi estratti dal dataset in classi
% intervalli è il vettore riga contenente gli estremi di ogni classe, nel
% caso di espressione delle classi come intervalli
% k è il numero di classi previste usando i dataset
% tipo_classi è il numero che esprime se le classi sono intervalli o valori
% w è il vettore colonna di elementi della colonna estratta dal dataset
% fi è il vettore colonna contenente le frequenze assolute per ogni classe
% Valori è il vettore riga contenente gli estremi di ogni classe, nel caso
% di espressione delle classi come valori

Valori=[];                          % Inizializzazione di Valori
if tipo_classi==1                   % Caso classi espresse come intervalli
    fi=zeros(1,k);                  % Inizializzazione di fi
    for i=1:length(w)   % Assegnazione di ogni elemento di w ad una classe
                        % in base all'intervallo di cui fa parte
        for j=1:length(intervalli)-1
            % Caso di esclusione dell'estremo superiore dell'intervallo
            if w(i)>=intervalli(j) && w(i)<intervalli(j+1)
                fi(j)=fi(j)+1;      % Aggiunta dell'elemento alla classe
                                    % associata all'intervallo considerato
            end
        end
    end
elseif tipo_classi==2               % Caso classi espresse come valori
    fi=[];                          % Inizializzazione di fi
    w_unici=unique(w.');            % Creazione vettore di elementi univoci
    for i=w_unici                   % Ricerca del numero di occorrenze
                                    % degli elementi univoci nel vettore w
        occ=sum(w.'==i);            % Salvataggio occorrenze dell'elemento
        if occ>1 && length(Valori)<k    % Utilizzo delle occorrenze come
                                        % frequenze assolute per la tabella
            fi=[fi,occ];            % Aggiunta delle occorrenze in fi
            Valori=[Valori,i];      % Aggiunta dell'elemento in Valori
        end
    end
end
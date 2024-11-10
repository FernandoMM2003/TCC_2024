use AntiPlague;

CREATE TABLE IF NOT EXISTS dados_demograficos (
    Local VARCHAR(50),
    Ano INT,
    BCG INT,
    Hib3 INT,
    DTP3 INT,
    Saneamento_Seguro DECIMAL(10, 2),
    Numero_Total_Imigrantes INT,
    Gini DECIMAL(5, 2),
    Populacao INT,
    Taxa_Extrema_Pobreza DECIMAL(5, 2),
    Numero_Usuario_Internet INT,
    Numero_Casos_Infeccoes INT,
    PRIMARY KEY (Local, Ano)
);
#drop table dados_demograficos;
#drop table previsao_epidemia;

CREATE TABLE IF NOT EXISTS previsao_epidemia (
    Local VARCHAR(50),
    Ano INT,
    Previsao_Casos INT,
    Limiar_Epidemico INT,
    Taxa_Incidencia INT,
    Status_Epidemia VARCHAR(20),
    PRIMARY KEY (Local, Ano)
);


select * from dados_demograficos where Local = 'Brazil' and Ano = 2020;

select * from previsao_epidemia where Local = 'Brazil';

#truncate table previsao_epidemia;

#  Checa se o pacote esta instalado ou nao
requiredPackages = c('h2o')
for(p in requiredPackages){
  if(!require(p,character.only = TRUE)) install.packages(p)
  library(p,character.only = TRUE)
}

# Semente randomica
seed <- 42

# Inicializa o H2O.ai
h2o.init(ip = "localhost",
         port = 54321,
         nthreads = -1,
         max_mem_size="20g",
         name = "estatidados-cluster")

# Pega a URL do Residencias no Github
residential_url <- 
  "https://raw.githubusercontent.com/fclesio/learning-space/master/Datasets/04%20-%20Linear%20Regression/residential_building_dataset.csv"

# Faz a carga no formato do H2O.ai que e.hex. 
# Nao usar o metodo "h2o.uploadFile()" pois esse
# exige 4x o volume de dados em memoria antes de
# fazer a carga
residential.hex <- 
  h2o.importFile(path = residential_url,
                 destination_frame = "residential.hex")

# Como vamos trabalhar com regressao
# vamos assegurar que a nossa variaveldependente 
# sera numerica
residential.hex$out_v1 <- as.numeric(residential.hex$out_v1)
residential.hex$out_v2 <- as.numeric(residential.hex$out_v2)

# Informacoes sobre a base de dados
summary(residential.hex)

# Faz a divisao do conjunto de treinamento
# e teste na proporcao 90% para treino
# e 10% para teste
residential_building.split<-
  h2o.splitFrame(data = residential.hex,
                 ratios = 0.90,
                 seed = seed)

residential_building.train = residential_building.split[[1]]
residential_building.test = residential_building.split[[2]]


# Variavel dependente
y = "out_v1"

# Variaveis independentes
x = c(
  "physical_financial_v1"
  ,"physical_financial_v2"
  ,"physical_financial_v3"
  ,"physical_financial_v4"
  ,"physical_financial_v5"
  ,"physical_financial_v6"
  ,"physical_financial_v7"
  ,"physical_financial_v8"
  ,"economic_indexes__lag1_v1"
  ,"economic_indexes__lag1_v2"
  ,"economic_indexes__lag1_v3"
  ,"economic_indexes__lag1_v4"
  ,"economic_indexes__lag1_v5"
  ,"economic_indexes__lag1_v6"
  ,"economic_indexes__lag1_v7"
  ,"economic_indexes__lag1_v8"
  ,"economic_indexes__lag1_v9"
  ,"economic_indexes__lag1_v10"
  ,"economic_indexes__lag1_v11"
  ,"economic_indexes__lag1_v12"
  ,"economic_indexes__lag1_v13"
  ,"economic_indexes__lag1_v14"
  ,"economic_indexes__lag1_v15"
  ,"economic_indexes__lag1_v16"
  ,"economic_indexes__lag1_v17"
  ,"economic_indexes__lag1_v18"
  ,"economic_indexes__lag1_v19"
  ,"economic_indexes__lag2_v01"
  ,"economic_indexes__lag2_v02"
  ,"economic_indexes__lag2_v03"
  ,"economic_indexes__lag2_v04"
  ,"economic_indexes__lag2_v05"
  ,"economic_indexes__lag2_v06"
  ,"economic_indexes__lag2_v07"
  ,"economic_indexes__lag2_v08"
  ,"economic_indexes__lag2_v09"
  ,"economic_indexes__lag2_v10"
  ,"economic_indexes__lag2_v11"
  ,"economic_indexes__lag2_v12"
  ,"economic_indexes__lag2_v13"
  ,"economic_indexes__lag2_v14"
  ,"economic_indexes__lag2_v15"
  ,"economic_indexes__lag2_v16"
  ,"economic_indexes__lag2_v17"
  ,"economic_indexes__lag2_v18"
  ,"economic_indexes__lag2_v19"
  ,"economic_indexes__lag3_v01"
  ,"economic_indexes__lag3_v02"
  ,"economic_indexes__lag3_v03"
  ,"economic_indexes__lag3_v04"
  ,"economic_indexes__lag3_v05"
  ,"economic_indexes__lag3_v06"
  ,"economic_indexes__lag3_v07"
  ,"economic_indexes__lag3_v08"
  ,"economic_indexes__lag3_v09"
  ,"economic_indexes__lag3_v10"
  ,"economic_indexes__lag3_v11"
  ,"economic_indexes__lag3_v12"
  ,"economic_indexes__lag3_v13"
  ,"economic_indexes__lag3_v14"
  ,"economic_indexes__lag3_v15"
  ,"economic_indexes__lag3_v16"
  ,"economic_indexes__lag3_v17"
  ,"economic_indexes__lag3_v18"
  ,"economic_indexes__lag3_v19"
  ,"economic_indexes__lag4_v01"
  ,"economic_indexes__lag4_v02"
  ,"economic_indexes__lag4_v03"
  ,"economic_indexes__lag4_v04"
  ,"economic_indexes__lag4_v05"
  ,"economic_indexes__lag4_v06"
  ,"economic_indexes__lag4_v07"
  ,"economic_indexes__lag4_v08"
  ,"economic_indexes__lag4_v09"
  ,"economic_indexes__lag4_v10"
  ,"economic_indexes__lag4_v11"
  ,"economic_indexes__lag4_v12"
  ,"economic_indexes__lag4_v13"
  ,"economic_indexes__lag4_v14"
  ,"economic_indexes__lag4_v15"
  ,"economic_indexes__lag4_v16"
  ,"economic_indexes__lag4_v17"
  ,"economic_indexes__lag4_v18"
  ,"economic_indexes__lag4_v19"
  ,"economic_indexes__lag5_v01"
  ,"economic_indexes__lag5_v02"
  ,"economic_indexes__lag5_v03"
  ,"economic_indexes__lag5_v04"
  ,"economic_indexes__lag5_v05"
  ,"economic_indexes__lag5_v06"
  ,"economic_indexes__lag5_v07"
  ,"economic_indexes__lag5_v08"
  ,"economic_indexes__lag5_v09"
  ,"economic_indexes__lag5_v10"
  ,"economic_indexes__lag5_v11"
  ,"economic_indexes__lag5_v12"
  ,"economic_indexes__lag5_v13"
  ,"economic_indexes__lag5_v14"
  ,"economic_indexes__lag5_v15"
  ,"economic_indexes__lag5_v16"
  ,"economic_indexes__lag5_v17"
  ,"economic_indexes__lag5_v18"
  ,"economic_indexes__lag5_v19"  
)  #  Checa se o pacote esta instalado ou nao
requiredPackages = c('h2o')
for(p in requiredPackages){
  if(!require(p,character.only = TRUE)) install.packages(p)
  library(p,character.only = TRUE)
}

# Semente randomica
seed <- 42

# Inicializa o H2O.ai
h2o.init(ip = "localhost",
         port = 54321,
         nthreads = -1,
         max_mem_size="20g",
         name = "estatidados-cluster")

# Pega a URL do Residencias no Github
residential_url <- 
  "https://raw.githubusercontent.com/fclesio/learning-space/master/Datasets/04%20-%20Linear%20Regression/residential_building_dataset.csv"

# Faz a carga no formato do H2O.ai que e.hex. 
# Nao usar o metodo "h2o.uploadFile()" pois esse
# exige 4x o volume de dados em memoria antes de
# fazer a carga
residential.hex <- 
  h2o.importFile(path = residential_url,
                 destination_frame = "residential.hex")

# Como vamos trabalhar com regressao
# vamos assegurar que a nossa variaveldependente 
# sera numerica
residential.hex$out_v1 <- as.numeric(residential.hex$out_v1)
residential.hex$out_v2 <- as.numeric(residential.hex$out_v2)

# Informacoes sobre a base de dados
summary(residential.hex)

# Faz a divisao do conjunto de treinamento
# e teste na proporcao 90% para treino
# e 10% para teste
residential_building.split<-
  h2o.splitFrame(data = residential.hex,
                 ratios = 0.90,
                 seed = seed)

residential_building.train = residential_building.split[[1]]
residential_building.test = residential_building.split[[2]]


# Variavel dependente
y = "out_v1"

# Variaveis independentes
x = c(
  "physical_financial_v1"
  ,"physical_financial_v2"
  ,"physical_financial_v3"
  ,"physical_financial_v4"
  ,"physical_financial_v5"
  ,"physical_financial_v6"
  ,"physical_financial_v7"
  ,"physical_financial_v8"
  ,"economic_indexes__lag1_v1"
  ,"economic_indexes__lag1_v2"
  ,"economic_indexes__lag1_v3"
  ,"economic_indexes__lag1_v4"
  ,"economic_indexes__lag1_v5"
  ,"economic_indexes__lag1_v6"
  ,"economic_indexes__lag1_v7"
  ,"economic_indexes__lag1_v8"
  ,"economic_indexes__lag1_v9"
  ,"economic_indexes__lag1_v10"
  ,"economic_indexes__lag1_v11"
  ,"economic_indexes__lag1_v12"
  ,"economic_indexes__lag1_v13"
  ,"economic_indexes__lag1_v14"
  ,"economic_indexes__lag1_v15"
  ,"economic_indexes__lag1_v16"
  ,"economic_indexes__lag1_v17"
  ,"economic_indexes__lag1_v18"
  ,"economic_indexes__lag1_v19"
  ,"economic_indexes__lag2_v01"
  ,"economic_indexes__lag2_v02"
  ,"economic_indexes__lag2_v03"
  ,"economic_indexes__lag2_v04"
  ,"economic_indexes__lag2_v05"
  ,"economic_indexes__lag2_v06"
  ,"economic_indexes__lag2_v07"
  ,"economic_indexes__lag2_v08"
  ,"economic_indexes__lag2_v09"
  ,"economic_indexes__lag2_v10"
  ,"economic_indexes__lag2_v11"
  ,"economic_indexes__lag2_v12"
  ,"economic_indexes__lag2_v13"
  ,"economic_indexes__lag2_v14"
  ,"economic_indexes__lag2_v15"
  ,"economic_indexes__lag2_v16"
  ,"economic_indexes__lag2_v17"
  ,"economic_indexes__lag2_v18"
  ,"economic_indexes__lag2_v19"
  ,"economic_indexes__lag3_v01"
  ,"economic_indexes__lag3_v02"
  ,"economic_indexes__lag3_v03"
  ,"economic_indexes__lag3_v04"
  ,"economic_indexes__lag3_v05"
  ,"economic_indexes__lag3_v06"
  ,"economic_indexes__lag3_v07"
  ,"economic_indexes__lag3_v08"
  ,"economic_indexes__lag3_v09"
  ,"economic_indexes__lag3_v10"
  ,"economic_indexes__lag3_v11"
  ,"economic_indexes__lag3_v12"
  ,"economic_indexes__lag3_v13"
  ,"economic_indexes__lag3_v14"
  ,"economic_indexes__lag3_v15"
  ,"economic_indexes__lag3_v16"
  ,"economic_indexes__lag3_v17"
  ,"economic_indexes__lag3_v18"
  ,"economic_indexes__lag3_v19"
  ,"economic_indexes__lag4_v01"
  ,"economic_indexes__lag4_v02"
  ,"economic_indexes__lag4_v03"
  ,"economic_indexes__lag4_v04"
  ,"economic_indexes__lag4_v05"
  ,"economic_indexes__lag4_v06"
  ,"economic_indexes__lag4_v07"
  ,"economic_indexes__lag4_v08"
  ,"economic_indexes__lag4_v09"
  ,"economic_indexes__lag4_v10"
  ,"economic_indexes__lag4_v11"
  ,"economic_indexes__lag4_v12"
  ,"economic_indexes__lag4_v13"
  ,"economic_indexes__lag4_v14"
  ,"economic_indexes__lag4_v15"
  ,"economic_indexes__lag4_v16"
  ,"economic_indexes__lag4_v17"
  ,"economic_indexes__lag4_v18"
  ,"economic_indexes__lag4_v19"
  ,"economic_indexes__lag5_v01"
  ,"economic_indexes__lag5_v02"
  ,"economic_indexes__lag5_v03"
  ,"economic_indexes__lag5_v04"
  ,"economic_indexes__lag5_v05"
  ,"economic_indexes__lag5_v06"
  ,"economic_indexes__lag5_v07"
  ,"economic_indexes__lag5_v08"
  ,"economic_indexes__lag5_v09"
  ,"economic_indexes__lag5_v10"
  ,"economic_indexes__lag5_v11"
  ,"economic_indexes__lag5_v12"
  ,"economic_indexes__lag5_v13"
  ,"economic_indexes__lag5_v14"
  ,"economic_indexes__lag5_v15"
  ,"economic_indexes__lag5_v16"
  ,"economic_indexes__lag5_v17"
  ,"economic_indexes__lag5_v18"
  ,"economic_indexes__lag5_v19"  
)


# Hiperarametros do GBM 
gbm_params1 <- list(learn_rate = c(0.01, 0.05, 0.1, 0.2, 0.3),
                    ntrees = c(50, 200, 500, 1000, 5000),
                    stopping_rounds = c(5, 10, 30),
                    stopping_tolerance = c(1e-4, 1e-6, 1e-8),
                    learn_rate_annealing = c(.99, .80, .70, .60)
)

# Criterio de busca dos hiperparametros
search_criteria <- 
  list(strategy = "RandomDiscrete",
       max_models = 36,
       seed = seed)

# Treino e validacao do modelo GBM via configuracoes
# de hiperparameetros aleeatorios
gbm_grid2 <- 
  h2o.grid("gbm", 
           x = x, 
           y = y,
           training_frame = residential_building.train,
           seed = seed,
           stopping_metric = 'RMSE',
           hyper_params = gbm_params1,
           search_criteria = search_criteria)

gbm_grid2

# Pega os resultados do Random Search e 
# ordena pelo AUC da base de valida????o
gbm_gridperf2 <- 
  h2o.getGrid(grid_id = "Grid_GBM_RTMP_sid_a7f0_20_model_R_1588949243046_25956",
              sort_by = "RMSE",
              decreasing = TRUE)

print(gbm_gridperf2)

# Busca o melhor modelo GBM e ordena pelo AUC
best_gbm2 <- 
  h2o.getModel(gbm_gridperf2@model_ids[[1]])

# Avaliacao do modelo com a melhor performance contra a base
# de teste
best_gbm_perf2 <- 
  h2o.performance(model = best_gbm2,
                  newdata = residential_building.test)

best_gbm_perf2

# Os hiperparametros do melhor modelo
print(best_gbm2@model[["model_summary"]])

#############################################
# Salvando o modelo para colocar em producao
#############################################

#########
# Binario
#########
# Diretorio raiz
ROOT_DIR <- getwd()

# Diretorio do projeto
PROJECT_DIR <- 
  'Documents/github/estatidados-h2o/src/09-hiperparametros'

artifact_path <- 
  file.path(ROOT_DIR,
            PROJECT_DIR
  )

model_path_object <- 
  h2o.saveModel(object=best_gbm2,
                path=artifact_path,
                force=TRUE
  )

print(model_path_object)

# Carrega o modelo na memoria (Binario)
saved_model <- h2o.loadModel(model_path_object)

# Predicao com o modelo recarregado em memoria
# com origem no arquivo binario
model_predict <- as.data.frame(
  h2o.predict(object = saved_model,
              newdata = layman_brothers.test,
  )
)

print(model_predict)

##############
# MOJO & POJO
##############
modelfile <- 
  h2o.download_mojo(best_gbm2,
                    path=artifact_path,
                    get_genmodel_jar=TRUE)

model_jar_path <- 
  paste(artifact_path, '/' ,modelfile, sep = "")


imported_model <- 
  h2o.import_mojo(mojo_file_path = model_jar_path)


# Predicao com o modelo recarregado em memoria
# com origem no arquivo MOJO
model_predict_imported <- as.data.frame(
  h2o.predict(object = imported_model,
              newdata = layman_brothers.test,
  )
)

print(model_predict_imported)

# Referencias
# [1] - https://stackoverflow.com/questions/9341635/check-for-installed-packages-before-running-install-packages
# [2] - http://docs.h2o.ai/h2o/latest-stable/h2o-docs/grid-search.html
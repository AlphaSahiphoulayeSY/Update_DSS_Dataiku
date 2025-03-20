# --------------------------------------------------------------------------
# ALPHA SY-G2S
# VERSION 1:2021-04-14
# Script de modification du spark context dans les projets de Dataiku DSS V8
# En PySpark, sc = SparkContext() devient sc = SparkContext.getOrCreate()
# --------------------------------------------------------------------------

cd /datadrive/dataiku/dss_data/config/projects
for fich in `ls . `
do
    if [ -d $fich ]
    cd /datadrive/dataiku/dss_data/config/projects/${fich}/recipes
    echo `date +"%Y-%m-%d %H:%M:%S"`",Information,Traitement de $fich ..."
    then
        for file in *.py
        do
            echo `date +"%Y-%m-%d %H:%M:%S"`",Information,Traitement de $file ..."
            sed -i -e "s/SparkContext()/SparkContext.getOrCreate()/g" "$file"
        done
    fi
done

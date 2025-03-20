for projet in 'DATA_SCORE_GAV_PYSPARK'
do
    zip=".zip"
    fin="$projet$zip"
    echo `date +"%Y-%m-%d %H:%M:%S"`",Information,Export du projet : ${projet}..."
    cd /home/dataiku/dss_data/bin
    ./dsscli project-export $projet $fin --no-uploads --no-managed-fs --no-managed-folders --no-input-managed-folders --no-input-datasets --no-all-datasets --analysis-models --saved-models
    echo `date +"%Y-%m-%d %H:%M:%S"`",Information,Copie dans le share de : ${projet}..."
    cp -R $fin /media/share/DSS_V5_to_DSS_V8
    rm -r $fin
done

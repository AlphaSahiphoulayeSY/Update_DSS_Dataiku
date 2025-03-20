for projet in 'AUTOAPPLICATIONMODLE.zip'
do
    rep="/media/share/DSS_V5_to_DSS_V8/"
    pathprojet="$rep$projet"
    cd /media/share/DSS_V5_to_DSS_V8/
    echo `date +"%Y-%m-%d %H:%M:%S"`",Information,Copie du projet : ${projet}..."
    cp -R $pathprojet /datadrive/dataiku/dss_data/bin
    echo `date +"%Y-%m-%d %H:%M:%S"`",Information,Fin Copie du projet : ${projet}..."
    echo `date +"%Y-%m-%d %H:%M:%S"`",Information,Import du projet : ${projet}..."
    cd /datadrive/dataiku/dss_data/bin
    ./dsscli project-import $projet
    rm -r $projet
    echo `date +"%Y-%m-%d %H:%M:%S"`",Information,Fin Import du projet : ${projet}..."
done

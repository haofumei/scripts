echo '-------Remove Velero for GKE and Clean up (typically in 3 mins)'
starttime=$(date +%s)
. ./setenv.sh

velero uninstall --force
# gsutil rm -r gs://$(cat bucket4velero1)
gsutil -m rm -a gs://$(cat bucket4velero1)/**
# rm bucket4velero1
rm credentials-velero
gcloud iam service-accounts delete $(gcloud iam service-accounts list | grep myVelero | awk '{print $2}') -q

endtime=$(date +%s)
duration=$(( $endtime - $starttime ))
echo "" | awk '{print $1}'
echo "-------Total time to clean up the env is $(($duration / 60)) minutes $(($duration % 60)) seconds."
echo "" | awk '{print $1}'
echo "" | awk '{print $1}'
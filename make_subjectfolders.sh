#! /bin/bash

data='/gpfs/milgram/pi/gee_dylan/candlab/data/mri/bids_recon/shapes'
data_er='/gpfs/milgram/pi/gee_dylan/candlab/data/mri/bids_recon/scer'
dest='/gpfs/milgram/scratch60/gee_dylan/lms233/QSIPrep/bids_data'

for sub in A1177 A1175 A1174 A1147 A1141 A1140 A1117 A1079 A1116 A1071 A1072 A1068 A1066 A1051 A1075 A1069 A1064 A1067 A1052 A1062 A1063 A1058 A1056 A1050 A1049 A1047 A1046 A1044 A1042 A1041 A1039 A1040 A1057 A1060 A1007 A1038 A1051 A1054 A1065 A1044 A1067 A1070 A1046; do
    if [ -f ${data}/sub-${sub}/ses-shapesV1/fmap/sub-${sub}_ses-shapesV1_acq-dwi_dir-AP_epi.json ] ; then
#         mkdir ${dest}/sub-${sub}
#         mkdir ${dest}/sub-${sub}/ses-shapesV1
        rsync -rtP ${data}/sub-${sub}/ses-shapesV1/anat ${dest}/sub-${sub}/ses-shapesV1/.
        rsync -rtP ${data}/sub-${sub}/ses-shapesV1/dwi ${dest}/sub-${sub}/ses-shapesV1/.
#         mkdir ${dest}/sub-${sub}/ses-shapesV1/fmap
        cp ${data}/sub-${sub}/ses-shapesV1/fmap/sub-${sub}_ses-shapesV1_acq-dwi_dir-AP_epi.json ${dest}/sub-${sub}/ses-shapesV1/fmap/.
        cp ${data}/sub-${sub}/ses-shapesV1/fmap/sub-${sub}_ses-shapesV1_acq-dwi_dir-PA_epi.json ${dest}/sub-${sub}/ses-shapesV1/fmap/.
        cp ${data}/sub-${sub}/ses-shapesV1/fmap/sub-${sub}_ses-shapesV1_acq-dwi_dir-AP_epi.nii.gz ${dest}/sub-${sub}/ses-shapesV1/fmap/.
        cp ${data}/sub-${sub}/ses-shapesV1/fmap/sub-${sub}_ses-shapesV1_acq-dwi_dir-PA_epi.nii.gz ${dest}/sub-${sub}/ses-shapesV1/fmap/.

        cd '/home/lms233/Github/shapes_qsiprep'
        python edit_jsonfiles.py sub-${sub}
        
    elif [ -f ${data_er}/sub-${sub}/ses-erV1/fmap/sub-${sub}_ses-erV1_acq-dwi_dir-AP_epi.json ] ; then
        mkdir ${dest}/sub-${sub}
        mkdir ${dest}/sub-${sub}/ses-shapesV1
        
        cp ${data_er}/sub-${sub}/ses-erV1/anat/sub-${sub}_ses-erV1_T1w.json ${dest}/sub-${sub}/ses-shapesV1/anat/sub-${sub}_ses-shapesV1_T1w.json 
        cp ${data_er}/sub-${sub}/ses-erV1/anat/sub-${sub}_ses-erV1_T1w.nii.gz ${dest}/sub-${sub}/ses-shapesV1/anat/sub-${sub}_ses-shapesV1_T1w.nii.gz
        cp ${data_er}/sub-${sub}/ses-erV1/anat/sub-${sub}_ses-erV1_T2w.json ${dest}/sub-${sub}/ses-shapesV1/anat/sub-${sub}_ses-shapesV1_T2w.json
        cp ${data_er}/sub-${sub}/ses-erV1/anat/sub-${sub}_ses-erV1_T2w.nii.gz ${dest}/sub-${sub}/ses-shapesV1/anat/sub-${sub}_ses-shapesV1_T2w.nii.gz
        
        cp ${data_er}/sub-${sub}/ses-erV1/dwi/sub-${sub}_ses-erV1_dwi.bval ${dest}/sub-${sub}/ses-shapesV1/dwi/sub-${sub}_ses-shapesV1_dwi.bval
        cp ${data_er}/sub-${sub}/ses-erV1/dwi/sub-${sub}_ses-erV1_dwi.bvec  ${dest}/sub-${sub}/ses-shapesV1/dwi/sub-${sub}_ses-shapesV1_dwi.bvec
        cp ${data_er}/sub-${sub}/ses-erV1/dwi/sub-${sub}_ses-erV1_dwi.json  ${dest}/sub-${sub}/ses-shapesV1/dwi/sub-${sub}_ses-shapesV1_dwi.json
        cp ${data_er}/sub-${sub}/ses-erV1/dwi/sub-${sub}_ses-erV1_dwi.nii.gz ${dest}/sub-${sub}/ses-shapesV1/dwi/sub-${sub}_ses-shapesV1_dwi.nii.gz
        
        mkdir ${dest}/sub-${sub}/ses-shapesV1/fmap
        cp ${data_er}/sub-${sub}/ses-erV1/fmap/sub-${sub}_ses-erV1_acq-dwi_dir-AP_epi.json ${dest}/sub-${sub}/ses-shapesV1/fmap/sub-${sub}_ses-shapesV1_acq-dwi_dir-AP_epi.json
        cp ${data_er}/sub-${sub}/ses-erV1/fmap/sub-${sub}_ses-erV1_acq-dwi_dir-PA_epi.json ${dest}/sub-${sub}/ses-shapesV1/fmap/sub-${sub}_ses-shapesV1_acq-dwi_dir-PA_epi.json
        cp ${data_er}/sub-${sub}/ses-erV1/fmap/sub-${sub}_ses-erV1_acq-dwi_dir-AP_epi.nii.gz ${dest}/sub-${sub}/ses-shapesV1/fmap/sub-${sub}_ses-shapesV1_acq-dwi_dir-AP_epi.nii.gz
        cp ${data_er}/sub-${sub}/ses-erV1/fmap/sub-${sub}_ses-erV1_acq-dwi_dir-PA_epi.nii.gz ${dest}/sub-${sub}/ses-shapesV1/fmap/sub-${sub}_ses-shapesV1_acq-dwi_dir-PA_epi.nii.gz
        cd '/home/lms233/Github/shapes_qsiprep'
        python edit_jsonfiles.py sub-${sub}
    else
        echo 'Could not find files for' ${sub}
    fi
    
done
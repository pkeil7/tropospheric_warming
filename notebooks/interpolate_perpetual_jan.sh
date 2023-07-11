#data is either stored here (40km):  /work/mh0033/m300466/icon-aes/icon-aes/experiments
# or here (5km) : /work/mh0287/m300466/icon-dc/experiments
# files are called e.g. /work/mh0287/m300466/icon-dc/experiments/dap0013-dc/dap0013-dc_atm_3d_3_ml_19790913T000000Z.nn

# there is data on pressure levels also: *_atm_3dpl_prog_pl_19800101T000000Z.nc

# ICON grid file is either /work/mh0287/m300466/icon-dc/experiments/dap0013-dc/icon_grid_0015_R02B09_G.nc
# /work/mh0033/m300466/icon-aes/icon-aes/experiments/dap0010-dc/icon_grid_0021_R02B06_G.nc


# there is also a R02B06 run done by me with reduced mixing length here: /work/mh0066/m300577/icon-aes-perpet/icon-aes/experiments
# grid file is ${DATA_DIR}/${exp_id}/icon_grid_0021_R02B06_G.nc

DATA_DIR=/work/mh0287/m300466/icon-dc/experiments
WORK_DIR=/work/mh0066/m300577

exp_id=dap0013-dc

#either 1x1 or 01x01
resolution="01x01"

var=prw

grid_text_file=${WORK_DIR}/perpetual_jan/01_degree_grid
ICON_grid_file=${DATA_DIR}/${exp_id}/icon_grid_0015_R02B09_G.nc
ICON_data_file=${DATA_DIR}/${exp_id}/${exp_id}_atm_2d_ml_19790101T000000Z.nc
weightfile=${WORK_DIR}/perpetual_jan/R02B09_to_${resolution}_weightfile.nc
gendis=false
all_vars=false

# 1 is pfull and wap, 2 is ua, va and 3 is for ta and hus
# ${exp_id}_atm_3d_3_ml_19790[1-3]??T000000Z.nc

cd ${DATA_DIR}/${exp_id}
#infiles=($(ls ${exp_id}_atm_3d_3_ml_19790[1-3]??T000000Z.nc))
infiles=($(ls ${exp_id}_atm_2d_ml_19790[2-9]??T000000Z.nc))

# ----- run script:

mkdir -p ${WORK_DIR}/perpetual_jan/${exp_id}

if  [ $gendis = true ]; then
	cdo gendis,${grid_text_file} -setgrid,${ICON_grid_file} ${ICON_data_file} ${weightfile}
fi

for file in ${infiles[@]}; do
	filename=${file%???}

  if [ $all_vars = true ]; then
    outfile=${filename}_allvars_${resolution}.nc
    echo $file
    cdo -P 8 -remap,${grid_text_file},${weightfile} ${DATA_DIR}/${exp_id}/${file} ${WORK_DIR}/perpetual_jan/${exp_id}/${outfile}

  else
    outfile=${filename}_${var}_${resolution}.nc
    echo $file
  	cdo -P 8 -remap,${grid_text_file},${weightfile} -selname,${var} ${DATA_DIR}/${exp_id}/${file} ${WORK_DIR}/perpetual_jan/${exp_id}/${outfile}

  fi



done

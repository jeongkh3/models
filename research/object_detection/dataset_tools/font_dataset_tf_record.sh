#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"

DATA_DIR=/Users/asher/dev/workspace/exercise/rcnn/tf-faster-rcnn/data/fontdataset
OUTPUT_DIR=/Users/asher/dev/workspace/exercise/test_dataset
LABEL_MAP_FILENAME=font_dataset_label_map.pbtxt
TRAIN_RECORD_FILENAME=font_dataset_trainval.record
TEST_RECORD_FILENAME=font_dataset_test.record

python create_fontdataset_label_map.py \
--data_dir="${DATA_DIR}" \
--output_path="${OUTPUT_DIR}/${LABEL_MAP_FILENAME}"

python create_fontdataset_tf_record.py \
--data_dir="${DATA_DIR}" \
--set=trainval \
--output_path="${OUTPUT_DIR}/${TRAIN_RECORD_FILENAME}" \
--label_map_path="${OUTPUT_DIR}/${LABEL_MAP_FILENAME}"

python create_fontdataset_tf_record.py \
--data_dir="${DATA_DIR}" \
--set=test \
--output_path="${OUTPUT_DIR}/${TEST_RECORD_FILENAME}" \
--label_map_path="${OUTPUT_DIR}/${LABEL_MAP_FILENAME}"
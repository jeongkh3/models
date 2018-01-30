#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"

python train.py \
--logtostderr \
--pipeline_config=/Users/asher/dev/workspace/exercise/test_models/model/ssd_inception_v2_fontdataset.config \
--train_dir=/Users/asher/dev/workspace/exercise/test_models/model/train
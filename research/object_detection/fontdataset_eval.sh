#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"

python eval.py \
--logtostderr \
--pipeline_config=/Users/asher/dev/workspace/exercise/test_models/model/ssd_inception_v2_fontdataset.config \
--checkpoint_dir=/Users/asher/dev/workspace/exercise/test_models/model/train
--eval_dir=/Users/asher/dev/workspace/exercise/test_models/model/eval
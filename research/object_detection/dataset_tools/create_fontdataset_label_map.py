'''
Read from labels.txt and make a 'pbtxt' format file (label map) from 'font dataset'.


Format example:

item {
  id: 1
  name: '가'
}

item {
  id: 2
  name: '나'
}
...

Example usage:
    python object_detection/dataset_tools/create_fontdataset_label_map.py \
        --data_dir=/home/user/font_dataset \
        --output_path=/home/user/font_dataset_label_map.pbtxt
'''

import tensorflow as tf
import os

flags = tf.app.flags
flags.DEFINE_string('data_dir', '', 'Root directory to font dataset.')
flags.DEFINE_string('output_path', '', 'Path to output pbtxt label map.')

FLAGS = flags.FLAGS

def make_label_map(data_dir, output_path):

    file_path = os.path.join(data_dir, 'labels.txt')

    with open(file_path, 'rt') as rf:
        classes = rf.read().splitlines()

    with open(output_path, 'wt', encoding='utf-8') as wf:
        for i, item in enumerate(classes):
            wf.write("item {\n")
            wf.write("  id: {}\n".format(i+1))
            wf.write("  name: '{}'\n".format(item))
            wf.write("}\n\n")

    print("Made a label map for {} of items.".format(len(classes)))

if __name__ == '__main__':
    make_label_map(FLAGS.data_dir, FLAGS.output_path)
    # make_label_map('/Users/asher/dev/workspace/exercise/rcnn/tf-faster-rcnn/data/fontdataset',
    #                '/Users/asher/dev/workspace/exercise/font_dataset_label_map.pbtxt')
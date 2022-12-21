#######################################################
DCASE 2020 Challenge Task 2 Additional Training Dataset
#######################################################

`<https://doi.org/10.5281/zenodo.3727685>`_

***********
Description
***********

This dataset is the "additional training dataset" for the **DCASE 2020
Challenge Task 2 "Unsupervised Detection of Anomalous Sounds for Machine
Condition Monitoring"** `[task description]
<http://dcase.community/challenge2020/task-unsupervised-detection-of-anomalous-sounds>`__. 

In the task, three datasets have been or will be released: "`development
dataset <http://zenodo.org/record/3678171>`__", "additional
training dataset", and "`evaluation dataset
<https://zenodo.org/record/3841772>`__". This additional training dataset was
released before the "`evaluation dataset
<https://zenodo.org/record/3841772>`__". This dataset includes around 1,000
normal samples for each Machine Type and Machine ID used in the `evaluation
dataset <https://zenodo.org/record/3841772>`__ and can be used for model
training in advance.

The recording procedure and data format are the same as the `development
dataset <http://zenodo.org/record/3678171>`__. The Machine IDs in this dataset
are different from those in the `development dataset
<http://zenodo.org/record/3678171>`__. For more information, please see the
pages of the `development dataset <http://zenodo.org/record/3678171>`__ and the
`task description
<http://dcase.community/challenge2020/task-unsupervised-detection-of-anomalous-sounds>`__. 

*******************
Directory structure
*******************

Once you unzip the downloaded files from Zenodo, you can see the following
directory structure. Machine Type information is given by directory name, and
Machine ID and condition information are given by file name, as:

/eval_data

-  /ToyCar

   -  /train (Only normal data for all Machine IDs are included.)

      -  /normal_id_05_00000000.wav
      -  ...
      -  /normal_id_05_00000999.wav
      -  /normal_id_06_00000000.wav
      -  ...
      -  /normal_id_07_00000999.wav

-  /ToyConveyor (The other Machine Types have the same directory
   structure as ToyCar.)
-  /fan
-  /pump
-  /slider
-  /valve

The paths of audio files are:

-  "/eval_data/<Machine_Type>/train/normal_id_<Machine_ID>_[0-9]+.wav"

For example, the Machine Type and Machine ID
of "/ToyCar/train/normal_id_05_00000000.wav" are "ToyCar" and "05",
respectively, and its condition is normal (This dataset includes only normal
samples). 

***************
Baseline system
***************

A simple baseline system is available on the Github repository `[URL]
<https://github.com/y-kawagu/dcase2020_task2_baseline>`__. The baseline system
provides a simple entry-level approach that gives a reasonable performance in
the dataset of Task 2. It is a good starting point, especially for entry-level
researchers who want to get familiar with the anomalous-sound-detection task.

*****************
Conditions of use
*****************

This dataset was created jointly by **NTT Corporation** and **Hitachi,
Ltd.** and is available under a Creative Commons
Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)
license.

***********
Publication
***********

If you use this dataset, please cite **all the following three papers**:

Yuma Koizumi, Shoichiro Saito, Noboru Harada, Hisashi Uematsu, and Keisuke
Imoto, "ToyADMOS: A Dataset of Miniature-Machine Operating Sounds for Anomalous
Sound Detection," in Proc. of IEEE Workshop on Applications of Signal
Processing to Audio and Acoustics (WASPAA), 2019. `[pdf]
<https://ieeexplore.ieee.org/document/8937164>`__

Harsh Purohit, Ryo Tanabe, Kenji Ichige, Takashi Endo, Yuki Nikaido, Kaori
Suefusa, and Yohei Kawaguchi, “MIMII Dataset: Sound Dataset for Malfunctioning
Industrial Machine Investigation and Inspection,” in Proc. 4th Workshop on
Detection and Classification of Acoustic Scenes and Events (DCASE),
2019. `[pdf]
<http://dcase.community/documents/workshop2019/proceedings/DCASE2019Workshop_Purohit_21.pdf>`__

Yuma Koizumi, Yohei Kawaguchi, Keisuke Imoto, Toshiki Nakamura, Yuki Nikaido,
Ryo Tanabe, Harsh Purohit, Kaori Suefusa, Takashi Endo, Masahiro Yasuda, and
Noboru Harada, "Description and Discussion on DCASE2020 Challenge Task2:
Unsupervised Anomalous Sound Detection for Machine Condition Monitoring\
*,"* in Proc. 5th Workshop on Detection and Classification of Acoustic Scenes
and Events (DCASE), 2020. `[pdf]
<https://dcase.community/documents/workshop2020/proceedings/DCASE2020Workshop_Koizumi_3.pdf>`__

********
Feedback
********

If there is any problem, please contact us:

-  Yuma Koizumi, koizumi.yuma@ieee.org
-  Yohei Kawaguchi, yohei.kawaguchi.xk@hitachi.com
-  Keisuke Imoto, keisuke.imoto@ieee.org

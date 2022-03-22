#!/bin/bash
export PYTHONPATH="${PYTHONPATH}:/workspace/code"
export GPU_ID=0

export TRAIN_FILE=../../../data/datasets/debug_data/train.txt
export TEST_FILE=../../../data/datasets/debug_data/test.txt
# export PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:21
echo $PYTHONPATH

CUDA_VISIBLE_DEVICES=$GPU_ID python ../../examples/big_ae/run_lm_vae_training.py \
    --output_dir=../../../output/LM/Snli/local_lm_vae_snli_optimus \
    --dataset Snli \
    --encoder_model_type=bert \
    --encoder_model_name_or_path=bert-base-cased \
    --decoder_model_type=gpt2 \
    --decoder_model_name_or_path=gpt2 \
    --beta 1.0 \
    --ratio_zero 0.5 \
    --ratio_increase 0.25 \
    --do_train \
    --do_eval \
    --fb_mode 1 \
    --dim_target_kl 0.5\
    --train_data_file=$TRAIN_FILE \
    --eval_data_file=$TEST_FILE \
    --num_train_epochs 1.0 \
    --save_steps 1000 \
    --logging_steps 1000 \
    --overwrite_output_dir \
    --per_gpu_train_batch_size=1 \
    --block_size 100 \
    --length_weighted_loss \
    --use_pretrained_model \
    --use_pretrained_vae \
    --checkpoint_dir ../../../output/pretrain/philly_rr3_vc4_g8_base_vae_wikipedia_pretraining_beta_schedule_beta0.5_d1.0_ro0.5_ra0.25_32_v2/checkpoint-508523 \
    --gloabl_step_eval 508523 \
    --latent_size 32

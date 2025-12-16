#!/bin/bash
ffmpeg -i $1 -acodec pcm_u8 -f u8 -filter:a "volume=0.7" -ac 1 -ar 8000 click.raw

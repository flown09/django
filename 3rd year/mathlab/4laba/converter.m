function [hours, minutes, seconds] = converter(sec)
hours = floor(sec / 3600);
minutes = floor((sec - hours * 3600) / 60);
seconds = sec - hours * 3600 - minutes * 60;

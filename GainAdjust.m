function [ GainOut, GainChangeFlag] = GainAdjust( Signal, GainIn)

GAIN_ADJUST_MIN_GAIN = 77;
GAIN_ADJUST_MAX_GAIN = 155;
GAIN_ADJUST_MAX_SIGNAL_VAL = 4000;
GAIN_ADJUST_MIN_SIGNAL_VAL = 200;
GAIN_ADJUST_TO_INC_VAL = 3600;

GainChange = 0;

 s = Signal;
 sMin = min(s);
 sMax = max(s);

 if ( GainIn > GAIN_ADJUST_MIN_GAIN) && ...
    ( sMax > GAIN_ADJUST_MAX_SIGNAL_VAL || sMin <= 0)
 	GainChange = -1;
 end

 if ( GainIn < GAIN_ADJUST_MAX_GAIN) && ...
    ( sMax < GAIN_ADJUST_TO_INC_VAL && sMin > GAIN_ADJUST_MIN_SIGNAL_VAL)
	GainChange = 1;
 end

 GainOut = GainIn + GainChange;
 GainChangeFlag = logical( GainChange);

end
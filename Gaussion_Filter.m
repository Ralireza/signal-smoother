function [output_vector] = Gaussion_Filter(input_vector,window_number)
    wind = gausswin(window_number);
    output_vector = filter(wind,1,input_vector);
end


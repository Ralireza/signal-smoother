function [first_col,second_col,third_col,fourth_col] = file_reader(file_address)

    file_id=fopen(file_address);
    array=textscan(file_id,'%f%f%f%f');

    first_col=array{1,1};
    second_col=array{1,2};
    third_col=array{1,3};
    fourth_col=array{1,4};

    fclose(file_id);

end


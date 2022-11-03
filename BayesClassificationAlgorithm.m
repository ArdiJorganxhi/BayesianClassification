


classes = {'C1','C2','C3'};
classMatrixes = {C1,C2,C3};

x1 = [6,8]';
x2 = [-5,-3]';
x3 = [12,0]';

vectors = {x1,x2,x3};

for i = 1:length(vectors)

    classValues = {0,0,0};
    for j = 1:length(classes)
        m = mean(transpose(classMatrixes{1,j}));
        S = cov(classMatrixes{1,j}');
        x = vectors{1,i};
        classValues{1,j} =  comp_gauss_dens_val(m',S,x);
    end

    disp("x" + i +"_pdf = "+ classValues{1,1} + "_for_C1, "+ classValues{1,2} + "_for_C2, "+ classValues{1,3} + "_for_C3");

    maxValue = max(cell2mat(classValues));
    for j = 1:length(classValues)
        if(maxValue == classValues{1,j})
            disp("x" + i + " belongs to class " + classes{1,j});
        end
    end
    disp(" ");
end